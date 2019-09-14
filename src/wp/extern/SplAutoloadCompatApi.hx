package wp.extern;

extern class SplAutoloadCompatApi implements wp.util.ApiFunctions {
  /**
    
     Autoloader compatibility callback.
    
     @since 4.6.0
    
     @param string $classname Class to attempt autoloading.
    
  **/
  public function __autoload(classname:String):Void;
  /**
    
     Registers a function to be autoloaded.
    
     @since 4.6.0
    
     @param callable $autoload_function The function to register.
     @param bool     $throw             Optional. Whether the function should throw an exception
                                        if the function isn't callable. Default true.
     @param bool     $prepend           Whether the function should be prepended to the stack.
                                        Default false.
    
  **/
  public function spl_autoload_register(autoload_function:Dynamic, throw:Bool = true, prepend:Bool = false):Void;
  /**
    
     Unregisters an autoloader function.
    
     @since 4.6.0
    
     @param callable $function The function to unregister.
     @return bool True if the function was unregistered, false if it could not be.
    
  **/
  public function spl_autoload_unregister(function_:Dynamic):Bool;
  /**
    
     Retrieves the registered autoloader functions.
    
     @since 4.6.0
    
     @return array List of autoloader functions.
    
  **/
  public function spl_autoload_functions():php.NativeArray;
}
