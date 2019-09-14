package wp.extern;

@:native("Services_JSON_Error")
extern class ServicesJSONError {
  /**
    
     PHP5 constructor.
    
  **/
  public function new(message:Dynamic = 'unknown error', code:Dynamic = null, mode:Dynamic = null, options:Dynamic = null, userinfo:Dynamic = null):Void;
  /**
    
     PHP4 constructor.
    
  **/
  @:native("Services_JSON_Error") public function ServicesJSONError(message:Dynamic = 'unknown error', code:Dynamic = null, mode:Dynamic = null, options:Dynamic = null, userinfo:Dynamic = null):Void;
}
