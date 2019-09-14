package wp.extern;

@:native("WP_Http_Streams")
extern class HttpStreams {
  /**
    
     Send a HTTP request to a URI using PHP Streams.
    
     @see WP_Http::request For default options descriptions.
    
     @since 2.7.0
     @since 3.7.0 Combined with the fsockopen transport and switched to stream_socket_client().
    
     @param string $url The request URL.
     @param string|array $args Optional. Override the defaults.
     @return array|WP_Error Array containing 'headers', 'body', 'response', 'cookies', 'filename'. A WP_Error instance upon error
    
  **/
  @:native("request") public function request(url:String, ?args:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, wp.extern.Error>;
  /**
    
     Verifies the received SSL certificate against its Common Names and subjectAltName fields.
    
     PHP's SSL verifications only verify that it's a valid Certificate, it doesn't verify if
     the certificate is valid for the hostname which was requested.
     This function verifies the requested hostname against certificate's subjectAltName field,
     if that is empty, or contains no DNS entries, a fallback to the Common Name field is used.
    
     IP Address support is included if the request is being made to an IP address.
    
     @since 3.7.0
    
     @param stream $stream The PHP Stream which the SSL request is being made over
     @param string $host The hostname being requested
     @return bool If the cerficiate presented in $stream is valid for $host
    
  **/
  @:native("verify_ssl_certificate") public static function verifySslCertificate(stream:stream, host:String):Bool;
  /**
    
     Determines whether this class can be used for retrieving a URL.
    
     @since 2.7.0
     @since 3.7.0 Combined with the fsockopen transport and switched to stream_socket_client().
    
     @param array $args Optional. Array of request arguments. Default empty array.
     @return bool False means this class can not be used, true means it can.
    
  **/
  @:native("test") public static function test(?args:php.NativeStructArray<Dynamic>):Bool;
}
