package wp.extern;

extern class LoadApi implements wp.util.ApiFunctions {
  /**
    
     Return the HTTP protocol sent by the server.
    
     @since 4.4.0
    
     @return string The HTTP protocol. Default: HTTP/1.0.
    
  **/
  public function wp_get_server_protocol():String;
  /**
    
     Turn register globals off.
    
     @since 2.1.0
     @access private
    
  **/
  public function wp_unregister_GLOBALS():Void;
  /**
    
     Fix `$_SERVER` variables for various setups.
    
     @since 3.0.0
     @access private
    
     @global string $PHP_SELF The filename of the currently executing script,
                              relative to the document root.
    
  **/
  public function wp_fix_server_vars():Void;
  /**
    
     Check for the required PHP version, and the MySQL extension or
     a database drop-in.
    
     Dies if requirements are not met.
    
     @since 3.0.0
     @access private
    
     @global string $required_php_version The required PHP version string.
     @global string $wp_version           The WordPress version string.
    
  **/
  public function wp_check_php_mysql_versions():Void;
  /**
    
     Don't load all of WordPress when handling a favicon.ico request.
    
     Instead, send the headers for a zero-length favicon and bail.
    
     @since 3.0.0
    
  **/
  public function wp_favicon_request():Void;
  /**
    
     Die with a maintenance message when conditions are met.
    
     Checks for a file in the WordPress root directory named ".maintenance".
     This file will contain the variable $upgrading, set to the time the file
     was created. If the file was created less than 10 minutes ago, WordPress
     enters maintenance mode and displays a message.
    
     The default message can be replaced by using a drop-in (maintenance.php in
     the wp-content directory).
    
     @since 3.0.0
     @access private
    
     @global int $upgrading the unix timestamp marking when upgrading WordPress began.
    
  **/
  public function wp_maintenance():Void;
  /**
    
     Start the WordPress micro-timer.
    
     @since 0.71
     @access private
    
     @global float $timestart Unix timestamp set at the beginning of the page load.
     @see timer_stop()
    
     @return bool Always returns true.
    
  **/
  public function timer_start():Bool;
  /**
    
     Retrieve or display the time from the page start to when function is called.
    
     @since 0.71
    
     @global float   $timestart Seconds from when timer_start() is called.
     @global float   $timeend   Seconds from when function is called.
    
     @param int|bool $display   Whether to echo or return the results. Accepts 0|false for return,
                                1|true for echo. Default 0|false.
     @param int      $precision The number of digits from the right of the decimal to display.
                                Default 3.
     @return string The "second.microsecond" finished time calculation. The number is formatted
                    for human consumption, both localized and rounded.
    
  **/
  public function timer_stop(display:haxe.extern.EitherType<Int, Bool> = 0, precision:Int = 3):String;
  /**
    
     Set PHP error reporting based on WordPress debug settings.
    
     Uses three constants: `WP_DEBUG`, `WP_DEBUG_DISPLAY`, and `WP_DEBUG_LOG`.
     All three can be defined in wp-config.php. By default, `WP_DEBUG` and
     `WP_DEBUG_LOG` are set to false, and `WP_DEBUG_DISPLAY` is set to true.
    
     When `WP_DEBUG` is true, all PHP notices are reported. WordPress will also
     display internal notices: when a deprecated WordPress function, function
     argument, or file is used. Deprecated code may be removed from a later
     version.
    
     It is strongly recommended that plugin and theme developers use `WP_DEBUG`
     in their development environments.
    
     `WP_DEBUG_DISPLAY` and `WP_DEBUG_LOG` perform no function unless `WP_DEBUG`
     is true.
    
     When `WP_DEBUG_DISPLAY` is true, WordPress will force errors to be displayed.
     `WP_DEBUG_DISPLAY` defaults to true. Defining it as null prevents WordPress
     from changing the global configuration setting. Defining `WP_DEBUG_DISPLAY`
     as false will force errors to be hidden.
    
     When `WP_DEBUG_LOG` is true, errors will be logged to `wp-content/debug.log`.
     When `WP_DEBUG_LOG` is a valid path, errors will be logged to the specified file.
    
     Errors are never displayed for XML-RPC, REST, and Ajax requests.
    
     @since 3.0.0
     @since 5.1.0 `WP_DEBUG_LOG` can be a file path.
     @access private
    
  **/
  public function wp_debug_mode():Void;
  /**
    
     Set the location of the language directory.
    
     To set directory manually, define the `WP_LANG_DIR` constant
     in wp-config.php.
    
     If the language directory exists within `WP_CONTENT_DIR`, it
     is used. Otherwise the language directory is assumed to live
     in `WPINC`.
    
     @since 3.0.0
     @access private
    
  **/
  public function wp_set_lang_dir():Void;
  /**
    
     Load the database class file and instantiate the `$wpdb` global.
    
     @since 2.5.0
    
     @global wpdb $wpdb The WordPress database class.
    
  **/
  public function require_wp_db():Void;
  /**
    
     Set the database table prefix and the format specifiers for database
     table columns.
    
     Columns not listed here default to `%s`.
    
     @since 3.0.0
     @access private
    
     @global wpdb   $wpdb         The WordPress database class.
     @global string $table_prefix The database table prefix.
    
  **/
  public function wp_set_wpdb_vars():Void;
  /**
    
     Toggle `$_wp_using_ext_object_cache` on and off without directly
     touching global.
    
     @since 3.7.0
    
     @global bool $_wp_using_ext_object_cache
    
     @param bool $using Whether external object cache is being used.
     @return bool The current 'using' setting.
    
  **/
  public function wp_using_ext_object_cache(using:Bool = null):Bool;
  /**
    
     Start the WordPress object cache.
    
     If an object-cache.php file exists in the wp-content directory,
     it uses that drop-in as an external object cache.
    
     @since 3.0.0
     @access private
    
     @global array $wp_filter Stores all of the filters.
    
  **/
  public function wp_start_object_cache():Void;
  /**
    
     Redirect to the installer if WordPress is not installed.
    
     Dies with an error message when Multisite is enabled.
    
     @since 3.0.0
     @access private
    
  **/
  public function wp_not_installed():Void;
  /**
    
     Retrieve an array of must-use plugin files.
    
     The default directory is wp-content/mu-plugins. To change the default
     directory manually, define `WPMU_PLUGIN_DIR` and `WPMU_PLUGIN_URL`
     in wp-config.php.
    
     @since 3.0.0
     @access private
    
     @return array Files to include.
    
  **/
  public function wp_get_mu_plugins():php.NativeArray;
  /**
    
     Retrieve an array of active and valid plugin files.
    
     While upgrading or installing WordPress, no plugins are returned.
    
     The default directory is `wp-content/plugins`. To change the default
     directory manually, define `WP_PLUGIN_DIR` and `WP_PLUGIN_URL`
     in `wp-config.php`.
    
     @since 3.0.0
     @access private
    
     @return string[] $plugin_file Array of paths to plugin files relative to the plugins directory.
    
  **/
  public function wp_get_active_and_valid_plugins():php.NativeIndexedArray<String>;
  /**
    
     Retrieves an array of active and valid themes.
    
     While upgrading or installing WordPress, no themes are returned.
    
     @since 5.1.0
     @access private
    
     @return array Array of paths to theme directories.
    
  **/
  public function wp_get_active_and_valid_themes():php.NativeArray;
  /**
    
     Set internal encoding.
    
     In most cases the default internal encoding is latin1, which is
     of no use, since we want to use the `mb_` functions for `utf-8` strings.
    
     @since 3.0.0
     @access private
    
  **/
  public function wp_set_internal_encoding():Void;
  /**
    
     Add magic quotes to `$_GET`, `$_POST`, `$_COOKIE`, and `$_SERVER`.
    
     Also forces `$_REQUEST` to be `$_GET + $_POST`. If `$_SERVER`,
     `$_COOKIE`, or `$_ENV` are needed, use those superglobals directly.
    
     @since 3.0.0
     @access private
    
  **/
  public function wp_magic_quotes():Void;
  /**
    
     Runs just before PHP shuts down execution.
    
     @since 1.2.0
     @access private
    
  **/
  public function shutdown_action_hook():Void;
  /**
    
     Copy an object.
    
     @since 2.7.0
     @deprecated 3.2.0
    
     @param object $object The object to clone.
     @return object The cloned object.
    
  **/
  public function wp_clone(object:Dynamic):Dynamic;
  /**
    
     Determines whether the current request is for an administrative interface page.
    
     Does not check if the user is an administrator; use current_user_can()
     for checking roles and capabilities.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 1.5.1
    
     @global WP_Screen $current_screen
    
     @return bool True if inside WordPress administration interface, false otherwise.
    
  **/
  public function is_admin():Bool;
  /**
    
     Whether the current request is for a site's admininstrative interface.
    
     e.g. `/wp-admin/`
    
     Does not check if the user is an administrator; use current_user_can()
     for checking roles and capabilities.
    
     @since 3.1.0
    
     @global WP_Screen $current_screen
    
     @return bool True if inside WordPress blog administration pages.
    
  **/
  public function is_blog_admin():Bool;
  /**
    
     Whether the current request is for the network administrative interface.
    
     e.g. `/wp-admin/network/`
    
     Does not check if the user is an administrator; use current_user_can()
     for checking roles and capabilities.
    
     @since 3.1.0
    
     @global WP_Screen $current_screen
    
     @return bool True if inside WordPress network administration pages.
    
  **/
  public function is_network_admin():Bool;
  /**
    
     Whether the current request is for a user admin screen.
    
     e.g. `/wp-admin/user/`
    
     Does not check if the user is an administrator; use current_user_can()
     for checking roles and capabilities.
    
     @since 3.1.0
    
     @global WP_Screen $current_screen
    
     @return bool True if inside WordPress user administration pages.
    
  **/
  public function is_user_admin():Bool;
  /**
    
     If Multisite is enabled.
    
     @since 3.0.0
    
     @return bool True if Multisite is enabled, false otherwise.
    
  **/
  public function is_multisite():Bool;
  /**
    
     Retrieve the current site ID.
    
     @since 3.1.0
    
     @global int $blog_id
    
     @return int Site ID.
    
  **/
  public function get_current_blog_id():Int;
  /**
    
     Retrieves the current network ID.
    
     @since 4.6.0
    
     @return int The ID of the current network.
    
  **/
  public function get_current_network_id():Int;
  /**
    
     Attempt an early load of translations.
    
     Used for errors encountered during the initial loading process, before
     the locale has been properly detected and loaded.
    
     Designed for unusual load sequences (like setup-config.php) or for when
     the script will then terminate with an error, otherwise there is a risk
     that a file can be double-included.
    
     @since 3.4.0
     @access private
    
     @global WP_Locale $wp_locale The WordPress date and time locale object.
    
     @staticvar bool $loaded
    
  **/
  public function wp_load_translations_early():Void;
  /**
    
     Check or set whether WordPress is in "installation" mode.
    
     If the `WP_INSTALLING` constant is defined during the bootstrap, `wp_installing()` will default to `true`.
    
     @since 4.4.0
    
     @staticvar bool $installing
    
     @param bool $is_installing Optional. True to set WP into Installing mode, false to turn Installing mode off.
                                Omit this parameter if you only want to fetch the current status.
     @return bool True if WP is installing, otherwise false. When a `$is_installing` is passed, the function will
                  report whether WP was in installing mode prior to the change to `$is_installing`.
    
  **/
  public function wp_installing(is_installing:Bool = null):Bool;
  /**
    
     Determines if SSL is used.
    
     @since 2.6.0
     @since 4.6.0 Moved from functions.php to load.php.
    
     @return bool True if SSL, otherwise false.
    
  **/
  public function is_ssl():Bool;
  /**
    
     Converts a shorthand byte value to an integer byte value.
    
     @since 2.3.0
     @since 4.6.0 Moved from media.php to load.php.
    
     @link https://secure.php.net/manual/en/function.ini-get.php
     @link https://secure.php.net/manual/en/faq.using.php#faq.using.shorthandbytes
    
     @param string $value A (PHP ini) byte value, either shorthand or ordinary.
     @return int An integer byte value.
    
  **/
  public function wp_convert_hr_to_bytes(value:String):Int;
  /**
    
     Determines whether a PHP ini value is changeable at runtime.
    
     @since 4.6.0
    
     @staticvar array $ini_all
    
     @link https://secure.php.net/manual/en/function.ini-get-all.php
    
     @param string $setting The name of the ini setting to check.
     @return bool True if the value is changeable at runtime. False otherwise.
    
  **/
  public function wp_is_ini_value_changeable(setting:String):Bool;
  /**
    
     Determines whether the current request is a WordPress Ajax request.
    
     @since 4.7.0
    
     @return bool True if it's a WordPress Ajax request, false otherwise.
    
  **/
  public function wp_doing_ajax():Bool;
  /**
    
     Determines whether the current request should use themes.
    
     @since 5.1.0
    
     @return bool True if themes should be used, false otherwise.
    
  **/
  public function wp_using_themes():Bool;
  /**
    
     Determines whether the current request is a WordPress cron request.
    
     @since 4.8.0
    
     @return bool True if it's a WordPress cron request, false otherwise.
    
  **/
  public function wp_doing_cron():Bool;
  /**
    
     Check whether variable is a WordPress Error.
    
     Returns true if $thing is an object of the WP_Error class.
    
     @since 2.1.0
    
     @param mixed $thing Check if unknown variable is a WP_Error object.
     @return bool True, if WP_Error. False, if not WP_Error.
    
  **/
  public function is_wp_error(thing:Dynamic):Bool;
  /**
    
     Determines whether file modifications are allowed.
    
     @since 4.8.0
    
     @param string $context The usage context.
     @return bool True if file modification is allowed, false otherwise.
    
  **/
  public function wp_is_file_mod_allowed(context:String):Bool;
  /**
    
     Start scraping edited file errors.
    
     @since 4.9.0
    
  **/
  public function wp_start_scraping_edited_file_errors():Void;
  /**
    
     Finalize scraping for edited file errors.
    
     @since 4.9.0
    
     @param string $scrape_key Scrape key.
    
  **/
  public function wp_finalize_scraping_edited_file_errors(scrape_key:String):Void;
  /**
    
     Checks whether current request is a JSON request, or is expecting a JSON response.
    
     @since 5.0.0
    
     @return bool True if Accepts or Content-Type headers contain application/json, false otherwise.
    
  **/
  public function wp_is_json_request():Bool;
}
