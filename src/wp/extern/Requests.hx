package wp.extern;

@:native("Requests")
extern class Requests {
  /**
    
     Selected transport name
    
     Use {@see get_transport()} instead
    
     @var array
    
  **/
  @:native("transport") public static var transport:php.NativeStructArray<Dynamic>;
  /**
    
     Autoloader for Requests
    
     Register this with {@see register_autoloader()} if you'd like to avoid
     having to create your own.
    
     (You can also use `spl_autoload_register` directly if you'd prefer.)
    
     @codeCoverageIgnore
    
     @param string $class Class name to load
    
  **/
  @:native("autoloader") public static function autoloader(class_:String):Void;
  /**
    
     Register the built-in autoloader
    
     @codeCoverageIgnore
    
  **/
  @:native("register_autoloader") public static function registerAutoloader():Void;
  /**
    
     Register a transport
    
     @param string $transport Transport class to add, must support the Requests_Transport interface
    
  **/
  @:native("add_transport") public static function addTransport(transport:String):Void;
  /**
    
     Send a GET request
    
  **/
  @:native("get") public static function get(url:Dynamic, ?headers:Dynamic, ?options:Dynamic):Void;
  /**
    
     Send a HEAD request
    
  **/
  @:native("head") public static function head(url:Dynamic, ?headers:Dynamic, ?options:Dynamic):Void;
  /**
    
     Send a DELETE request
    
  **/
  @:native("delete") public static function delete(url:Dynamic, ?headers:Dynamic, ?options:Dynamic):Void;
  /**
    
     Send a TRACE request
    
  **/
  @:native("trace") public static function trace(url:Dynamic, ?headers:Dynamic, ?options:Dynamic):Void;
  /**
    
     Send a POST request
    
  **/
  @:native("post") public static function post(url:Dynamic, ?headers:Dynamic, ?data:Dynamic, ?options:Dynamic):Void;
  /**
    
     Send a PUT request
    
  **/
  @:native("put") public static function put(url:Dynamic, ?headers:Dynamic, ?data:Dynamic, ?options:Dynamic):Void;
  /**
    
     Send an OPTIONS request
    
  **/
  @:native("options") public static function options(url:Dynamic, ?headers:Dynamic, ?data:Dynamic, ?options:Dynamic):Void;
  /**
    
     Send a PATCH request
    
     Note: Unlike {@see post} and {@see put}, `$headers` is required, as the
     specification recommends that should send an ETag
    
     @link https://tools.ietf.org/html/rfc5789
    
  **/
  @:native("patch") public static function patch(url:Dynamic, headers:Dynamic, ?data:Dynamic, ?options:Dynamic):Void;
  /**
    
     Main interface for HTTP requests
    
     This method initiates a request and sends it via a transport before
     parsing.
    
     The `$options` parameter takes an associative array with the following
     options:
    
     - `timeout`: How long should we wait for a response?
        Note: for cURL, a minimum of 1 second applies, as DNS resolution
        operates at second-resolution only.
        (float, seconds with a millisecond precision, default: 10, example: 0.01)
     - `connect_timeout`: How long should we wait while trying to connect?
        (float, seconds with a millisecond precision, default: 10, example: 0.01)
     - `useragent`: Useragent to send to the server
        (string, default: php-requests/$version)
     - `follow_redirects`: Should we follow 3xx redirects?
        (boolean, default: true)
     - `redirects`: How many times should we redirect before erroring?
        (integer, default: 10)
     - `blocking`: Should we block processing on this request?
        (boolean, default: true)
     - `filename`: File to stream the body to instead.
        (string|boolean, default: false)
     - `auth`: Authentication handler or array of user/password details to use
        for Basic authentication
        (Requests_Auth|array|boolean, default: false)
     - `proxy`: Proxy details to use for proxy by-passing and authentication
        (Requests_Proxy|array|string|boolean, default: false)
     - `max_bytes`: Limit for the response body size.
        (integer|boolean, default: false)
     - `idn`: Enable IDN parsing
        (boolean, default: true)
     - `transport`: Custom transport. Either a class name, or a
        transport object. Defaults to the first working transport from
        {@see getTransport()}
        (string|Requests_Transport, default: {@see getTransport()})
     - `hooks`: Hooks handler.
        (Requests_Hooker, default: new Requests_Hooks())
     - `verify`: Should we verify SSL certificates? Allows passing in a custom
        certificate file as a string. (Using true uses the system-wide root
        certificate store instead, but this may have different behaviour
        across transports.)
        (string|boolean, default: library/Requests/Transport/cacert.pem)
     - `verifyname`: Should we verify the common name in the SSL certificate?
        (boolean: default, true)
     - `data_format`: How should we send the `$data` parameter?
        (string, one of 'query' or 'body', default: 'query' for
        HEAD/GET/DELETE, 'body' for POST/PUT/OPTIONS/PATCH)
    
     @throws Requests_Exception On invalid URLs (`nonhttp`)
    
     @param string $url URL to request
     @param array $headers Extra headers to send with the request
     @param array|null $data Data to send either as a query string for GET/HEAD requests, or in the body for POST requests
     @param string $type HTTP request type (use Requests constants)
     @param array $options Options for the request (see description for more information)
     @return Requests_Response
    
  **/
  @:native("request") public static function request(url:String, ?headers:php.NativeStructArray<Dynamic>, ?data:php.NativeArray, type:String = self, options:php.NativeStructArray<Dynamic>):Requests_Response;
  /**
    
     Send multiple HTTP requests simultaneously
    
     The `$requests` parameter takes an associative or indexed array of
     request fields. The key of each request can be used to match up the
     request with the returned data, or with the request passed into your
     `multiple.request.complete` callback.
    
     The request fields value is an associative array with the following keys:
    
     - `url`: Request URL Same as the `$url` parameter to
        {@see Requests::request}
        (string, required)
     - `headers`: Associative array of header fields. Same as the `$headers`
        parameter to {@see Requests::request}
        (array, default: `array()`)
     - `data`: Associative array of data fields or a string. Same as the
        `$data` parameter to {@see Requests::request}
        (array|string, default: `array()`)
     - `type`: HTTP request type (use Requests constants). Same as the `$type`
        parameter to {@see Requests::request}
        (string, default: `Requests::GET`)
     - `cookies`: Associative array of cookie name to value, or cookie jar.
        (array|Requests_Cookie_Jar)
    
     If the `$options` parameter is specified, individual requests will
     inherit options from it. This can be used to use a single hooking system,
     or set all the types to `Requests::POST`, for example.
    
     In addition, the `$options` parameter takes the following global options:
    
     - `complete`: A callback for when a request is complete. Takes two
        parameters, a Requests_Response/Requests_Exception reference, and the
        ID from the request array (Note: this can also be overridden on a
        per-request basis, although that's a little silly)
        (callback)
    
     @param array $requests Requests data (see description for more information)
     @param array $options Global and default options (see {@see Requests::request})
     @return array Responses (either Requests_Response or a Requests_Exception object)
    
  **/
  @:native("request_multiple") public static function requestMultiple(requests:php.NativeStructArray<Dynamic>, ?options:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Get default certificate path.
    
     @return string Default certificate path.
    
  **/
  @:native("get_certificate_path") public static function getCertificatePath():String;
  /**
    
     Set default certificate path.
    
     @param string $path Certificate path, pointing to a PEM file.
    
  **/
  @:native("set_certificate_path") public static function setCertificatePath(path:String):Void;
  /**
    
     Callback for `transport.internal.parse_response`
    
     Internal use only. Converts a raw HTTP response to a Requests_Response
     while still executing a multiple request.
    
     @param string $response Full response text including headers and body (will be overwritten with Response instance)
     @param array $request Request data as passed into {@see Requests::request_multiple()}
     @return null `$response` is either set to a Requests_Response instance, or a Requests_Exception object
    
  **/
  @:native("parse_multiple") public static function parseMultiple(response:String, request:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Convert a key => value array to a 'key: value' array for headers
    
     @param array $array Dictionary of header values
     @return array List of headers
    
  **/
  @:native("flatten") public static function flatten(array:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Convert a key => value array to a 'key: value' array for headers
    
     @codeCoverageIgnore
     @deprecated Misspelling of {@see Requests::flatten}
     @param array $array Dictionary of header values
     @return array List of headers
    
  **/
  @:native("flattern") public static function flattern(array:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Decompress an encoded body
    
     Implements gzip, compress and deflate. Guesses which it is by attempting
     to decode.
    
     @param string $data Compressed data in one of the above formats
     @return string Decompressed string
    
  **/
  @:native("decompress") public static function decompress(data:String):String;
  /**
    
     Decompression of deflated string while staying compatible with the majority of servers.
    
     Certain Servers will return deflated data with headers which PHP's gzinflate()
     function cannot handle out of the box. The following function has been created from
     various snippets on the gzinflate() PHP documentation.
    
     Warning: Magic numbers within. Due to the potential different formats that the compressed
     data may be returned in, some "magic offsets" are needed to ensure proper decompression
     takes place. For a simple progmatic way to determine the magic offset in use, see:
     https://core.trac.wordpress.org/ticket/18273
    
     @since 2.8.1
     @link https://core.trac.wordpress.org/ticket/18273
     @link https://secure.php.net/manual/en/function.gzinflate.php#70875
     @link https://secure.php.net/manual/en/function.gzinflate.php#77336
    
     @param string $gzData String to decompress.
     @return string|bool False on failure.
    
  **/
  @:native("compatible_gzinflate") public static function compatibleGzinflate(gzData:String):haxe.extern.EitherType<String, Bool>;
}
