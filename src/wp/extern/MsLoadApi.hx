package wp.extern;

extern class MsLoadApi implements wp.util.ApiFunctions {
  /**
    
     Whether a subdomain configuration is enabled.
    
     @since 3.0.0
    
     @return bool True if subdomain configuration is enabled, false otherwise.
    
  **/
  public function is_subdomain_install():Bool;
  /**
    
     Returns array of network plugin files to be included in global scope.
    
     The default directory is wp-content/plugins. To change the default directory
     manually, define `WP_PLUGIN_DIR` and `WP_PLUGIN_URL` in `wp-config.php`.
    
     @access private
     @since 3.1.0
    
     @return array Files to include.
    
  **/
  public function wp_get_active_network_plugins():php.NativeArray;
  /**
    
     Checks status of current blog.
    
     Checks if the blog is deleted, inactive, archived, or spammed.
    
     Dies with a default message if the blog does not pass the check.
    
     To change the default message when a blog does not pass the check,
     use the wp-content/blog-deleted.php, blog-inactive.php and
     blog-suspended.php drop-ins.
    
     @since 3.0.0
    
     @return true|string Returns true on success, or drop-in file to include.
    
  **/
  public function ms_site_check():haxe.extern.EitherType<Bool, String>;
  /**
    
     Retrieve the closest matching network for a domain and path.
    
     @since 3.9.0
    
     @internal In 4.4.0, converted to a wrapper for WP_Network::get_by_path()
    
     @param string   $domain   Domain to check.
     @param string   $path     Path to check.
     @param int|null $segments Path segments to use. Defaults to null, or the full path.
     @return WP_Network|false Network object if successful. False when no network is found.
    
  **/
  public function get_network_by_path(domain:String, path:String, segments:Int = null):haxe.extern.EitherType<wp.extern.Network, Bool>;
  /**
    
     Retrieves the closest matching site object by its domain and path.
    
     This will not necessarily return an exact match for a domain and path. Instead, it
     breaks the domain and path into pieces that are then used to match the closest
     possibility from a query.
    
     The intent of this method is to match a site object during bootstrap for a
     requested site address
    
     @since 3.9.0
     @since 4.7.0 Updated to always return a `WP_Site` object.
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string   $domain   Domain to check.
     @param string   $path     Path to check.
     @param int|null $segments Path segments to use. Defaults to null, or the full path.
     @return WP_Site|false Site object if successful. False when no site is found.
    
  **/
  public function get_site_by_path(domain:String, path:String, segments:Int = null):haxe.extern.EitherType<wp.extern.Site, Bool>;
  /**
    
     Identifies the network and site of a requested domain and path and populates the
     corresponding network and site global objects as part of the multisite bootstrap process.
    
     Prior to 4.6.0, this was a procedural block in `ms-settings.php`. It was wrapped into
     a function to facilitate unit tests. It should not be used outside of core.
    
     Usually, it's easier to query the site first, which then declares its network.
     In limited situations, we either can or must find the network first.
    
     If a network and site are found, a `true` response will be returned so that the
     request can continue.
    
     If neither a network or site is found, `false` or a URL string will be returned
     so that either an error can be shown or a redirect can occur.
    
     @since 4.6.0
     @access private
    
     @global WP_Network $current_site The current network.
     @global WP_Site    $current_blog The current site.
    
     @param string $domain    The requested domain.
     @param string $path      The requested path.
     @param bool   $subdomain Optional. Whether a subdomain (true) or subdirectory (false) configuration.
                              Default false.
     @return bool|string True if bootstrap successfully populated `$current_blog` and `$current_site`.
                         False if bootstrap could not be properly completed.
                         Redirect URL if parts exist, but the request as a whole can not be fulfilled.
    
  **/
  public function ms_load_current_site_and_network(domain:String, path:String, subdomain:Bool = false):haxe.extern.EitherType<Bool, String>;
  /**
    
     Displays a failure message.
    
     Used when a blog's tables do not exist. Checks for a missing $wpdb->site table as well.
    
     @access private
     @since 3.0.0
     @since 4.4.0 The `$domain` and `$path` parameters were added.
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string $domain The requested domain for the error to reference.
     @param string $path   The requested path for the error to reference.
    
  **/
  public function ms_not_installed(domain:String, path:String):Void;
  /**
    
     This deprecated function formerly set the site_name property of the $current_site object.
    
     This function simply returns the object, as before.
     The bootstrap takes care of setting site_name.
    
     @access private
     @since 3.0.0
     @deprecated 3.9.0 Use get_current_site() instead.
    
     @param object $current_site
     @return object
    
  **/
  public function get_current_site_name(current_site:Dynamic):Dynamic;
  /**
    
     This deprecated function managed much of the site and network loading in multisite.
    
     The current bootstrap code is now responsible for parsing the site and network load as
     well as setting the global $current_site object.
    
     @access private
     @since 3.0.0
     @deprecated 3.9.0
    
     @global object $current_site
    
     @return object
    
  **/
  public function wpmu_current_site():Dynamic;
  /**
    
     Retrieve an object containing information about the requested network.
    
     @since 3.9.0
     @deprecated 4.7.0 Use `get_network()`
     @see get_network()
    
     @internal In 4.6.0, converted to use get_network()
    
     @param object|int $network The network's database row or ID.
     @return WP_Network|false Object containing network information if found, false if not.
    
  **/
  public function wp_get_network(network:haxe.extern.EitherType<Dynamic, Int>):haxe.extern.EitherType<wp.extern.Network, Bool>;
}
