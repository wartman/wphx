package wp.extern;

@:native("WP_Http")
extern class Http {
  /**
    
     Send an HTTP request to a URI.
    
     Please note: The only URI that are supported in the HTTP Transport implementation
     are the HTTP and HTTPS protocols.
    
     @since 2.7.0
    
     @param string       $url  The request URL.
     @param string|array $args {
         Optional. Array or string of HTTP request arguments.
    
         @type string       $method              Request method. Accepts 'GET', 'POST', 'HEAD', 'PUT', 'DELETE',
                                                 'TRACE', 'OPTIONS', or 'PATCH'.
                                                 Some transports technically allow others, but should not be
                                                 assumed. Default 'GET'.
         @type int          $timeout             How long the connection should stay open in seconds. Default 5.
         @type int          $redirection         Number of allowed redirects. Not supported by all transports
                                                 Default 5.
         @type string       $httpversion         Version of the HTTP protocol to use. Accepts '1.0' and '1.1'.
                                                 Default '1.0'.
         @type string       $user-agent          User-agent value sent.
                                                 Default 'WordPress/' . get_bloginfo( 'version' ) . '; ' . get_bloginfo( 'url' ).
         @type bool         $reject_unsafe_urls  Whether to pass URLs through wp_http_validate_url().
                                                 Default false.
         @type bool         $blocking            Whether the calling code requires the result of the request.
                                                 If set to false, the request will be sent to the remote server,
                                                 and processing returned to the calling code immediately, the caller
                                                 will know if the request succeeded or failed, but will not receive
                                                 any response from the remote server. Default true.
         @type string|array $headers             Array or string of headers to send with the request.
                                                 Default empty array.
         @type array        $cookies             List of cookies to send with the request. Default empty array.
         @type string|array $body                Body to send with the request. Default null.
         @type bool         $compress            Whether to compress the $body when sending the request.
                                                 Default false.
         @type bool         $decompress          Whether to decompress a compressed response. If set to false and
                                                 compressed content is returned in the response anyway, it will
                                                 need to be separately decompressed. Default true.
         @type bool         $sslverify           Whether to verify SSL for the request. Default true.
         @type string       sslcertificates      Absolute path to an SSL certificate .crt file.
                                                 Default ABSPATH . WPINC . '/certificates/ca-bundle.crt'.
         @type bool         $stream              Whether to stream to a file. If set to true and no filename was
                                                 given, it will be droped it in the WP temp dir and its name will
                                                 be set using the basename of the URL. Default false.
         @type string       $filename            Filename of the file to write to when streaming. $stream must be
                                                 set to true. Default null.
         @type int          $limit_response_size Size in bytes to limit the response to. Default null.
    
     }
     @return array|WP_Error Array containing 'headers', 'body', 'response', 'cookies', 'filename'.
                            A WP_Error instance upon error.
    
  **/
  @:native("request") public function request(url:String, ?args:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, wp.extern.Error>;
  /**
    
     Normalizes cookies for using in Requests.
    
     @since 4.6.0
    
     @param array $cookies Array of cookies to send with the request.
     @return Requests_Cookie_Jar Cookie holder object.
    
  **/
  @:native("normalize_cookies") public static function normalizeCookies(cookies:php.NativeStructArray<Dynamic>):Requests_Cookie_Jar;
  /**
    
     Match redirect behaviour to browser handling.
    
     Changes 302 redirects from POST to GET to match browser handling. Per
     RFC 7231, user agents can deviate from the strict reading of the
     specification for compatibility purposes.
    
     @since 4.6.0
    
     @param string            $location URL to redirect to.
     @param array             $headers  Headers for the redirect.
     @param string|array      $data     Body to send with the request.
     @param array             $options  Redirect request options.
     @param Requests_Response $original Response object.
    
  **/
  @:native("browser_redirect_compatibility") public static function browserRedirectCompatibility(location:String, headers:php.NativeStructArray<Dynamic>, data:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>, options:php.NativeStructArray<Dynamic>, original:Requests_Response):Void;
  /**
    
     Validate redirected URLs.
    
     @since 4.7.5
    
     @throws Requests_Exception On unsuccessful URL validation
     @param string $location URL to redirect to.
    
  **/
  @:native("validate_redirects") public static function validateRedirects(location:String):Void;
  /**
    
     Tests which transports are capable of supporting the request.
    
     @since 3.2.0
    
     @param array $args Request arguments
     @param string $url URL to Request
    
     @return string|false Class name for the first transport that claims to support the request. False if no transport claims to support the request.
    
  **/
  @:native("_get_first_available_transport") public function _getFirstAvailableTransport(args:php.NativeStructArray<Dynamic>, url:String = null):haxe.extern.EitherType<String, Bool>;
  /**
    
     Uses the POST HTTP method.
    
     Used for sending data that is expected to be in the body.
    
     @since 2.7.0
    
     @param string       $url  The request URL.
     @param string|array $args Optional. Override the defaults.
     @return array|WP_Error Array containing 'headers', 'body', 'response', 'cookies', 'filename'. A WP_Error instance upon error
    
  **/
  @:native("post") public function post(url:String, ?args:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, wp.extern.Error>;
  /**
    
     Uses the GET HTTP method.
    
     Used for sending data that is expected to be in the body.
    
     @since 2.7.0
    
     @param string $url The request URL.
     @param string|array $args Optional. Override the defaults.
     @return array|WP_Error Array containing 'headers', 'body', 'response', 'cookies', 'filename'. A WP_Error instance upon error
    
  **/
  @:native("get") public function get(url:String, ?args:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, wp.extern.Error>;
  /**
    
     Uses the HEAD HTTP method.
    
     Used for sending data that is expected to be in the body.
    
     @since 2.7.0
    
     @param string $url The request URL.
     @param string|array $args Optional. Override the defaults.
     @return array|WP_Error Array containing 'headers', 'body', 'response', 'cookies', 'filename'. A WP_Error instance upon error
    
  **/
  @:native("head") public function head(url:String, ?args:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, wp.extern.Error>;
  /**
    
     Parses the responses and splits the parts into headers and body.
    
     @since 2.7.0
    
     @param string $strResponse The full response string
     @return array Array with 'headers' and 'body' keys.
    
  **/
  @:native("processResponse") public static function processResponse(strResponse:String):php.NativeArray;
  /**
    
     Transform header string into an array.
    
     If an array is given then it is assumed to be raw header data with numeric keys with the
     headers as the values. No headers must be passed that were already processed.
    
     @since 2.7.0
    
     @param string|array $headers
     @param string $url The URL that was requested
     @return array Processed string headers. If duplicate headers are encountered,
                      Then a numbered array is returned as the value of that header-key.
    
  **/
  @:native("processHeaders") public static function processHeaders(headers:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>, url:String = ''):php.NativeArray;
  /**
    
     Takes the arguments for a ::request() and checks for the cookie array.
    
     If it's found, then it upgrades any basic name => value pairs to WP_Http_Cookie instances,
     which are each parsed into strings and added to the Cookie: header (within the arguments array).
     Edits the array by reference.
    
     @since 2.8.0
    
     @param array $r Full array of args passed into ::request()
    
  **/
  @:native("buildCookieHeader") public static function buildCookieHeader(r:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Decodes chunk transfer-encoding, based off the HTTP 1.1 specification.
    
     Based off the HTTP http_encoding_dechunk function.
    
     @link https://tools.ietf.org/html/rfc2616#section-19.4.6 Process for chunked decoding.
    
     @since 2.7.0
    
     @param string $body Body content
     @return string Chunked decoded body on success or raw body on failure.
    
  **/
  @:native("chunkTransferDecode") public static function chunkTransferDecode(body:String):String;
  /**
    
     Block requests through the proxy.
    
     Those who are behind a proxy and want to prevent access to certain hosts may do so. This will
     prevent plugins from working and core functionality, if you don't include api.wordpress.org.
    
     You block external URL requests by defining WP_HTTP_BLOCK_EXTERNAL as true in your wp-config.php
     file and this will only allow localhost and your site to make requests. The constant
     WP_ACCESSIBLE_HOSTS will allow additional hosts to go through for requests. The format of the
     WP_ACCESSIBLE_HOSTS constant is a comma separated list of hostnames to allow, wildcard domains
     are supported, eg *.wordpress.org will allow for all subdomains of wordpress.org to be contacted.
    
     @since 2.8.0
     @link https://core.trac.wordpress.org/ticket/8927 Allow preventing external requests.
     @link https://core.trac.wordpress.org/ticket/14636 Allow wildcard domains in WP_ACCESSIBLE_HOSTS
    
     @staticvar array|null $accessible_hosts
     @staticvar array      $wildcard_regex
    
     @param string $uri URI of url.
     @return bool True to block, false to allow.
    
  **/
  @:native("block_request") public function blockRequest(uri:String):Bool;
  /**
    
     Converts a relative URL to an absolute URL relative to a given URL.
    
     If an Absolute URL is provided, no processing of that URL is done.
    
     @since 3.4.0
    
     @param string $maybe_relative_path The URL which might be relative
     @param string $url                 The URL which $maybe_relative_path is relative to
     @return string An Absolute URL, in a failure condition where the URL cannot be parsed, the relative URL will be returned.
    
  **/
  @:native("make_absolute_url") public static function makeAbsoluteUrl(maybe_relative_path:String, url:String):String;
  /**
    
     Handles HTTP Redirects and follows them if appropriate.
    
     @since 3.7.0
    
     @param string $url The URL which was requested.
     @param array $args The Arguments which were used to make the request.
     @param array $response The Response of the HTTP request.
     @return false|object False if no redirect is present, a WP_HTTP or WP_Error result otherwise.
    
  **/
  @:native("handle_redirects") public static function handleRedirects(url:String, args:php.NativeStructArray<Dynamic>, response:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Bool, Dynamic>;
  /**
    
     Determines if a specified string represents an IP address or not.
    
     This function also detects the type of the IP address, returning either
     '4' or '6' to represent a IPv4 and IPv6 address respectively.
     This does not verify if the IP is a valid IP, only that it appears to be
     an IP address.
    
     @link http://home.deds.nl/~aeron/regex/ for IPv6 regex
    
     @since 3.7.0
    
     @param string $maybe_ip A suspected IP address
     @return integer|bool Upon success, '4' or '6' to represent a IPv4 or IPv6 address, false upon failure
    
  **/
  @:native("is_ip_address") public static function isIpAddress(maybe_ip:String):haxe.extern.EitherType<Int, Bool>;
}
