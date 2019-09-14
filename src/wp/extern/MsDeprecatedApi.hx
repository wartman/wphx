package wp.extern;

extern class MsDeprecatedApi implements wp.util.ApiFunctions {
  /**
    
     Get the "dashboard blog", the blog where users without a blog edit their profile data.
     Dashboard blog functionality was removed in WordPress 3.1, replaced by the user admin.
    
     @since MU (3.0.0)
     @deprecated 3.1.0 Use get_site()
     @see get_site()
    
     @return WP_Site Current site object.
    
  **/
  public function get_dashboard_blog():wp.extern.Site;
  /**
    
     Generates a random password.
    
     @since MU (3.0.0)
     @deprecated 3.0.0 Use wp_generate_password()
     @see wp_generate_password()
    
     @param int $len Optional. The length of password to generate. Default 8.
    
  **/
  public function generate_random_password(len:Int = 8):Void;
  /**
    
     Determine if user is a site admin.
    
     Plugins should use is_multisite() instead of checking if this function exists
     to determine if multisite is enabled.
    
     This function must reside in a file included only if is_multisite() due to
     legacy function_exists() checks to determine if multisite is enabled.
    
     @since MU (3.0.0)
     @deprecated 3.0.0 Use is_super_admin()
     @see is_super_admin()
    
     @param string $user_login Optional. Username for the user to check. Default empty.
    
  **/
  public function is_site_admin(user_login:String = ''):Void;
  /**
    
     Deprecated functionality to gracefully fail.
    
     @since MU (3.0.0)
     @deprecated 3.0.0 Use wp_die()
     @see wp_die()
    
  **/
  public function graceful_fail(message:Dynamic):Void;
  /**
    
     Deprecated functionality to retrieve user information.
    
     @since MU (3.0.0)
     @deprecated 3.0.0 Use get_user_by()
     @see get_user_by()
    
     @param string $username Username.
    
  **/
  public function get_user_details(username:String):Void;
  /**
    
     Deprecated functionality to clear the global post cache.
    
     @since MU (3.0.0)
     @deprecated 3.0.0 Use clean_post_cache()
     @see clean_post_cache()
    
     @param int $post_id Post ID.
    
  **/
  public function clear_global_post_cache(post_id:Int):Void;
  /**
    
     Deprecated functionality to determin if the current site is the main site.
    
     @since MU (3.0.0)
     @deprecated 3.0.0 Use is_main_site()
     @see is_main_site()
    
  **/
  public function is_main_blog():Void;
  /**
    
     Deprecated functionality to validate an email address.
    
     @since MU (3.0.0)
     @deprecated 3.0.0 Use is_email()
     @see is_email()
    
     @param string $email        Email address to verify.
     @param bool   $check_domain Deprecated.
     @return string|bool Either false or the valid email address.
    
  **/
  public function validate_email(email:String, check_domain:Bool = true):haxe.extern.EitherType<String, Bool>;
  /**
    
     Deprecated functionality to retrieve a list of all sites.
    
     @since MU (3.0.0)
     @deprecated 3.0.0 Use wp_get_sites()
     @see wp_get_sites()
    
     @param int    $start      Optional. Offset for retrieving the blog list. Default 0.
     @param int    $num        Optional. Number of blogs to list. Default 10.
     @param string $deprecated Unused.
    
  **/
  public function get_blog_list(start:Int = 0, num:Int = 10, deprecated:String = ''):Void;
  /**
    
     Deprecated functionality to retrieve a list of the most active sites.
    
     @since MU (3.0.0)
     @deprecated 3.0.0
    
     @param int  $num     Optional. Number of activate blogs to retrieve. Default 10.
     @param bool $display Optional. Whether or not to display the most active blogs list. Default true.
     @return array List of "most active" sites.
    
  **/
  public function get_most_active_blogs(num:Int = 10, display:Bool = true):php.NativeArray;
  /**
    
     Redirect a user based on $_GET or $_POST arguments.
    
     The function looks for redirect arguments in the following order:
     1) $_GET['ref']
     2) $_POST['ref']
     3) $_SERVER['HTTP_REFERER']
     4) $_GET['redirect']
     5) $_POST['redirect']
     6) $url
    
     @since MU (3.0.0)
     @deprecated 3.3.0 Use wp_redirect()
     @see wp_redirect()
    
     @param string $url Optional. Redirect URL. Default empty.
    
  **/
  public function wpmu_admin_do_redirect(url:String = ''):Void;
  /**
    
     Adds an 'updated=true' argument to a URL.
    
     @since MU (3.0.0)
     @deprecated 3.3.0 Use add_query_arg()
     @see add_query_arg()
    
     @param string $url Optional. Redirect URL. Default empty.
     @return string
    
  **/
  public function wpmu_admin_redirect_add_updated_param(url:String = ''):String;
  /**
    
     Get a numeric user ID from either an email address or a login.
    
     A numeric string is considered to be an existing user ID
     and is simply returned as such.
    
     @since MU (3.0.0)
     @deprecated 3.6.0 Use get_user_by()
     @see get_user_by()
    
     @param string $string Either an email address or a login.
     @return int
    
  **/
  public function get_user_id_from_string(string:String):Int;
  /**
    
     Get a full blog URL, given a domain and a path.
    
     @since MU (3.0.0)
     @deprecated 3.7.0
    
     @param string $domain
     @param string $path
     @return string
    
  **/
  public function get_blogaddress_by_domain(domain:String, path:String):String;
  /**
    
     Create an empty blog.
    
     @since MU (3.0.0)
     @deprecated 4.4.0
    
     @param string $domain       The new blog's domain.
     @param string $path         The new blog's path.
     @param string $weblog_title The new blog's title.
     @param int    $site_id      Optional. Defaults to 1.
     @return string|int The ID of the newly created blog
    
  **/
  public function create_empty_blog(domain:String, path:String, weblog_title:String, site_id:Int = 1):haxe.extern.EitherType<String, Int>;
  /**
    
     Get the admin for a domain/path combination.
    
     @since MU (3.0.0)
     @deprecated 4.4.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string $domain Optional. Network domain.
     @param string $path   Optional. Network path.
     @return array|false The network admins.
    
  **/
  public function get_admin_users_for_domain(domain:String = '', path:String = ''):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Bool>;
  /**
    
     Return an array of sites for a network or networks.
    
     @since 3.7.0
     @deprecated 4.6.0 Use get_sites()
     @see get_sites()
    
     @param array $args {
         Array of default arguments. Optional.
    
         @type int|array $network_id A network ID or array of network IDs. Set to null to retrieve sites
                                     from all networks. Defaults to current network ID.
         @type int       $public     Retrieve public or non-public sites. Default null, for any.
         @type int       $archived   Retrieve archived or non-archived sites. Default null, for any.
         @type int       $mature     Retrieve mature or non-mature sites. Default null, for any.
         @type int       $spam       Retrieve spam or non-spam sites. Default null, for any.
         @type int       $deleted    Retrieve deleted or non-deleted sites. Default null, for any.
         @type int       $limit      Number of sites to limit the query to. Default 100.
         @type int       $offset     Exclude the first x sites. Used in combination with the $limit parameter. Default 0.
     }
     @return array An empty array if the installation is considered "large" via wp_is_large_network(). Otherwise,
                   an associative array of site data arrays, each containing the site (network) ID, blog ID,
                   site domain and path, dates registered and modified, and the language ID. Also, boolean
                   values for whether the site is public, archived, mature, spam, and/or deleted.
    
  **/
  public function wp_get_sites(?args:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Check whether a usermeta key has to do with the current blog.
    
     @since MU (3.0.0)
     @deprecated 4.9.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string $key
     @param int    $user_id Optional. Defaults to current user.
     @param int    $blog_id Optional. Defaults to current blog.
     @return bool
    
  **/
  public function is_user_option_local(key:String, user_id:Int = 0, blog_id:Int = 0):Bool;
  /**
    
     Store basic site info in the blogs table.
    
     This function creates a row in the wp_blogs table and returns
     the new blog's ID. It is the first step in creating a new blog.
    
     @since MU (3.0.0)
     @deprecated 5.1.0 Use `wp_insert_site()`
     @see wp_insert_site()
    
     @param string $domain  The domain of the new site.
     @param string $path    The path of the new site.
     @param int    $site_id Unless you're running a multi-network install, be sure to set this value to 1.
     @return int|false The ID of the new row
    
  **/
  public function insert_blog(domain:String, path:String, site_id:Int):haxe.extern.EitherType<Int, Bool>;
  /**
    
     Install an empty blog.
    
     Creates the new blog tables and options. If calling this function
     directly, be sure to use switch_to_blog() first, so that $wpdb
     points to the new blog.
    
     @since MU (3.0.0)
     @deprecated 5.1.0
    
     @global wpdb     $wpdb
     @global WP_Roles $wp_roles
    
     @param int    $blog_id    The value returned by wp_insert_site().
     @param string $blog_title The title of the new site.
    
  **/
  public function install_blog(blog_id:Int, blog_title:String = ''):Void;
  /**
    
     Set blog defaults.
    
     This function creates a row in the wp_blogs table.
    
     @since MU (3.0.0)
     @deprecated MU
     @deprecated Use wp_install_defaults()
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int $blog_id Ignored in this function.
     @param int $user_id
    
  **/
  public function install_blog_defaults(blog_id:Int, user_id:Int):Void;
}
