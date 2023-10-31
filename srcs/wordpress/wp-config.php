<?php
define('DB_NAME', getenv('WP_DB_NAME') ?: 'wordpress');
define('DB_ROOT', getenv('ROOT_DB_USER') ?: 'wordpress');
define('DB_ROOT_PASSWORD', getenv('ROOT_DB_PASS') ?: 'password');
define('DB_USER', getenv('WP_DB_USER') ?: 'wordpress');
define('DB_PASSWORD', getenv('WP_DB_PASSWORD') ?: 'password');
define('DB_HOST', getenv('WP_DB_HOST') ?: 'database');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys
 */
define('AUTH_KEY',         getenv('AUTH_KEY') ?: 'tu_clave_única');
define('SECURE_AUTH_KEY',  getenv('SECURE_AUTH_KEY') ?: 'tu_clave_única');
define('LOGGED_IN_KEY',    getenv('LOGGED_IN_KEY') ?: 'tu_clave_única');
define('NONCE_KEY',        getenv('NONCE_KEY') ?: 'tu_clave_única');
define('AUTH_SALT',        getenv('AUTH_SALT') ?: 'tu_clave_única');
define('SECURE_AUTH_SALT', getenv('SECURE_AUTH_SALT') ?: 'tu_clave_única');
define('LOGGED_IN_SALT',   getenv('LOGGED_IN_SALT') ?: 'tu_clave_única');
define('NONCE_SALT',       getenv('NONCE_SALT') ?: 'tu_clave_única');

/**#@-*/

$table_prefix = 'wp_';

define('WP_DEBUG', false);

/* ¡Eso es todo, deja de editar! Feliz publicación. */

/** Camino absoluto al directorio de WordPress. */
if (!defined('ABSPATH'))
	define('ABSPATH', dirname(__FILE__) . '/');

/** Configura las variables de WordPress y sus archivos include. */
require_once(ABSPATH . 'wp-settings.php');
