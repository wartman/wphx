package wp.extern;

@:native("WP_Embed")
extern class Embed {
  /**
    
     When a URL cannot be embedded, return false instead of returning a link
     or the URL.
    
     Bypasses the {@see 'embed_maybe_make_link'} filter.
    
     @var bool
    
  **/
  @:native("return_false_on_fail") public var returnFalseOnFail:Bool;
  /**
    
     Constructor
    
  **/
  public function new():Void;
  /**
    
     Process the [embed] shortcode.
    
     Since the [embed] shortcode needs to be run earlier than other shortcodes,
     this function removes all existing shortcodes, registers the [embed] shortcode,
     calls do_shortcode(), and then re-registers the old shortcodes.
    
     @global array $shortcode_tags
    
     @param string $content Content to parse
     @return string Content with shortcode parsed
    
  **/
  @:native("run_shortcode") public function runShortcode(content:String):String;
  /**
    
     If a post/page was saved, then output JavaScript to make
     an Ajax request that will call WP_Embed::cache_oembed().
    
  **/
  @:native("maybe_run_ajax_cache") public function maybeRunAjaxCache():Void;
  /**
    
     Registers an embed handler.
    
     Do not use this function directly, use wp_embed_register_handler() instead.
    
     This function should probably also only be used for sites that do not support oEmbed.
    
     @param string $id An internal ID/name for the handler. Needs to be unique.
     @param string $regex The regex that will be used to see if this handler should be used for a URL.
     @param callable $callback The callback function that will be called if the regex is matched.
     @param int $priority Optional. Used to specify the order in which the registered handlers will be tested (default: 10). Lower numbers correspond with earlier testing, and handlers with the same priority are tested in the order in which they were added to the action.
    
  **/
  @:native("register_handler") public function registerHandler(id:String, regex:String, callback:Dynamic, priority:Int = 10):Void;
  /**
    
     Unregisters a previously-registered embed handler.
    
     Do not use this function directly, use wp_embed_unregister_handler() instead.
    
     @param string $id The handler ID that should be removed.
     @param int $priority Optional. The priority of the handler to be removed (default: 10).
    
  **/
  @:native("unregister_handler") public function unregisterHandler(id:String, priority:Int = 10):Void;
  /**
    
     The do_shortcode() callback function.
    
     Attempts to convert a URL into embed HTML. Starts by checking the URL against the regex of
     the registered embed handlers. If none of the regex matches and it's enabled, then the URL
     will be given to the WP_oEmbed class.
    
     @param array $attr {
         Shortcode attributes. Optional.
    
         @type int $width  Width of the embed in pixels.
         @type int $height Height of the embed in pixels.
     }
     @param string $url The URL attempting to be embedded.
     @return string|false The embed HTML on success, otherwise the original URL.
                          `->maybe_make_link()` can return false on failure.
    
  **/
  @:native("shortcode") public function shortcode(attr:php.NativeStructArray<Dynamic>, url:String = ''):haxe.extern.EitherType<String, Bool>;
  /**
    
     Delete all oEmbed caches. Unused by core as of 4.0.0.
    
     @param int $post_ID Post ID to delete the caches for.
    
  **/
  @:native("delete_oembed_caches") public function deleteOembedCaches(post_ID:Int):Void;
  /**
    
     Triggers a caching of all oEmbed results.
    
     @param int $post_ID Post ID to do the caching for.
    
  **/
  @:native("cache_oembed") public function cacheOembed(post_ID:Int):Void;
  /**
    
     Passes any unlinked URLs that are on their own line to WP_Embed::shortcode() for potential embedding.
    
     @see WP_Embed::autoembed_callback()
    
     @param string $content The content to be searched.
     @return string Potentially modified $content.
    
  **/
  @:native("autoembed") public function autoembed(content:String):String;
  /**
    
     Callback function for WP_Embed::autoembed().
    
     @param array $match A regex match array.
     @return string The embed HTML on success, otherwise the original URL.
    
  **/
  @:native("autoembed_callback") public function autoembedCallback(match:php.NativeStructArray<Dynamic>):String;
  /**
    
     Conditionally makes a hyperlink based on an internal class variable.
    
     @param string $url URL to potentially be linked.
     @return false|string Linked URL or the original URL. False if 'return_false_on_fail' is true.
    
  **/
  @:native("maybe_make_link") public function maybeMakeLink(url:String):haxe.extern.EitherType<Bool, String>;
  /**
    
     Find the oEmbed cache post ID for a given cache key.
    
     @since 4.9.0
    
     @param string $cache_key oEmbed cache key.
     @return int|null Post ID on success, null on failure.
    
  **/
  @:native("find_oembed_post_id") public function findOembedPostId(cache_key:String):Int;
}
