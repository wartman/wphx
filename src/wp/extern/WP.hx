package wp.extern;

@:native("WP")
extern class WP {
  /**
    
     Public query variables.
    
     Long list of public query variables.
    
     @since 2.0.0
     @var string[]
    
  **/
  @:native("public_query_vars") public var publicQueryVars:php.NativeIndexedArray<String>;
  /**
    
     Private query variables.
    
     Long list of private query variables.
    
     @since 2.0.0
     @var string[]
    
  **/
  @:native("private_query_vars") public var privateQueryVars:php.NativeIndexedArray<String>;
  /**
    
     Extra query variables set by the user.
    
     @since 2.1.0
     @var array
    
  **/
  @:native("extra_query_vars") public var extraQueryVars:php.NativeStructArray<Dynamic>;
  /**
    
     Query variables for setting up the WordPress Query Loop.
    
     @since 2.0.0
     @var array
    
  **/
  @:native("query_vars") public var queryVars:php.NativeStructArray<Dynamic>;
  /**
    
     String parsed to set the query variables.
    
     @since 2.0.0
     @var string
    
  **/
  @:native("query_string") public var queryString:String;
  /**
    
     The request path, e.g. 2015/05/06.
    
     @since 2.0.0
     @var string
    
  **/
  @:native("request") public var request:String;
  /**
    
     Rewrite rule the request matched.
    
     @since 2.0.0
     @var string
    
  **/
  @:native("matched_rule") public var matchedRule:String;
  /**
    
     Rewrite query the request matched.
    
     @since 2.0.0
     @var string
    
  **/
  @:native("matched_query") public var matchedQuery:String;
  /**
    
     Whether already did the permalink.
    
     @since 2.0.0
     @var bool
    
  **/
  @:native("did_permalink") public var didPermalink:Bool;
  /**
    
     Add name to list of public query variables.
    
     @since 2.1.0
    
     @param string $qv Query variable name.
    
  **/
  @:native("add_query_var") public function addQueryVar(qv:String):Void;
  /**
    
     Removes a query variable from a list of public query variables.
    
     @since 4.5.0
    
     @param string $name Query variable name.
    
  **/
  @:native("remove_query_var") public function removeQueryVar(name:String):Void;
  /**
    
     Set the value of a query variable.
    
     @since 2.3.0
    
     @param string $key Query variable name.
     @param mixed $value Query variable value.
    
  **/
  @:native("set_query_var") public function setQueryVar(key:String, value:Dynamic):Void;
  /**
    
     Parse request to find correct WordPress query.
    
     Sets up the query variables based on the request. There are also many
     filters and actions that can be used to further manipulate the result.
    
     @since 2.0.0
    
     @global WP_Rewrite $wp_rewrite
    
     @param array|string $extra_query_vars Set the extra query variables.
    
  **/
  @:native("parse_request") public function parseRequest(extra_query_vars:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String> = ''):Void;
  /**
    
     Sends additional HTTP headers for caching, content type, etc.
    
     Sets the Content-Type header. Sets the 'error' status (if passed) and optionally exits.
     If showing a feed, it will also send Last-Modified, ETag, and 304 status if needed.
    
     @since 2.0.0
     @since 4.4.0 `X-Pingback` header is added conditionally after posts have been queried in handle_404().
    
  **/
  @:native("send_headers") public function sendHeaders():Void;
  /**
    
     Sets the query string property based off of the query variable property.
    
     The {@see 'query_string'} filter is deprecated, but still works. Plugins should
     use the {@see 'request'} filter instead.
    
     @since 2.0.0
    
  **/
  @:native("build_query_string") public function buildQueryString():Void;
  /**
    
     Set up the WordPress Globals.
    
     The query_vars property will be extracted to the GLOBALS. So care should
     be taken when naming global variables that might interfere with the
     WordPress environment.
    
     @since 2.0.0
    
     @global WP_Query     $wp_query
     @global string       $query_string Query string for the loop.
     @global array        $posts The found posts.
     @global WP_Post|null $post The current post, if available.
     @global string       $request The SQL statement for the request.
     @global int          $more Only set, if single page or post.
     @global int          $single If single page or post. Only set, if single page or post.
     @global WP_User      $authordata Only set, if author archive.
    
  **/
  @:native("register_globals") public function registerGlobals():Void;
  /**
    
     Set up the current user.
    
     @since 2.0.0
    
  **/
  @:native("init") public function init():Void;
  /**
    
     Set up the Loop based on the query variables.
    
     @since 2.0.0
    
     @global WP_Query $wp_the_query
    
  **/
  @:native("query_posts") public function queryPosts():Void;
  /**
    
     Set the Headers for 404, if nothing is found for requested URL.
    
     Issue a 404 if a request doesn't match any posts and doesn't match
     any object (e.g. an existing-but-empty category, tag, author) and a 404 was not already
     issued, and if the request was not a search or the homepage.
    
     Otherwise, issue a 200.
    
     This sets headers after posts have been queried. handle_404() really means "handle status."
     By inspecting the result of querying posts, seemingly successful requests can be switched to
     a 404 so that canonical redirection logic can kick in.
    
     @since 2.0.0
    
     @global WP_Query $wp_query
    
  **/
  @:native("handle_404") public function handle404():Void;
  /**
    
     Sets up all of the variables required by the WordPress environment.
    
     The action {@see 'wp'} has one parameter that references the WP object. It
     allows for accessing the properties and methods to further manipulate the
     object.
    
     @since 2.0.0
    
     @param string|array $query_args Passed to parse_request().
    
  **/
  @:native("main") public function main(query_args:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = ''):Void;
}
