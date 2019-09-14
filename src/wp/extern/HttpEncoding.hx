package wp.extern;

@:native("WP_Http_Encoding")
extern class HttpEncoding {
  /**
    
     Compress raw string using the deflate format.
    
     Supports the RFC 1951 standard.
    
     @since 2.8.0
    
     @param string $raw String to compress.
     @param int $level Optional, default is 9. Compression level, 9 is highest.
     @param string $supports Optional, not used. When implemented it will choose the right compression based on what the server supports.
     @return string|false False on failure.
    
  **/
  @:native("compress") public static function compress(raw:String, level:Int = 9, supports:String = null):haxe.extern.EitherType<String, Bool>;
  /**
    
     Decompression of deflated string.
    
     Will attempt to decompress using the RFC 1950 standard, and if that fails
     then the RFC 1951 standard deflate will be attempted. Finally, the RFC
     1952 standard gzip decode will be attempted. If all fail, then the
     original compressed string will be returned.
    
     @since 2.8.0
    
     @param string $compressed String to decompress.
     @param int $length The optional length of the compressed data.
     @return string|bool False on failure.
    
  **/
  @:native("decompress") public static function decompress(compressed:String, length:Int = null):haxe.extern.EitherType<String, Bool>;
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
  /**
    
     What encoding types to accept and their priority values.
    
     @since 2.8.0
    
     @param string $url
     @param array  $args
     @return string Types of encoding to accept.
    
  **/
  @:native("accept_encoding") public static function acceptEncoding(url:String, args:php.NativeStructArray<Dynamic>):String;
  /**
    
     What encoding the content used when it was compressed to send in the headers.
    
     @since 2.8.0
    
     @return string Content-Encoding string to send in the header.
    
  **/
  @:native("content_encoding") public static function contentEncoding():String;
  /**
    
     Whether the content be decoded based on the headers.
    
     @since 2.8.0
    
     @param array|string $headers All of the available headers.
     @return bool
    
  **/
  @:native("should_decode") public static function shouldDecode(headers:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String>):Bool;
  /**
    
     Whether decompression and compression are supported by the PHP version.
    
     Each function is tested instead of checking for the zlib extension, to
     ensure that the functions all exist in the PHP version and aren't
     disabled.
    
     @since 2.8.0
    
     @return bool
    
  **/
  @:native("is_available") public static function isAvailable():Bool;
}
