package wp.extern;

@:native("Services_JSON")
extern class ServicesJSON {
  /**
    
     constructs a new JSON instance
    
     @param    int     $use    object behavior flags; combine with boolean-OR
    
                               possible values:
                               - SERVICES_JSON_LOOSE_TYPE:  loose typing.
                                       "{...}" syntax creates associative arrays
                                       instead of objects in decode().
                               - SERVICES_JSON_SUPPRESS_ERRORS:  error suppression.
                                       Values which can't be encoded (e.g. resources)
                                       appear as NULL instead of throwing errors.
                                       By default, a deeply-nested resource will
                                       bubble up with an error, so all return values
                                       from encode() should be checked with isError()
                               - SERVICES_JSON_USE_TO_JSON:  call toJSON when serializing objects
                                       It serializes the return value from the toJSON call rather
                                       than the object itself, toJSON can return associative arrays,
                                       strings or numbers, if you return an object, make sure it does
                                       not have a toJSON method, otherwise an error will occur.
    
  **/
  public function new(use:Int = 0):Void;
  /**
    
     PHP4 constructor.
    
  **/
  @:native("Services_JSON") public function ServicesJSON(use:Dynamic = 0):Void;
  /**
    
     convert a string from one UTF-16 char to one UTF-8 char
    
     Normally should be handled by mb_convert_encoding, but
     provides a slower PHP-only method for installations
     that lack the multibye string extension.
    
     @param    string  $utf16  UTF-16 character
     @return   string  UTF-8 character
     @access   private
    
  **/
  @:native("utf162utf8") public function utf162utf8(utf16:String):String;
  /**
    
     convert a string from one UTF-8 char to one UTF-16 char
    
     Normally should be handled by mb_convert_encoding, but
     provides a slower PHP-only method for installations
     that lack the multibye string extension.
    
     @param    string  $utf8   UTF-8 character
     @return   string  UTF-16 character
     @access   private
    
  **/
  @:native("utf82utf16") public function utf82utf16(utf8:String):String;
  /**
    
     encodes an arbitrary variable into JSON format (and sends JSON Header)
    
     @param    mixed   $var    any number, boolean, string, array, or object to be encoded.
                               see argument 1 to Services_JSON() above for array-parsing behavior.
                               if var is a string, note that encode() always expects it
                               to be in ASCII or UTF-8 format!
    
     @return   mixed   JSON string representation of input var or an error if a problem occurs
     @access   public
    
  **/
  @:native("encode") public function encode(var_:Dynamic):Dynamic;
  /**
    
     encodes an arbitrary variable into JSON format without JSON Header - warning - may allow XSS!!!!)
    
     @param    mixed   $var    any number, boolean, string, array, or object to be encoded.
                               see argument 1 to Services_JSON() above for array-parsing behavior.
                               if var is a string, note that encode() always expects it
                               to be in ASCII or UTF-8 format!
    
     @return   mixed   JSON string representation of input var or an error if a problem occurs
     @access   public
    
  **/
  @:native("encodeUnsafe") public function encodeUnsafe(var_:Dynamic):Dynamic;
  /**
    
     PRIVATE CODE that does the work of encodes an arbitrary variable into JSON format
    
     @param    mixed   $var    any number, boolean, string, array, or object to be encoded.
                               see argument 1 to Services_JSON() above for array-parsing behavior.
                               if var is a string, note that encode() always expects it
                               to be in ASCII or UTF-8 format!
    
     @return   mixed   JSON string representation of input var or an error if a problem occurs
     @access   public
    
  **/
  @:native("_encode") public function _encode(var_:Dynamic):Dynamic;
  /**
    
     array-walking function for use in generating JSON-formatted name-value pairs
    
     @param    string  $name   name of key to use
     @param    mixed   $value  reference to an array element to be encoded
    
     @return   string  JSON-formatted name-value pair, like '"name":value'
     @access   private
    
  **/
  @:native("name_value") public function nameValue(name:String, value:Dynamic):String;
  /**
    
     reduce a string by removing leading and trailing comments and whitespace
    
     @param    $str    string      string value to strip of comments and whitespace
    
     @return   string  string value stripped of comments and whitespace
     @access   private
    
  **/
  @:native("reduce_string") public function reduceString(str:):String;
  /**
    
     decodes a JSON string into appropriate variable
    
     @param    string  $str    JSON-formatted string
    
     @return   mixed   number, boolean, string, array, or object
                       corresponding to given JSON input string.
                       See argument 1 to Services_JSON() above for object-output behavior.
                       Note that decode() always returns strings
                       in ASCII or UTF-8 format!
     @access   public
    
  **/
  @:native("decode") public function decode(str:String):Dynamic;
  /**
    
     @todo Ultimately, this should just call PEAR::isError()
    
  **/
  @:native("isError") public function isError(data:Dynamic, code:Dynamic = null):Void;
  /**
    
     Calculates length of string in bytes
     @param string
     @return integer length
    
  **/
  @:native("strlen8") public function strlen8(<annon>:String, str:Dynamic):Int;
  /**
    
     Returns part of a string, interpreting $start and $length as number of bytes.
     @param string
     @param integer start
     @param integer length
     @return integer length
    
  **/
  @:native("substr8") public function substr8(<annon>:String, <annon>:Int, <annon>:Int, string:Dynamic, start:Dynamic, length:Dynamic = false):Int;
}
