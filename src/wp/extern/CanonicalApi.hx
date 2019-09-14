package wp.extern;

extern class CanonicalApi implements wp.util.ApiFunctions {
  /**
    
     Redirects incoming links to the proper URL based on the site url.
    
     Search engines consider www.somedomain.com and somedomain.com to be two
     different URLs when they both go to the same location. This SEO enhancement
     prevents penalty for duplicate content by redirecting all incoming links to
     one or the other.
    
     Prevents redirection for feeds, trackbacks, searches, and
     admin URLs. Does not redirect on non-pretty-permalink-supporting IIS 7+,
     page/post previews, WP admin, Trackbacks, robots.txt, searches, or on POST
     requests.
    
     Will also attempt to find the correct link when a user enters a URL that does
     not exist based on exact WordPress query. Will instead try to parse the URL
     or query in an attempt to figure the correct page to go to.
    
     @since 2.3.0
    
     @global WP_Rewrite $wp_rewrite
     @global bool $is_IIS
     @global WP_Query $wp_query
     @global wpdb $wpdb WordPress database abstraction object.
     @global WP $wp Current WordPress environment instance.
    
     @param string $requested_url Optional. The URL that was requested, used to
          figure if redirect is needed.
     @param bool $do_redirect Optional. Redirect to the new URL.
     @return string|void The string of the URL, if redirect needed.
    
  **/
  public function redirect_canonical(requested_url:String = null, do_redirect:Bool = true):String;
  /**
    
     Converts the first hex-encoded octet match to lowercase.
    
     @since 3.1.0
     @ignore
    
     @param array $matches Hex-encoded octet matches for the requested URL.
     @return string Lowercased version of the first match.
    
  **/
  public function lowercase_octets(matches:php.NativeStructArray<Dynamic>):String;
  /**
    
     Removes arguments from a query string if they are not present in a URL
     DO NOT use this in plugin code.
    
     @since 3.4.0
     @access private
    
     @param string $query_string
     @param array $args_to_check
     @param string $url
     @return string The altered query string
    
  **/
  public function _remove_qs_args_if_not_in_url(query_string:String, args_to_check:php.NativeStructArray<Dynamic>, url:String):String;
  /**
    
     Strips the #fragment from a URL, if one is present.
    
     @since 4.4.0
    
     @param string $url The URL to strip.
     @return string The altered URL.
    
  **/
  public function strip_fragment_from_url(url:String):String;
  /**
    
     Attempts to guess the correct URL based on query vars
    
     @since 2.3.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @return false|string The correct URL if one is found. False on failure.
    
  **/
  public function redirect_guess_404_permalink():haxe.extern.EitherType<Bool, String>;
  /**
    
     Redirects a variety of shorthand URLs to the admin.
    
     If a user visits example.com/admin, they'll be redirected to /wp-admin.
     Visiting /login redirects to /wp-login.php, and so on.
    
     @since 3.4.0
    
     @global WP_Rewrite $wp_rewrite
    
  **/
  public function wp_redirect_admin_locations():Void;
}
