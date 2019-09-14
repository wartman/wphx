package wp.extern;

extern class RewriteApi implements wp.util.ApiFunctions {
  /**
    
     Adds a rewrite rule that transforms a URL structure to a set of query vars.
    
     Any value in the $after parameter that isn't 'bottom' will result in the rule
     being placed at the top of the rewrite rules.
    
     @since 2.1.0
     @since 4.4.0 Array support was added to the `$query` parameter.
    
     @global WP_Rewrite $wp_rewrite WordPress Rewrite Component.
    
     @param string       $regex Regular expression to match request against.
     @param string|array $query The corresponding query vars for this rewrite rule.
     @param string       $after Optional. Priority of the new rule. Accepts 'top'
                                or 'bottom'. Default 'bottom'.
    
  **/
  public function add_rewrite_rule(regex:String, query:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>, after:String = 'bottom'):Void;
  /**
    
     Add a new rewrite tag (like %postname%).
    
     The $query parameter is optional. If it is omitted you must ensure that
     you call this on, or before, the {@see 'init'} hook. This is because $query defaults
     to "$tag=", and for this to work a new query var has to be added.
    
     @since 2.1.0
    
     @global WP_Rewrite $wp_rewrite
     @global WP         $wp
    
     @param string $tag   Name of the new rewrite tag.
     @param string $regex Regular expression to substitute the tag for in rewrite rules.
     @param string $query Optional. String to append to the rewritten query. Must end in '='. Default empty.
    
  **/
  public function add_rewrite_tag(tag:String, regex:String, query:String = ''):Void;
  /**
    
     Removes an existing rewrite tag (like %postname%).
    
     @since 4.5.0
    
     @global WP_Rewrite $wp_rewrite WordPress rewrite component.
    
     @param string $tag Name of the rewrite tag.
    
  **/
  public function remove_rewrite_tag(tag:String):Void;
  /**
    
     Add permalink structure.
    
     @since 3.0.0
    
     @see WP_Rewrite::add_permastruct()
     @global WP_Rewrite $wp_rewrite WordPress rewrite component.
    
     @param string $name   Name for permalink structure.
     @param string $struct Permalink structure.
     @param array  $args   Optional. Arguments for building the rules from the permalink structure,
                           see WP_Rewrite::add_permastruct() for full details. Default empty array.
    
  **/
  public function add_permastruct(name:String, struct:String, ?args:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Removes a permalink structure.
    
     Can only be used to remove permastructs that were added using add_permastruct().
     Built-in permastructs cannot be removed.
    
     @since 4.5.0
    
     @see WP_Rewrite::remove_permastruct()
     @global WP_Rewrite $wp_rewrite WordPress rewrite component.
    
     @param string $name Name for permalink structure.
    
  **/
  public function remove_permastruct(name:String):Void;
  /**
    
     Add a new feed type like /atom1/.
    
     @since 2.1.0
    
     @global WP_Rewrite $wp_rewrite
    
     @param string   $feedname Feed name.
     @param callable $function Callback to run on feed display.
     @return string Feed action name.
    
  **/
  public function add_feed(feedname:String, function_:Dynamic):String;
  /**
    
     Remove rewrite rules and then recreate rewrite rules.
    
     @since 3.0.0
    
     @global WP_Rewrite $wp_rewrite
    
     @param bool $hard Whether to update .htaccess (hard flush) or just update
                       rewrite_rules transient (soft flush). Default is true (hard).
    
  **/
  public function flush_rewrite_rules(hard:Bool = true):Void;
  /**
    
     Add an endpoint, like /trackback/.
    
     Adding an endpoint creates extra rewrite rules for each of the matching
     places specified by the provided bitmask. For example:
    
         add_rewrite_endpoint( 'json', EP_PERMALINK | EP_PAGES );
    
     will add a new rewrite rule ending with "json(/(.*))?/?$" for every permastruct
     that describes a permalink (post) or page. This is rewritten to "json=$match"
     where $match is the part of the URL matched by the endpoint regex (e.g. "foo" in
     "[permalink]/json/foo/").
    
     A new query var with the same name as the endpoint will also be created.
    
     When specifying $places ensure that you are using the EP_* constants (or a
     combination of them using the bitwise OR operator) as their values are not
     guaranteed to remain static (especially `EP_ALL`).
    
     Be sure to flush the rewrite rules - see flush_rewrite_rules() - when your plugin gets
     activated and deactivated.
    
     @since 2.1.0
     @since 4.3.0 Added support for skipping query var registration by passing `false` to `$query_var`.
    
     @global WP_Rewrite $wp_rewrite
    
     @param string      $name      Name of the endpoint.
     @param int         $places    Endpoint mask describing the places the endpoint should be added.
     @param string|bool $query_var Name of the corresponding query variable. Pass `false` to skip registering a query_var
                                   for this endpoint. Defaults to the value of `$name`.
    
  **/
  public function add_rewrite_endpoint(name:String, places:Int, query_var:haxe.extern.EitherType<String, Bool> = true):Void;
  /**
    
     Filters the URL base for taxonomies.
    
     To remove any manually prepended /index.php/.
    
     @access private
     @since 2.6.0
    
     @param string $base The taxonomy base that we're going to filter
     @return string
    
  **/
  public function _wp_filter_taxonomy_base(base:String):String;
  /**
    
     Resolve numeric slugs that collide with date permalinks.
    
     Permalinks of posts with numeric slugs can sometimes look to WP_Query::parse_query()
     like a date archive, as when your permalink structure is `/%year%/%postname%/` and
     a post with post_name '05' has the URL `/2015/05/`.
    
     This function detects conflicts of this type and resolves them in favor of the
     post permalink.
    
     Note that, since 4.3.0, wp_unique_post_slug() prevents the creation of post slugs
     that would result in a date archive conflict. The resolution performed in this
     function is primarily for legacy content, as well as cases when the admin has changed
     the site's permalink structure in a way that introduces URL conflicts.
    
     @since 4.3.0
    
     @param array $query_vars Optional. Query variables for setting up the loop, as determined in
                              WP::parse_request(). Default empty array.
     @return array Returns the original array of query vars, with date/post conflicts resolved.
    
  **/
  public function wp_resolve_numeric_slug_conflicts(?query_vars:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Examine a URL and try to determine the post ID it represents.
    
     Checks are supposedly from the hosted site blog.
    
     @since 1.0.0
    
     @global WP_Rewrite $wp_rewrite
     @global WP         $wp
    
     @param string $url Permalink to check.
     @return int Post ID, or 0 on failure.
    
  **/
  public function url_to_postid(url:String):Int;
}
