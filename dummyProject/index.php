<?php

define('NGN_PATH', 'E:\www\ngn\env/ngn');
define('VENDORS_PATH', 'E:\www\ngn/vendors');
define('SITE_PATH', __DIR__.'/site');
define('WEBROOT_PATH', __DIR__);

if (isset($_COOKIE['tester'])) {
  define('IS_DEBUG', true);
  define('IS_DEVELOPER', true);
}
require_once SITE_PATH.'/config/constants/core.php';
require_once NGN_PATH.'/init/site-web.php';

if ($_SERVER['HTTP_HOST'] != SITE_DOMAIN)                                       // @subdomainsRemove
  header('Location: http://'.SITE_DOMAIN.$_SERVER['REQUEST_URI'].               // @subdomainsRemove
    (!empty($_SERVER['QUERY_STRING']) ? '?'.$_SERVER['QUERY_STRING'] : '' ));   // @subdomainsRemove

print DispatcherManager::get()->dispatch()->getOutput();
