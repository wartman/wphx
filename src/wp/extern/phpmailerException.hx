package wp.extern;

@:native("phpmailerException")
extern class phpmailerException {
  /**
    
     Prettify error message output
     @return string
    
  **/
  @:native("errorMessage") public function errorMessage():String;
}
