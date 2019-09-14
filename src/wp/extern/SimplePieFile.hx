package wp.extern;

@:native("WP_SimplePie_File")
extern class SimplePieFile {
  /**
    
     Constructor.
    
     @since 2.8.0
     @since 3.2.0 Updated to use a PHP5 constructor.
    
     @param string       $url             Remote file URL.
     @param integer      $timeout         Optional. How long the connection should stay open in seconds.
                                          Default 10.
     @param integer      $redirects       Optional. The number of allowed redirects. Default 5.
     @param string|array $headers         Optional. Array or string of headers to send with the request.
                                          Default null.
     @param string       $useragent       Optional. User-agent value sent. Default null.
     @param boolean      $force_fsockopen Optional. Whether to force opening internet or unix domain socket
                                          connection or not. Default false.
    
  **/
  public function new(url:String, timeout:Int = 10, redirects:Int = 5, headers:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = null, useragent:String = null, force_fsockopen:Bool = false):Void;
}
