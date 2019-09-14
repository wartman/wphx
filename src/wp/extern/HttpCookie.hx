package wp.extern;

@:native("WP_Http_Cookie")
extern class HttpCookie {
  /**
    
     Cookie name.
    
     @since 2.8.0
     @var string
    
  **/
  @:native("name") public var name:String;
  /**
    
     Cookie value.
    
     @since 2.8.0
     @var string
    
  **/
  @:native("value") public var value:String;
  /**
    
     When the cookie expires.
    
     @since 2.8.0
     @var string
    
  **/
  @:native("expires") public var expires:String;
  /**
    
     Cookie URL path.
    
     @since 2.8.0
     @var string
    
  **/
  @:native("path") public var path:String;
  /**
    
     Cookie Domain.
    
     @since 2.8.0
     @var string
    
  **/
  @:native("domain") public var domain:String;
  /**
    
     Sets up this cookie object.
    
     The parameter $data should be either an associative array containing the indices names below
     or a header string detailing it.
    
     @since 2.8.0
    
     @param string|array $data {
         Raw cookie data as header string or data array.
    
         @type string     $name    Cookie name.
         @type mixed      $value   Value. Should NOT already be urlencoded.
         @type string|int $expires Optional. Unix timestamp or formatted date. Default null.
         @type string     $path    Optional. Path. Default '/'.
         @type string     $domain  Optional. Domain. Default host of parsed $requested_url.
         @type int        $port    Optional. Port. Default null.
     }
     @param string       $requested_url The URL which the cookie was set on, used for default $domain
                                        and $port values.
    
  **/
  public function new(data:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>, requested_url:String = ''):Void;
  /**
    
     Confirms that it's OK to send this cookie to the URL checked against.
    
     Decision is based on RFC 2109/2965, so look there for details on validity.
    
     @since 2.8.0
    
     @param string $url URL you intend to send this cookie to
     @return bool true if allowed, false otherwise.
    
  **/
  @:native("test") public function test(url:String):Bool;
  /**
    
     Convert cookie name and value back to header string.
    
     @since 2.8.0
    
     @return string Header encoded cookie name and value.
    
  **/
  @:native("getHeaderValue") public function getHeaderValue():String;
  /**
    
     Retrieve cookie header for usage in the rest of the WordPress HTTP API.
    
     @since 2.8.0
    
     @return string
    
  **/
  @:native("getFullHeader") public function getFullHeader():String;
  /**
    
     Retrieves cookie attributes.
    
     @since 4.6.0
    
     @return array {
        List of attributes.
    
        @type string $expires When the cookie expires.
        @type string $path    Cookie URL path.
        @type string $domain  Cookie domain.
     }
    
  **/
  @:native("get_attributes") public function getAttributes():php.NativeArray;
}
