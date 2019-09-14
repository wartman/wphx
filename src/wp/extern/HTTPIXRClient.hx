package wp.extern;

@:native("WP_HTTP_IXR_Client")
extern class HTTPIXRClient {
  /**
    
     @var IXR_Error
    
  **/
  @:native("error") public var error:IXR_Error;
  /**
    
     @param string $server
     @param string|bool $path
     @param int|bool $port
     @param int $timeout
    
  **/
  public function new(server:String, path:haxe.extern.EitherType<String, Bool> = false, port:haxe.extern.EitherType<Int, Bool> = false, timeout:Int = 15):Void;
  /**
    
     @return bool
    
  **/
  @:native("query") public function query():Bool;
}
