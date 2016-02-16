# Simple OwnCloud module.
#
class owncloud (
  $enterprise_community                       = $owncloue::params::enterprise_community,
  $instanceid                                 = $owncloud::params::instanceid,
  $passwordsalt                               = $owncloud::params::passwordsalt,
  $trusted_domains                            = $owncloud::params::trusted_domains,
  $datadirectory                              = $owncloud::params::datadirectory,
  $version                                    = $owncloud::params::version,
  $dbtype                                     = $owncloud::params::dbtype,
  $dbhost                                     = $owncloud::params::dbhost,
  $dbname                                     = $owncloud::params::dbname,
  $dbuser                                     = $owncloud::params::dbuser,
  $dbpassword                                 = $owncloud::params::dbpassword,
  $dbtableprefix                              = $owncloud::params::dbtableprefix,
  $installed                                  = $owncloud::params::installed,
  $default_language                           = $owncloud::params::default_language,
  $defaultapp                                 = $owncloud::params::defaultapp,
  $knowledgebaseenabled                       = $owncloud::params::knowledgebaseenabled,
  $enable_avatars                             = $owncloud::params::enable_avatars,
  $allow_user_to_change_display_name          = $owncloud::params::allow_user_to_change_display_name,
  $remember_login_cookie_lifetime             = $owncloud::params::remember_login_cookie_lifetime,
  $session_lifetime                           = $owncloud::params::session_lifetime,
  $session_keepalive                          = $owncloud::params::session_keepalive,
  $skeletondirectory                          = $owncloud::params::skeletondirectory,
  $user_backends                              = $owncloud::params::user_backends,
  $lost_password_link                         = $owncloud::params::lost_password_link,
  $mail_domain                                = $owncloud::params::mail_domain,
  $mail_from_address                          = $owncloud::params::mail_from_address,
  $mail_smtpdebug                             = $owncloud::params::mail_smtpdebug,
  $mail_smtpmode                              = $owncloud::params::mail_smtpmode,
  $mail_smtphost                              = $owncloud::params::mail_smtphost,
  $mail_smtpport                              = $owncloud::params::mail_smtpport,
  $mail_smtptimeout                           = $owncloud::params::mail_smtptimeout,
  $mail_smtpsecure                            = $owncloud::params::mail_smtpsecure,
  $mail_smtpauth                              = $owncloud::params::mail_smtpauth,
  $mail_smtpauthtype                          = $owncloud::params::mail_smtpauthtype,
  $mail_smtpname                              = $owncloud::params::mail_smtpname,
  $mail_smtppassword                          = $owncloud::params::mail_smtppassword,
  $overwritehost                              = $owncloud::params::overwritehost,
  $overwriteprotocol                          = $owncloud::params::overwriteprotocol,
  $overwritewebroot                           = $owncloud::params::overwritewebroot,
  $overwritecondaddr                          = $owncloud::params::overwritecondaddr,
  $overwrite_cli_url                          = $owncloud::params::overwrite_cli_url,
  $proxy                                      = $owncloud::params::proxy,
  $proxyuserpwd                               = $owncloud::params::proxyuserpwd,
  $trashbin_retention_obligation              = $owncloud::params::trashbin_retention_obligation,
  $versions_retention_obligation              = $owncloud::params::versions_retention_obligation,
  $appcodechecker                             = $owncloud::params::appcodechecker,
  $updatechecker                              = $owncloud::params::updatechecker,
  $has_internet_connection                    = $owncloud::params::has_internet_connection,
  $check_for_working_webdav                   = $owncloud::params::check_for_working_webdav,
  $check_for_working_wellknown_setup          = $owncloud::params::check_for_working_wellknown_setup,
  $check_for_working_htaccess                 = $owncloud::params::check_for_working_htaccess,
  $config_is_read_only                        = $owncloud::params::config_is_read_only,
  $log_type                                   = $owncloud::params::log_type,
  $logfile                                    = $owncloud::params::logfile,
  $oc_loglevel                                = $owncloud::params::oc_loglevel,
  $syslog_tag                                 = $owncloud::params::syslog_tag,
  $log_condition                              = $owncloud::params::log_condition,
  $logdateformat                              = $owncloud::params::logdateformat,
  $logtimezone                                = $owncloud::params::logtimezone,
  $log_query                                  = $owncloud::params::log_query,
  $cron_log                                   = $owncloud::params::cron_log,
  $cron_lockfile_location                     = $owncloud::params::log_rotate_size,
  $log_rotate_size                            = $owncloud::params::false,
  $3rdpartyroot                               = $owncloud::params::3rdpartyroot,
  $3rdpartyurl                                = $owncloud::params::3rdpartyurl,
  $customclient_desktop                       = $owncloud::params::customclient_desktop,
  $customclient_android                       = $owncloud::params::customclient_android,
  $customclient_ios                           = $owncloud::params::customclient_ios,
  $appstoreenabled                            = $owncloud::params::appstoreenabled,
  $appstoreurl                                = $owncloud::params::appstoreurl,
  $appstore_experimental_enabled              = $owncloud::params::appstore_experimental_enabled,
  $apps_paths                                 = $owncloud::params::apps_paths,
  $enable_previews                            = $owncloud::params::enable_previews,
  $preview_max_x                              = $owncloud::params::preview_max_x,
  $preview_max_y                              = $owncloud::params::preview_max_y,
  $preview_max_scale_factor                   = $owncloud::params::preview_max_scale_factor,
  $preview_max_filesize_image                 = $owncloud::params::preview_max_filesize_image,
  $preview_libreoffice_path                   = $owncloud::params::preview_libreoffice_path,
  $preview_office_cl_parameters               = $owncloud::params::preview_office_cl_parameters,
  $enabledPreviewProviders                    = $owncloud::params::enabledPreviewProviders,
  $ldapUserCleanupInterval                    = $owncloud::params::ldapUserCleanupInterval,
  $comments_managerFactory                    = $owncloud::params::comments_managerFactory,
  $systemtags_managerFactory                  = $owncloud::params::systemtags_managerFactory,
  $maintenance                                = $owncloud::params::maintenance,
  $singleuser                                 = $owncloud::params::singleuser,
  $openssl                                    = $owncloud::params::openssl,
  $enable_certificate_management              = $owncloud::params::enable_certificate_management,
  $memcache_local                             = $owncloud::params::memcache_local,
  $memcache_distributed                       = $owncloud::params::memcache_distributed,
  $redis                                      = $owncloud::params::redis,
  $memcached_servers                          = $owncloud::params::memcached_servers,
  $cache_path                                 = $owncloud::params::cache_path,
  $objectstore                                = $owncloud::params::objectstore,
  $sharing_managerFactory                     = $owncloud::params::sharing_managerFactory,
  $dbdriveroptions                            = $owncloud::params::dbdriveroptions,
  $sqlite_journal_mode                        = $owncloud::params::sqlite_journal_mode,
  $supportedDatabases                         = $owncloud::params::supportedDatabases,
  $tempdirectory                              = $owncloud::params::tempdirectory,
  $hashingCost                                = $owncloud::params::hashingCost,
  $blacklisted_files                          = $owncloud::params::blacklisted_files,
  $share_folder                               = $owncloud::params::share_folder,
  $theme                                      = $owncloud::params::theme,
  $cipher                                     = $owncloud::params::cipher,
  $minimum_supported_desktop_version          = $owncloud::params::minimum_supported_desktop_version,
  $quota_include_external_storage             = $owncloud::params::quota_include_external_storage,
  $filesystem_check_changes                   = $owncloud::params::filesystem_check_changes,
  $asset_pipeline_enabled                     = $owncloud::params::asset_pipeline_enabled,
  $assetdirectory                             = $owncloud::params::assetdirectory,
  $mount_file                                 = $owncloud::params::mount_file,
  $filesystem_cache_readonly                  = $owncloud::params::filesystem_cache_readonly,
  $secret                                     = $owncloud::params::secret,
  $trusted_proxies                            = $owncloud::params::trusted_proxies,
  $forwarded_for_headers                      = $owncloud::params::forwarded_for_headers,
  $max_filesize_animated_gifs_public_sharing  = $owncloud::params::max_filesize_animated_gifs_public_sharing,
  $filelocking_enabled                        = $owncloud::params::filelocking_enabled,
  $memcache_locking                           = $owncloud::params::memcache_locking,
  $debug                                      = $owncloud::params::debug,
  $copied_sample_config                       = $owncloud::params::copied_sample_config,
) inherits owncloud::params{

  # TODO: validate parameters
}

