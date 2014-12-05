# OwnCloud DB-Node
#

class owncloud::dbnode(
  $root_db_password,
  $owncloud_db_password,
  $db_monitor_host,
  $owncloud_db_name='ownclouddb',
  $owncloud_db_user='owncloud',
  $db_monitor_user='nagios',
  $db_monitor_password='nagios',
  $node_ip=$::ipaddress,
  $node_name=$::fqdn,
  $node_ips,
)
{
  include apt

  mounts {'OC DB-Files': source => '/dev/sdb1', dest => '/ocdbfiles', type => 'btrfs', opts => 'rw,relatime,space_cache' }

  case $::operatingsystem {
    'ubuntu': {
      apt::source { 'mariadb':
        location   => 'http://mirror.netcologne.de/mariadb/repo/5.5/ubuntu',
        release    => 'saucy',
        repos      => 'main',
        key        => '1BB943DB',
        key_server => 'hkp://keyserver.ubuntu.com:80',
      }
    }
    'debian': {
        apt::source { 'mariadb':
          location   => 'http://mirror2.hs-esslingen.de/mariadb/repo/5.5/debian',
          release    => 'wheezy',
          repos      => 'main',
          key        => '1BB943DB',
          key_server => 'hkp://keyserver.ubuntu.com:80',
      }
    }
  }

  package { 'galera':
    ensure  => latest,
    require  => [Apt::Source['mariadb'],Package['rsync']],
  }
  
  package { 'rsync':
    ensure  => latest,
  }

  class { 'mysql::server':
    root_password => $root_db_password,
    package_name  => 'mariadb-galera-server',
    require      => [Package['galera'],Mounts['OC DB-Files']],
    override_options => {
      'mysqld' => {
        'bind_address' => $::ipaddress,
        'datadir' => '/ocdbfiles',
      },},
  }

  class { 'mysql::server::monitor':
    mysql_monitor_username  => $db_monitor_user,
    mysql_monitor_password  => $db_monitor_password,
    mysql_monitor_hostname  => $db_monitor_host,
  }

  # Creates a database with a user and assign some privileges
  mysql::db { $owncloud_db_name:
    user     => $owncloud_db_user,
    password => $owncloud_db_password,
    host     => '141.22.30.%',
    grant    => ['all'],
  }
  
  nagios::service{ 'galera_cluster_node':
    service_description => 'OwnCloud galera cluster node DB',
    check_command => 'check_mysql_cmdlinecred!nagios!nagios',
    contact_groups => 'ail-admins',
  }
  
  file { '/etc/mysql/conf.d/cluster.cnf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('owncloud/etc/mysql/conf.d/cluster.cnf.erb'),
    #notify  => Service[$owncloud::dbnode]
  }
  
  file { '/etc/mysql/debian.cnf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/site/ocgalera/debian.cnf'
  }
}