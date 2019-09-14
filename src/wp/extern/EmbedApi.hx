package wp.extern;

extern class EmbedApi implements wp.util.ApiFunctions {
  /**
    
     Registers an embed handler.
    
     Should probably only be used for sites that do not support oEmbed.
    
     @since 2.9.0
    
     @global WP_Embed $wp_embed
    
     @param string   $id       An internal ID/name for the handler. Needs to be unique.
     @param string   $regex    The regex that will be used to see if this handler should be used for a URL.
     @param callable $callback The callback function that will be called if the regex is matched.
     @param int      $priority Optional. Used to specify the order in which the registered handlers will
                               be tested. Default 10.
    
  **/
  public function wp_embed_register_handler(id:String, regex:String, callback:Dynamic, priority:Int = 10):Void;
  /**
    
     Unregisters a previously-registered embed handler.
    
     @since 2.9.0
    
     @global WP_Embed $wp_embed
    
     @param string $id       The handler ID that should be removed.
     @param int    $priority Optional. The priority of the handler to be removed. Default 10.
    
  **/
  public function wp_embed_unregister_handler(id:String, priority:Int = 10):Void;
  /**
    
     Creates default array of embed parameters.
    
     The width defaults to the content width as specified by the theme. If the
     theme does not specify a content width, then 500px is used.
    
     The default height is 1.5 times the width, or 1000px, whichever is smaller.
    
     The {@see 'embed_defaults'} filter can be used to adjust either of these values.
    
     @since 2.9.0
    
     @global int $content_width
    
     @param string $url Optional. The URL that should be embedded. Default empty.
    
     @return array Default embed parameters.
    
  **/
  public function wp_embed_defaults(url:String = ''):php.NativeArray;
  /**
    
     Attempts to fetch the embed HTML for a provided URL using oEmbed.
    
     @since 2.9.0
    
     @see WP_oEmbed
    
     @param string $url  The URL that should be embedded.
     @param array  $args Optional. Additional arguments and parameters for retrieving embed HTML.
                         Default empty.
     @return false|string False on failure or the embed HTML on success.
    
  **/
  public function wp_oembed_get(url:String, args:php.NativeStructArray<Dynamic> = ''):haxe.extern.EitherType<Bool, String>;
  /**
    
     Returns the initialized WP_oEmbed object.
    
     @since 2.9.0
     @access private
    
     @staticvar WP_oEmbed $wp_oembed
    
     @return WP_oEmbed object.
    
  **/
  public function _wp_oembed_get_object():wp.extern.oEmbed;
  /**
    
     Adds a URL format and oEmbed provider URL pair.
    
     @since 2.9.0
    
     @see WP_oEmbed
    
     @param string  $format   The format of URL that this provider can handle. You can use asterisks
                              as wildcards.
     @param string  $provider The URL to the oEmbed provider.
     @param boolean $regex    Optional. Whether the `$format` parameter is in a RegEx format. Default false.
    
  **/
  public function wp_oembed_add_provider(format:String, provider:String, regex:Bool = false):Void;
  /**
    
     Removes an oEmbed provider.
    
     @since 3.5.0
    
     @see WP_oEmbed
    
     @param string $format The URL format for the oEmbed provider to remove.
     @return bool Was the provider removed successfully?
    
  **/
  public function wp_oembed_remove_provider(format:String):Bool;
  /**
    
     Determines if default embed handlers should be loaded.
    
     Checks to make sure that the embeds library hasn't already been loaded. If
     it hasn't, then it will load the embeds library.
    
     @since 2.9.0
    
     @see wp_embed_register_handler()
    
  **/
  public function wp_maybe_load_embeds():Void;
  /**
    
     YouTube iframe embed handler callback.
    
     Catches YouTube iframe embed URLs that are not parsable by oEmbed but can be translated into a URL that is.
    
     @since 4.0.0
    
     @global WP_Embed $wp_embed
    
     @param array  $matches The RegEx matches from the provided regex when calling
                            wp_embed_register_handler().
     @param array  $attr    Embed attributes.
     @param string $url     The original URL that was matched by the regex.
     @param array  $rawattr The original unmodified attributes.
     @return string The embed HTML.
    
  **/
  public function wp_embed_handler_youtube(matches:php.NativeStructArray<Dynamic>, attr:php.NativeStructArray<Dynamic>, url:String, rawattr:php.NativeStructArray<Dynamic>):String;
  /**
    
     Audio embed handler callback.
    
     @since 3.6.0
    
     @param array  $matches The RegEx matches from the provided regex when calling wp_embed_register_handler().
     @param array  $attr Embed attributes.
     @param string $url The original URL that was matched by the regex.
     @param array  $rawattr The original unmodified attributes.
     @return string The embed HTML.
    
  **/
  public function wp_embed_handler_audio(matches:php.NativeStructArray<Dynamic>, attr:php.NativeStructArray<Dynamic>, url:String, rawattr:php.NativeStructArray<Dynamic>):String;
  /**
    
     Video embed handler callback.
    
     @since 3.6.0
    
     @param array  $matches The RegEx matches from the provided regex when calling wp_embed_register_handler().
     @param array  $attr    Embed attributes.
     @param string $url     The original URL that was matched by the regex.
     @param array  $rawattr The original unmodified attributes.
     @return string The embed HTML.
    
  **/
  public function wp_embed_handler_video(matches:php.NativeStructArray<Dynamic>, attr:php.NativeStructArray<Dynamic>, url:String, rawattr:php.NativeStructArray<Dynamic>):String;
  /**
    
     Registers the oEmbed REST API route.
    
     @since 4.4.0
    
  **/
  public function wp_oembed_register_route():Void;
  /**
    
     Adds oEmbed discovery links in the website <head>.
    
     @since 4.4.0
    
  **/
  public function wp_oembed_add_discovery_links():Void;
  /**
    
     Adds the necessary JavaScript to communicate with the embedded iframes.
    
     @since 4.4.0
    
  **/
  public function wp_oembed_add_host_js():Void;
  /**
    
     Retrieves the URL to embed a specific post in an iframe.
    
     @since 4.4.0
    
     @param int|WP_Post $post Optional. Post ID or object. Defaults to the current post.
     @return string|false The post embed URL on success, false if the post doesn't exist.
    
  **/
  public function get_post_embed_url(post:haxe.extern.EitherType<Int, wp.extern.Post> = null):haxe.extern.EitherType<String, Bool>;
  /**
    
     Retrieves the oEmbed endpoint URL for a given permalink.
    
     Pass an empty string as the first argument to get the endpoint base URL.
    
     @since 4.4.0
    
     @param string $permalink Optional. The permalink used for the `url` query arg. Default empty.
     @param string $format    Optional. The requested response format. Default 'json'.
     @return string The oEmbed endpoint URL.
    
  **/
  public function get_oembed_endpoint_url(permalink:String = '', format:String = 'json'):String;
  /**
    
     Retrieves the embed code for a specific post.
    
     @since 4.4.0
    
     @param int         $width  The width for the response.
     @param int         $height The height for the response.
     @param int|WP_Post $post   Optional. Post ID or object. Default is global `$post`.
     @return string|false Embed code on success, false if post doesn't exist.
    
  **/
  public function get_post_embed_html(width:Int, height:Int, post:haxe.extern.EitherType<Int, wp.extern.Post> = null):haxe.extern.EitherType<String, Bool>;
  /**
    
     Retrieves the oEmbed response data for a given post.
    
     @since 4.4.0
    
     @param WP_Post|int $post  Post object or ID.
     @param int         $width The requested width.
     @return array|false Response data on success, false if post doesn't exist.
    
  **/
  public function get_oembed_response_data(post:haxe.extern.EitherType<wp.extern.Post, Int>, width:Int):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Bool>;
  /**
    
     Retrieves the oEmbed response data for a given URL.
    
     @since 5.0.0
    
     @param string $url  The URL that should be inspected for discovery `<link>` tags.
     @param array  $args oEmbed remote get arguments.
     @return object|false oEmbed response data if the URL does belong to the current site. False otherwise.
    
  **/
  public function get_oembed_response_data_for_url(url:String, args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Dynamic, Bool>;
  /**
    
     Filters the oEmbed response data to return an iframe embed code.
    
     @since 4.4.0
    
     @param array   $data   The response data.
     @param WP_Post $post   The post object.
     @param int     $width  The requested width.
     @param int     $height The calculated height.
     @return array The modified response data.
    
  **/
  public function get_oembed_response_data_rich(data:php.NativeStructArray<Dynamic>, post:wp.extern.Post, width:Int, height:Int):php.NativeArray;
  /**
    
     Ensures that the specified format is either 'json' or 'xml'.
    
     @since 4.4.0
    
     @param string $format The oEmbed response format. Accepts 'json' or 'xml'.
     @return string The format, either 'xml' or 'json'. Default 'json'.
    
  **/
  public function wp_oembed_ensure_format(format:String):String;
  /**
    
     Hooks into the REST API output to print XML instead of JSON.
    
     This is only done for the oEmbed API endpoint,
     which supports both formats.
    
     @access private
     @since 4.4.0
    
     @param bool                      $served  Whether the request has already been served.
     @param WP_HTTP_ResponseInterface $result  Result to send to the client. Usually a WP_REST_Response.
     @param WP_REST_Request           $request Request used to generate the response.
     @param WP_REST_Server            $server  Server instance.
     @return true
    
  **/
  public function _oembed_rest_pre_serve_request(served:Bool, result:wp.extern.HTTPResponseInterface, request:wp.extern.RESTRequest, server:wp.extern.RESTServer):Bool;
  /**
    
     Creates an XML string from a given array.
    
     @since 4.4.0
     @access private
    
     @param array            $data The original oEmbed response data.
     @param SimpleXMLElement $node Optional. XML node to append the result to recursively.
     @return string|false XML string on success, false on error.
    
  **/
  public function _oembed_create_xml(data:php.NativeStructArray<Dynamic>, node:SimpleXMLElement = null):haxe.extern.EitherType<String, Bool>;
  /**
    
     Filters the given oEmbed HTML.
    
     If the `$url` isn't on the trusted providers list,
     we need to filter the HTML heavily for security.
    
     Only filters 'rich' and 'html' response types.
    
     @since 4.4.0
    
     @param string $result The oEmbed HTML result.
     @param object $data   A data object result from an oEmbed provider.
     @param string $url    The URL of the content to be embedded.
     @return string The filtered and sanitized oEmbed result.
    
  **/
  public function wp_filter_oembed_result(result:String, data:Dynamic, url:String):String;
  /**
    
     Filters the string in the 'more' link displayed after a trimmed excerpt.
    
     Replaces '[...]' (appended to automatically generated excerpts) with an
     ellipsis and a "Continue reading" link in the embed template.
    
     @since 4.4.0
    
     @param string $more_string Default 'more' string.
     @return string 'Continue reading' link prepended with an ellipsis.
    
  **/
  public function wp_embed_excerpt_more(more_string:String):String;
  /**
    
     Displays the post excerpt for the embed template.
    
     Intended to be used in 'The Loop'.
    
     @since 4.4.0
    
  **/
  public function the_excerpt_embed():Void;
  /**
    
     Filters the post excerpt for the embed template.
    
     Shows players for video and audio attachments.
    
     @since 4.4.0
    
     @param string $content The current post excerpt.
     @return string The modified post excerpt.
    
  **/
  public function wp_embed_excerpt_attachment(content:String):String;
  /**
    
     Enqueue embed iframe default CSS and JS & fire do_action('enqueue_embed_scripts')
    
     Enqueue PNG fallback CSS for embed iframe for legacy versions of IE.
    
     Allows plugins to queue scripts for the embed iframe end using wp_enqueue_script().
     Runs first in oembed_head().
    
     @since 4.4.0
    
  **/
  public function enqueue_embed_scripts():Void;
  /**
    
     Prints the CSS in the embed iframe header.
    
     @since 4.4.0
    
  **/
  public function print_embed_styles():Void;
  /**
    
     Prints the JavaScript in the embed iframe header.
    
     @since 4.4.0
    
  **/
  public function print_embed_scripts():Void;
  /**
    
     Prepare the oembed HTML to be displayed in an RSS feed.
    
     @since 4.4.0
     @access private
    
     @param string $content The content to filter.
     @return string The filtered content.
    
  **/
  public function _oembed_filter_feed_content(content:String):String;
  /**
    
     Prints the necessary markup for the embed comments button.
    
     @since 4.4.0
    
  **/
  public function print_embed_comments_button():Void;
  /**
    
     Prints the necessary markup for the embed sharing button.
    
     @since 4.4.0
    
  **/
  public function print_embed_sharing_button():Void;
  /**
    
     Prints the necessary markup for the embed sharing dialog.
    
     @since 4.4.0
    
  **/
  public function print_embed_sharing_dialog():Void;
  /**
    
     Prints the necessary markup for the site title in an embed template.
    
     @since 4.5.0
    
  **/
  public function the_embed_site_title():Void;
  /**
    
     Filters the oEmbed result before any HTTP requests are made.
    
     If the URL belongs to the current site, the result is fetched directly instead of
     going through the oEmbed discovery process.
    
     @since 4.5.3
    
     @param null|string $result The UNSANITIZED (and potentially unsafe) HTML that should be used to embed. Default null.
     @param string      $url    The URL that should be inspected for discovery `<link>` tags.
     @param array       $args   oEmbed remote get arguments.
     @return null|string The UNSANITIZED (and potentially unsafe) HTML that should be used to embed.
                         Null if the URL does not belong to the current site.
    
  **/
  public function wp_filter_pre_oembed_result(result:String, url:String, args:php.NativeStructArray<Dynamic>):String;
}
