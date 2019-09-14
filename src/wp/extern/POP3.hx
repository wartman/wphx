package wp.extern;

@:native("POP3")
extern class POP3 {
  /**
    
     PHP5 constructor.
    
  **/
  @:native("__construct ") public function __construct (server:Dynamic = '', timeout:Dynamic = ''):Void;
  /**
    
     PHP4 constructor.
    
  **/
  @:native("POP3") public function POP3(server:Dynamic = '', timeout:Dynamic = ''):Void;
}
