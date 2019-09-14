package wp.extern;

@:native("WP_oEmbed_Controller")
extern class oEmbedController {
  /**
    
     Register the oEmbed REST API route.
    
     @since 4.4.0
    
  **/
  @:native("register_routes") public function registerRoutes():Void;
  /**
    
     Callback for the embed API endpoint.
    
     Returns the JSON object for the post.
    
     @since 4.4.0
    
     @param WP_REST_Request $request Full data about the request.
     @return WP_Error|array oEmbed response data or WP_Error on failure.
    
  **/
  @:native("get_item") public function getItem(request:wp.extern.RESTRequest):haxe.extern.EitherType<wp.extern.Error, php.NativeStructArray<Dynamic>>;
  /**
    
     Checks if current user can make a proxy oEmbed request.
    
     @since 4.8.0
    
     @return true|WP_Error True if the request has read access, WP_Error object otherwise.
    
  **/
  @:native("get_proxy_item_permissions_check") public function getProxyItemPermissionsCheck():haxe.extern.EitherType<Bool, wp.extern.Error>;
  /**
    
     Callback for the proxy API endpoint.
    
     Returns the JSON object for the proxied item.
    
     @since 4.8.0
    
     @see WP_oEmbed::get_html()
     @param WP_REST_Request $request Full data about the request.
     @return object|WP_Error oEmbed response data or WP_Error on failure.
    
  **/
  @:native("get_proxy_item") public function getProxyItem(request:wp.extern.RESTRequest):haxe.extern.EitherType<Dynamic, wp.extern.Error>;
}
