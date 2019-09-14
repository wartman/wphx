package wp.extern;

extern class UpdateApi implements wp.util.ApiFunctions {
  /**
    
     Check WordPress version against the newest version.
    
     The WordPress version, PHP version, and Locale is sent. Checks against the
     WordPress server at api.wordpress.org server. Will only check if WordPress
     isn't installing.
    
     @since 2.3.0
     @global string $wp_version Used to check against the newest WordPress version.
     @global wpdb   $wpdb
     @global string $wp_local_package
    
     @param array $extra_stats Extra statistics to report to the WordPress.org API.
     @param bool  $force_check Whether to bypass the transient cache and force a fresh update check. Defaults to false, true if $extra_stats is set.
    
  **/
  public function wp_version_check(?extra_stats:php.NativeStructArray<Dynamic>, force_check:Bool = false):Void;
  /**
    
     Check plugin versions against the latest versions hosted on WordPress.org.
    
     The WordPress version, PHP version, and Locale is sent along with a list of
     all plugins installed. Checks against the WordPress server at
     api.wordpress.org. Will only check if WordPress isn't installing.
    
     @since 2.3.0
     @global string $wp_version Used to notify the WordPress version.
    
     @param array $extra_stats Extra statistics to report to the WordPress.org API.
    
  **/
  public function wp_update_plugins(?extra_stats:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Check theme versions against the latest versions hosted on WordPress.org.
    
     A list of all themes installed in sent to WP. Checks against the
     WordPress server at api.wordpress.org. Will only check if WordPress isn't
     installing.
    
     @since 2.7.0
    
     @param array $extra_stats Extra statistics to report to the WordPress.org API.
    
  **/
  public function wp_update_themes(?extra_stats:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Performs WordPress automatic background updates.
    
     @since 3.7.0
    
  **/
  public function wp_maybe_auto_update():Void;
  /**
    
     Retrieves a list of all language updates available.
    
     @since 3.7.0
    
     @return object[] Array of translation objects that have available updates.
    
  **/
  public function wp_get_translation_updates():php.NativeIndexedArray<Dynamic>;
  /**
    
     Collect counts and UI strings for available updates
    
     @since 3.3.0
    
     @return array
    
  **/
  public function wp_get_update_data():php.NativeArray;
  /**
    
     Determines whether core should be updated.
    
     @since 2.8.0
    
     @global string $wp_version
    
  **/
  public function _maybe_update_core():Void;
  /**
    
     Check the last time plugins were run before checking plugin versions.
    
     This might have been backported to WordPress 2.6.1 for performance reasons.
     This is used for the wp-admin to check only so often instead of every page
     load.
    
     @since 2.7.0
     @access private
    
  **/
  public function _maybe_update_plugins():Void;
  /**
    
     Check themes versions only after a duration of time.
    
     This is for performance reasons to make sure that on the theme version
     checker is not run on every page load.
    
     @since 2.7.0
     @access private
    
  **/
  public function _maybe_update_themes():Void;
  /**
    
     Schedule core, theme, and plugin update checks.
    
     @since 3.1.0
    
  **/
  public function wp_schedule_update_checks():Void;
  /**
    
     Clear existing update caches for plugins, themes, and core.
    
     @since 4.1.0
    
  **/
  public function wp_clean_update_cache():Void;
}
