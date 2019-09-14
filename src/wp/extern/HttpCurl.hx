package wp.extern;

@:native("WP_Http_Curl")
extern class HttpCurl {
  /**
    
     Send a HTTP request to a URI using cURL extension.
    
     @since 2.7.0
    
     @param string $url The request URL.
     @param string|array $args Optional. Override the defaults.
     @return array|WP_Error Array containing 'headers', 'body', 'response', 'cookies', 'filename'. A WP_Error instance upon error
    
  **/
  @:native("request") public function request(url:String, ?args:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, wp.extern.Error>;
  /**
    
     Determines whether this class can be used for retrieving a URL.
    
     @since 2.7.0
    
     @param array $args Optional. Array of request arguments. Default empty array.
     @return bool False means this class can not be used, true means it can.
    
  **/
  @:native("test") public static function test(?args:php.NativeStructArray<Dynamic>):Bool;
}
