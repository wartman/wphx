package wp.extern;

@:native("WP_HTTP_Requests_Response")
extern class HTTPRequestsResponse {
  /**
    
     Constructor.
    
     @since 4.6.0
    
     @param Requests_Response $response HTTP response.
     @param string            $filename Optional. File name. Default empty.
    
  **/
  public function new(response:Requests_Response, filename:String):Void;
  /**
    
     Retrieves the response object for the request.
    
     @since 4.6.0
    
     @return Requests_Response HTTP response.
    
  **/
  @:native("get_response_object") public function getResponseObject():Requests_Response;
  /**
    
     Retrieves headers associated with the response.
    
     @since 4.6.0
    
     @see \Requests_Utility_CaseInsensitiveDictionary
    
     @return \Requests_Utility_CaseInsensitiveDictionary Map of header name to header value.
    
  **/
  @:native("get_headers") public function getHeaders():;
  /**
    
     Sets all header values.
    
     @since 4.6.0
    
     @param array $headers Map of header name to header value.
    
  **/
  @:native("set_headers") public function setHeaders(headers:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Sets a single HTTP header.
    
     @since 4.6.0
    
     @param string $key     Header name.
     @param string $value   Header value.
     @param bool   $replace Optional. Whether to replace an existing header of the same name.
                            Default true.
    
  **/
  @:native("header") public function header(key:String, value:String, replace:Bool = true):Void;
  /**
    
     Retrieves the HTTP return code for the response.
    
     @since 4.6.0
    
     @return int The 3-digit HTTP status code.
    
  **/
  @:native("get_status") public function getStatus():Int;
  /**
    
     Sets the 3-digit HTTP status code.
    
     @since 4.6.0
    
     @param int $code HTTP status.
    
  **/
  @:native("set_status") public function setStatus(code:Int):Void;
  /**
    
     Retrieves the response data.
    
     @since 4.6.0
    
     @return mixed Response data.
    
  **/
  @:native("get_data") public function getData():Dynamic;
  /**
    
     Sets the response data.
    
     @since 4.6.0
    
     @param mixed $data Response data.
    
  **/
  @:native("set_data") public function setData(data:Dynamic):Void;
  /**
    
     Retrieves cookies from the response.
    
     @since 4.6.0
    
     @return WP_HTTP_Cookie[] List of cookie objects.
    
  **/
  @:native("get_cookies") public function getCookies():php.NativeIndexedArray<wp.extern.HTTPCookie>;
  /**
    
     Converts the object to a WP_Http response array.
    
     @since 4.6.0
    
     @return array WP_Http response array, per WP_Http::request().
    
  **/
  @:native("to_array") public function toArray():php.NativeArray;
}
