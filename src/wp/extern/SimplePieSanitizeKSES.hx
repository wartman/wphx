package wp.extern;

@:native("WP_SimplePie_Sanitize_KSES")
extern class SimplePieSanitizeKSES {
  /**
    
     WordPress SimplePie sanitization using KSES.
    
     Sanitizes the incoming data, to ensure that it matches the type of data expected, using KSES.
    
     @since 3.5.0
    
     @param mixed   $data The data that needs to be sanitized.
     @param integer $type The type of data that it's supposed to be.
     @param string  $base Optional. The `xml:base` value to use when converting relative
                          URLs to absolute ones. Default empty.
     @return mixed Sanitized data.
    
  **/
  @:native("sanitize") public function sanitize(data:Dynamic, type:Int, base:String = ''):Dynamic;
}
