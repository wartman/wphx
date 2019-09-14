package wp.extern;

extern class HttpApi implements wp.util.ApiFunctions {
  /**
    
     Returns the initialized WP_Http Object
    
     @since 2.7.0
     @access private
    
     @staticvar WP_Http $http
    
     @return WP_Http HTTP Transport object.
    
  **/
  public function _wp_http_get_object():wp.extern.Http;
  /**
    
     Retrieve the raw response from a safe HTTP request.
    
     This function is ideal when the HTTP request is being made to an arbitrary
     URL. The URL is validated to avoid redirection and request forgery attacks.
    
     @since 3.6.0
    
     @see wp_remote_request() For more information on the response array format.
     @see WP_Http::request() For default arguments information.
    
     @param string $url  Site URL to retrieve.
     @param array  $args Optional. Request arguments. Default empty array.
     @return WP_Error|array The response or WP_Error on failure.
    
  **/
  public function wp_safe_remote_request(url:String, ?args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<wp.extern.Error, php.NativeStructArray<Dynamic>>;
  /**
    
     Retrieve the raw response from a safe HTTP request using the GET method.
    
     This function is ideal when the HTTP request is being made to an arbitrary
     URL. The URL is validated to avoid redirection and request forgery attacks.
    
     @since 3.6.0
    
     @see wp_remote_request() For more information on the response array format.
     @see WP_Http::request() For default arguments information.
    
     @param string $url  Site URL to retrieve.
     @param array  $args Optional. Request arguments. Default empty array.
     @return WP_Error|array The response or WP_Error on failure.
    
  **/
  public function wp_safe_remote_get(url:String, ?args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<wp.extern.Error, php.NativeStructArray<Dynamic>>;
  /**
    
     Retrieve the raw response from a safe HTTP request using the POST method.
    
     This function is ideal when the HTTP request is being made to an arbitrary
     URL. The URL is validated to avoid redirection and request forgery attacks.
    
     @since 3.6.0
    
     @see wp_remote_request() For more information on the response array format.
     @see WP_Http::request() For default arguments information.
    
     @param string $url  Site URL to retrieve.
     @param array  $args Optional. Request arguments. Default empty array.
     @return WP_Error|array The response or WP_Error on failure.
    
  **/
  public function wp_safe_remote_post(url:String, ?args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<wp.extern.Error, php.NativeStructArray<Dynamic>>;
  /**
    
     Retrieve the raw response from a safe HTTP request using the HEAD method.
    
     This function is ideal when the HTTP request is being made to an arbitrary
     URL. The URL is validated to avoid redirection and request forgery attacks.
    
     @since 3.6.0
    
     @see wp_remote_request() For more information on the response array format.
     @see WP_Http::request() For default arguments information.
    
     @param string $url Site URL to retrieve.
     @param array $args Optional. Request arguments. Default empty array.
     @return WP_Error|array The response or WP_Error on failure.
    
  **/
  public function wp_safe_remote_head(url:String, ?args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<wp.extern.Error, php.NativeStructArray<Dynamic>>;
  /**
    
     Retrieve the raw response from the HTTP request.
    
     The array structure is a little complex:
    
         $res = array(
             'headers'  => array(),
             'response' => array(
                 'code'    => int,
                 'message' => string
             )
         );
    
     All of the headers in $res['headers'] are with the name as the key and the
     value as the value. So to get the User-Agent, you would do the following.
    
         $user_agent = $res['headers']['user-agent'];
    
     The body is the raw response content and can be retrieved from $res['body'].
    
     This function is called first to make the request and there are other API
     functions to abstract out the above convoluted setup.
    
     Request method defaults for helper functions:
      - Default 'GET'  for wp_remote_get()
      - Default 'POST' for wp_remote_post()
      - Default 'HEAD' for wp_remote_head()
    
     @since 2.7.0
    
     @see WP_Http::request() For additional information on default arguments.
    
     @param string $url  Site URL to retrieve.
     @param array  $args Optional. Request arguments. Default empty array.
     @return WP_Error|array The response or WP_Error on failure.
    
  **/
  public function wp_remote_request(url:String, ?args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<wp.extern.Error, php.NativeStructArray<Dynamic>>;
  /**
    
     Retrieve the raw response from the HTTP request using the GET method.
    
     @since 2.7.0
    
     @see wp_remote_request() For more information on the response array format.
     @see WP_Http::request() For default arguments information.
    
     @param string $url  Site URL to retrieve.
     @param array  $args Optional. Request arguments. Default empty array.
     @return WP_Error|array The response or WP_Error on failure.
    
  **/
  public function wp_remote_get(url:String, ?args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<wp.extern.Error, php.NativeStructArray<Dynamic>>;
  /**
    
     Retrieve the raw response from the HTTP request using the POST method.
    
     @since 2.7.0
    
     @see wp_remote_request() For more information on the response array format.
     @see WP_Http::request() For default arguments information.
    
     @param string $url  Site URL to retrieve.
     @param array  $args Optional. Request arguments. Default empty array.
     @return WP_Error|array The response or WP_Error on failure.
    
  **/
  public function wp_remote_post(url:String, ?args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<wp.extern.Error, php.NativeStructArray<Dynamic>>;
  /**
    
     Retrieve the raw response from the HTTP request using the HEAD method.
    
     @since 2.7.0
    
     @see wp_remote_request() For more information on the response array format.
     @see WP_Http::request() For default arguments information.
    
     @param string $url  Site URL to retrieve.
     @param array  $args Optional. Request arguments. Default empty array.
     @return WP_Error|array The response or WP_Error on failure.
    
  **/
  public function wp_remote_head(url:String, ?args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<wp.extern.Error, php.NativeStructArray<Dynamic>>;
  /**
    
     Retrieve only the headers from the raw response.
    
     @since 2.7.0
     @since 4.6.0 Return value changed from an array to an Requests_Utility_CaseInsensitiveDictionary instance.
    
     @see \Requests_Utility_CaseInsensitiveDictionary
    
     @param array $response HTTP response.
     @return array|\Requests_Utility_CaseInsensitiveDictionary The headers of the response. Empty array if incorrect parameter given.
    
  **/
  public function wp_remote_retrieve_headers(response:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, >;
  /**
    
     Retrieve a single header by name from the raw response.
    
     @since 2.7.0
    
     @param array  $response
     @param string $header Header name to retrieve value from.
     @return string The header value. Empty string on if incorrect parameter given, or if the header doesn't exist.
    
  **/
  public function wp_remote_retrieve_header(response:php.NativeStructArray<Dynamic>, header:String):String;
  /**
    
     Retrieve only the response code from the raw response.
    
     Will return an empty array if incorrect parameter value is given.
    
     @since 2.7.0
    
     @param array $response HTTP response.
     @return int|string The response code as an integer. Empty string on incorrect parameter given.
    
  **/
  public function wp_remote_retrieve_response_code(response:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Int, String>;
  /**
    
     Retrieve only the response message from the raw response.
    
     Will return an empty array if incorrect parameter value is given.
    
     @since 2.7.0
    
     @param array $response HTTP response.
     @return string The response message. Empty string on incorrect parameter given.
    
  **/
  public function wp_remote_retrieve_response_message(response:php.NativeStructArray<Dynamic>):String;
  /**
    
     Retrieve only the body from the raw response.
    
     @since 2.7.0
    
     @param array $response HTTP response.
     @return string The body of the response. Empty string if no body or incorrect parameter given.
    
  **/
  public function wp_remote_retrieve_body(response:php.NativeStructArray<Dynamic>):String;
  /**
    
     Retrieve only the cookies from the raw response.
    
     @since 4.4.0
    
     @param array $response HTTP response.
     @return array An array of `WP_Http_Cookie` objects from the response. Empty array if there are none, or the response is a WP_Error.
    
  **/
  public function wp_remote_retrieve_cookies(response:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Retrieve a single cookie by name from the raw response.
    
     @since 4.4.0
    
     @param array  $response HTTP response.
     @param string $name     The name of the cookie to retrieve.
     @return WP_Http_Cookie|string The `WP_Http_Cookie` object. Empty string if the cookie isn't present in the response.
    
  **/
  public function wp_remote_retrieve_cookie(response:php.NativeStructArray<Dynamic>, name:String):haxe.extern.EitherType<wp.extern.HttpCookie, String>;
  /**
    
     Retrieve a single cookie's value by name from the raw response.
    
     @since 4.4.0
    
     @param array  $response HTTP response.
     @param string $name     The name of the cookie to retrieve.
     @return string The value of the cookie. Empty string if the cookie isn't present in the response.
    
  **/
  public function wp_remote_retrieve_cookie_value(response:php.NativeStructArray<Dynamic>, name:String):String;
  /**
    
     Determines if there is an HTTP Transport that can process this request.
    
     @since 3.2.0
    
     @param array  $capabilities Array of capabilities to test or a wp_remote_request() $args array.
     @param string $url          Optional. If given, will check if the URL requires SSL and adds
                                 that requirement to the capabilities array.
    
     @return bool
    
  **/
  public function wp_http_supports(?capabilities:php.NativeStructArray<Dynamic>, url:String = null):Bool;
  /**
    
     Get the HTTP Origin of the current request.
    
     @since 3.4.0
    
     @return string URL of the origin. Empty string if no origin.
    
  **/
  public function get_http_origin():String;
  /**
    
     Retrieve list of allowed HTTP origins.
    
     @since 3.4.0
    
     @return array Array of origin URLs.
    
  **/
  public function get_allowed_http_origins():php.NativeArray;
  /**
    
     Determines if the HTTP origin is an authorized one.
    
     @since 3.4.0
    
     @param null|string $origin Origin URL. If not provided, the value of get_http_origin() is used.
     @return string Origin URL if allowed, empty string if not.
    
  **/
  public function is_allowed_http_origin(origin:String = null):String;
  /**
    
     Send Access-Control-Allow-Origin and related headers if the current request
     is from an allowed origin.
    
     If the request is an OPTIONS request, the script exits with either access
     control headers sent, or a 403 response if the origin is not allowed. For
     other request methods, you will receive a return value.
    
     @since 3.4.0
    
     @return string|false Returns the origin URL if headers are sent. Returns false
                          if headers are not sent.
    
  **/
  public function send_origin_headers():haxe.extern.EitherType<String, Bool>;
  /**
    
     Validate a URL for safe use in the HTTP API.
    
     @since 3.5.2
    
     @param string $url
     @return false|string URL or false on failure.
    
  **/
  public function wp_http_validate_url(url:String):haxe.extern.EitherType<Bool, String>;
  /**
    
     Whitelists allowed redirect hosts for safe HTTP requests as well.
    
     Attached to the {@see 'http_request_host_is_external'} filter.
    
     @since 3.6.0
    
     @param bool   $is_external
     @param string $host
     @return bool
    
  **/
  public function allowed_http_request_hosts(is_external:Bool, host:String):Bool;
  /**
    
     Whitelists any domain in a multisite installation for safe HTTP requests.
    
     Attached to the {@see 'http_request_host_is_external'} filter.
    
     @since 3.6.0
    
     @global wpdb $wpdb WordPress database abstraction object.
     @staticvar array $queried
    
     @param bool   $is_external
     @param string $host
     @return bool
    
  **/
  public function ms_allowed_http_request_hosts(is_external:Bool, host:String):Bool;
  /**
    
     A wrapper for PHP's parse_url() function that handles consistency in the return
     values across PHP versions.
    
     PHP 5.4.7 expanded parse_url()'s ability to handle non-absolute url's, including
     schemeless and relative url's with :// in the path. This function works around
     those limitations providing a standard output on PHP 5.2~5.4+.
    
     Secondly, across various PHP versions, schemeless URLs starting containing a ":"
     in the query are being handled inconsistently. This function works around those
     differences as well.
    
     Error suppression is used as prior to PHP 5.3.3, an E_WARNING would be generated
     when URL parsing failed.
    
     @since 4.4.0
     @since 4.7.0 The `$component` parameter was added for parity with PHP's `parse_url()`.
    
     @link https://secure.php.net/manual/en/function.parse-url.php
    
     @param string $url       The URL to parse.
     @param int    $component The specific component to retrieve. Use one of the PHP
                              predefined constants to specify which one.
                              Defaults to -1 (= return all parts as an array).
     @return mixed False on parse failure; Array of URL components on success;
                   When a specific component has been requested: null if the component
                   doesn't exist in the given URL; a string or - in the case of
                   PHP_URL_PORT - integer when it does. See parse_url()'s return values.
    
  **/
  public function wp_parse_url(url:String, component:Int = ):Dynamic;
  /**
    
     Retrieve a specific component from a parsed URL array.
    
     @internal
    
     @since 4.7.0
     @access private
    
     @link https://secure.php.net/manual/en/function.parse-url.php
    
     @param array|false $url_parts The parsed URL. Can be false if the URL failed to parse.
     @param int    $component The specific component to retrieve. Use one of the PHP
                              predefined constants to specify which one.
                              Defaults to -1 (= return all parts as an array).
     @return mixed False on parse failure; Array of URL components on success;
                   When a specific component has been requested: null if the component
                   doesn't exist in the given URL; a string or - in the case of
                   PHP_URL_PORT - integer when it does. See parse_url()'s return values.
    
  **/
  public function _get_component_from_parsed_url_array(url_parts:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Bool>, component:Int = ):Dynamic;
  /**
    
     Translate a PHP_URL_* constant to the named array keys PHP uses.
    
     @internal
    
     @since 4.7.0
     @access private
    
     @link https://secure.php.net/manual/en/url.constants.php
    
     @param int $constant PHP_URL_* constant.
     @return string|bool The named key or false.
    
  **/
  public function _wp_translate_php_url_constant_to_key(constant:Int):haxe.extern.EitherType<String, Bool>;
}
