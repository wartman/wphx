package wp.extern;

@:native("WP_Error")
extern class Error {
  /**
    
     Stores the list of errors.
    
     @since 2.1.0
     @var array
    
  **/
  @:native("errors") public var errors:php.NativeStructArray<Dynamic>;
  /**
    
     Stores the list of data for error codes.
    
     @since 2.1.0
     @var array
    
  **/
  @:native("error_data") public var data:php.NativeStructArray<Dynamic>;
  /**
    
     Initialize the error.
    
     If `$code` is empty, the other parameters will be ignored.
     When `$code` is not empty, `$message` will be used even if
     it is empty. The `$data` parameter will be used only if it
     is not empty.
    
     Though the class is constructed with a single error code and
     message, multiple codes can be added using the `add()` method.
    
     @since 2.1.0
    
     @param string|int $code Error code
     @param string $message Error message
     @param mixed $data Optional. Error data.
    
  **/
  public function new(code:haxe.extern.EitherType<String, Int> = '', message:String = '', data:Dynamic = ''):Void;
  /**
    
     Retrieve all error codes.
    
     @since 2.1.0
    
     @return array List of error codes, if available.
    
  **/
  @:native("get_error_codes") public function getErrorCodes():php.NativeArray;
  /**
    
     Retrieve first error code available.
    
     @since 2.1.0
    
     @return string|int Empty string, if no error codes.
    
  **/
  @:native("get_error_code") public function getErrorCode():haxe.extern.EitherType<String, Int>;
  /**
    
     Retrieve all error messages or error messages matching code.
    
     @since 2.1.0
    
     @param string|int $code Optional. Retrieve messages matching code, if exists.
     @return array Error strings on success, or empty array on failure (if using code parameter).
    
  **/
  @:native("get_error_messages") public function getErrorMessages(code:haxe.extern.EitherType<String, Int> = ''):php.NativeArray;
  /**
    
     Get single error message.
    
     This will get the first message available for the code. If no code is
     given then the first code available will be used.
    
     @since 2.1.0
    
     @param string|int $code Optional. Error code to retrieve message.
     @return string
    
  **/
  @:native("get_error_message") public function getErrorMessage(code:haxe.extern.EitherType<String, Int> = ''):String;
  /**
    
     Retrieve error data for error code.
    
     @since 2.1.0
    
     @param string|int $code Optional. Error code.
     @return mixed Error data, if it exists.
    
  **/
  @:native("get_error_data") public function getErrorData(code:haxe.extern.EitherType<String, Int> = ''):Dynamic;
  /**
    
     Verify if the instance contains errors.
    
     @since 5.1.0
    
     @return bool
    
  **/
  @:native("has_errors") public function hasErrors():Bool;
  /**
    
     Add an error or append additional message to an existing error.
    
     @since 2.1.0
    
     @param string|int $code Error code.
     @param string $message Error message.
     @param mixed $data Optional. Error data.
    
  **/
  @:native("add") public function add(code:haxe.extern.EitherType<String, Int>, message:String, data:Dynamic = ''):Void;
  /**
    
     Add data for error code.
    
     The error code can only contain one error data.
    
     @since 2.1.0
    
     @param mixed $data Error data.
     @param string|int $code Error code.
    
  **/
  @:native("add_data") public function addData(data:Dynamic, code:haxe.extern.EitherType<String, Int> = ''):Void;
  /**
    
     Removes the specified error.
    
     This function removes all error messages associated with the specified
     error code, along with any error data for that code.
    
     @since 4.1.0
    
     @param string|int $code Error code.
    
  **/
  @:native("remove") public function remove(code:haxe.extern.EitherType<String, Int>):Void;
}
