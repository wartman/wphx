package wp.extern;

@:native("WP_HTTP_Requests_Hooks")
extern class HTTPRequestsHooks {
  /**
    
     Constructor.
    
     @param string $url URL to request.
     @param array $request Request data in WP_Http format.
    
  **/
  public function new(url:String, request:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Dispatch a Requests hook to a native WordPress action.
    
     @param string $hook Hook name.
     @param array $parameters Parameters to pass to callbacks.
     @return boolean True if hooks were run, false if nothing was hooked.
    
  **/
  @:native("dispatch") public function dispatch(hook:String, ?parameters:php.NativeStructArray<Dynamic>):Bool;
}
