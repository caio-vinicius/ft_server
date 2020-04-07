<?php
define( 'DB_NAME', 'wordpress' );
define( 'DB_USER', 'caio' );
define( 'DB_PASSWORD', '1234' );
define( 'DB_HOST', 'localhost' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );

define( 'AUTH_KEY',         'hlYcG1D8ERfLM0hw95xN12iqG5bJDT9SY5FH1ZvIz9ExiakMbHgBFxCvO11PBNUh' );
define( 'SECURE_AUTH_KEY',  'fsb8ASYj5qn0oBPbOCRLuHeR2HHaiYpVKMAkMbMxJCYaCPDiby0riYmxWOM0pkNC' );
define( 'LOGGED_IN_KEY',    '5AVxdoPOFfvYnC2LbtMbdTIkpFn6EV6YX1gWmhipcJpkZuH5Okyrw5OWanBTewH8' );
define( 'NONCE_KEY',        'RsRi1Vn7zwJD06SpXlLJm42jzWYBA0d8vlruJR8NeTMfzYVuh7pzRzNTN6Gv9p7G' );
define( 'AUTH_SALT',        'hnCbY38BqMnj9dsGorrrMoNcQwpjkhCklLxqQf15uy1qAZjbchlwl9Y3WVifnaky' );
define( 'SECURE_AUTH_SALT', 'd7WXDiMn6rTx3wXrrQcNZwePa3DMWhu8RNEPIKkEiWOr09lMgPxRwvoE3LqKNdlu' );
define( 'LOGGED_IN_SALT',   'dZLHebSSYKJ7wt9sItfmw36HSRRZyXL9rNthl0oRlhtEXITw9GY5uZON21vjm5J4' );
define( 'NONCE_SALT',       'E026w6B4Mji9qFUhzkmMatI9C4QooX6ScAR5t1vF21Obpt5VoUuVyent3CZbOM65' );

$table_prefix = 'wp_';

define( 'WP_DEBUG', false );

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';
