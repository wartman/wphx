package wp.extern;

@:native("WP_HTTP_Response")
extern class HTTPResponse {
  /**
    
     Response data.
    
     @since 4.4.0
     @var mixed
    
  **/
  @:native("data") public var data:Dynamic;
  /**
    
     Response headers.
    
     @since 4.4.0
     @var array
    
  **/
  @:native("headers") public var headers:php.NativeStructArray<Dynamic>;
  /**
    
     Response status.
    
     @since 4.4.0
     @var int
    
  **/
  @:native("status") public var status:Int;
  /**
    
     Constructor.
    
     @since 4.4.0
    
     @param mixed $data    Response data. Default null.
     @param int   $status  Optional. HTTP status code. Default 200.
     @param array $headers Optional. HTTP header map. Default empty array.
    
  **/
  public function new(data:Dynamic = null, status:Int = 200, ?headers:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Retrieves headers associated with the response.
    
     @since 4.4.0
    
     @return array Map of header name to header value.
    
  **/
  @:native("get_headers") public function getHeaders():php.NativeArray;
  /**
    
     Sets all header values.
    
     @since 4.4.0
    
     @param array $headers Map of header name to header value.
    
  **/
  @:native("set_headers") public function setHeaders(headers:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Sets a single HTTP header.
    
     @since 4.4.0
    
     @param string $key     Header name.
     @param string $value   Header value.
     @param bool   $replace Optional. Whether to replace an existing header of the same name.
                            Default true.
    
  **/
  @:native("header") public function header(key:String, value:String, replace:Bool = true):Void;
  /**
    
     Retrieves the HTTP return code for the response.
    
     @since 4.4.0
    
     @return int The 3-digit HTTP status code.
    
  **/
  @:native("get_status") public function getStatus():Int;
  /**
    
     Sets the 3-digit HTTP status code.
    
     @since 4.4.0
    
     @param int $code HTTP status.
    
  **/
  @:native("set_status") public function setStatus(code:Int):Void;
  /**
    
     Retrieves the response data.
    
     @since 4.4.0
    
     @return mixed Response data.
    
  **/
  @:native("get_data") public function getData():Dynamic;
  /**
    
     Sets the response data.
    
     @since 4.4.0
    
     @param mixed $data Response data.
    
  **/
  @:native("set_data") public function setData(data:Dynamic):Void;
  /**
    
     Retrieves the response data for JSON serialization.
    
     It is expected that in most implementations, this will return the same as get_data(),
     however this may be different if you want to do custom JSON data handling.
    
     @since 4.4.0
    
     @return mixed Any JSON-serializable value.
    
  **/
  @:native("jsonSerialize") public function jsonSerialize():Dynamic;
}
