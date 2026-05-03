<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'TEST' );

/** Database username */
define( 'DB_USER', 'KOUKOU' );

/** Database password */
define( 'DB_PASSWORD', '1234' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          'DuemlJ*zbkL[I.s0aL!>6NCCbQuOJ)OOzRJ[5rQZ&LJboFYoOK:,aReQXal{25a6' );
define( 'SECURE_AUTH_KEY',   'a/vFw{i9gU#.npU}Fzn-|a*d,%?=-=N,EoWV1$-`Q2}<lyO(PF}LPyx%KBEIj,f=' );
define( 'LOGGED_IN_KEY',     '#-BG-6VH8:8,xGe0uAf9z)U/z[9EuqfUaC?khzZhkjtTlm Ur^hZtJ[ck_h]A=c`' );
define( 'NONCE_KEY',         'X`?xRCpOmcD?sOak@uJ4;:0u6KOyaL|?M]d@?GZ{|NpYF:K0]J/NOpzN)ow@Tx*-' );
define( 'AUTH_SALT',         '}{M$^tCc]1Ki-GfOQ6ef:?[+aDim$H}:79V}D{J,+~s]lgf=}xm!*xd{i+C~*LR,' );
define( 'SECURE_AUTH_SALT',  '~fy{|DU, @]TR(Xt*.Q=ZT,?,_j&>tLePjfTNqsKWnG3_/XnUkXc(q+~Y?]52Vm*' );
define( 'LOGGED_IN_SALT',    'xNm3p)eL^:+_M@dMFBJ2u+z3[(hdl5R ffW02;R,(^/_A6yPDr#T:3 2HHg_zvE,' );
define( 'NONCE_SALT',        '|eAg]<MM>5CAyB7I-Tx.|60!L}8.b)ggEsBoHR&x^cumjqxAK!sQ|s*<Uzo4YP=b' );
define( 'WP_CACHE_KEY_SALT', 'K?;^k#|s7]zN;X>gh/`Zb#tq{n,L&H!k_LtIC43r:lA82O0dgQfri=QLr*n]6G|0' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
