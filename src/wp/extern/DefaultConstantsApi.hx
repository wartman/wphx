package wp.extern;

extern class DefaultConstantsApi implements wp.util.ApiFunctions {
  /**
    
     Defines initial WordPress constants
    
     @see wp_debug_mode()
    
     @since 3.0.0
    
     @global int    $blog_id    The current site ID.
     @global string $wp_version The WordPress version string.
    
  **/
  public function wp_initial_constants():Void;
  /**
    
     Defines plugin directory WordPress constants
    
     Defines must-use plugin directory constants, which may be overridden in the sunrise.php drop-in
    
     @since 3.0.0
    
  **/
  public function wp_plugin_directory_constants():Void;
  /**
    
     Defines cookie related WordPress constants
    
     Defines constants after multisite is loaded.
    
     @since 3.0.0
    
  **/
  public function wp_cookie_constants():Void;
  /**
    
     Defines SSL-related WordPress constants.
    
     @since 3.0.0
    
  **/
  public function wp_ssl_constants():Void;
  /**
    
     Defines functionality related WordPress constants
    
     @since 3.0.0
    
  **/
  public function wp_functionality_constants():Void;
  /**
    
     Defines templating related WordPress constants
    
     @since 3.0.0
    
  **/
  public function wp_templating_constants():Void;
}
