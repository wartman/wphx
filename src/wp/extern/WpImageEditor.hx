package wp.extern;

extern class WpImageEditor implements wp.util.ApiFunctions {
  /**
    
     Checks to see if current environment supports the editor chosen.
     Must be overridden in a sub-class.
    
     @since 3.5.0
    
     @abstract
    
     @param array $args
     @return bool
    
  **/
  public static function test(?args:php.NativeStructArray<Dynamic>):Bool;
  /**
    
     Checks to see if editor supports the mime-type specified.
     Must be overridden in a sub-class.
    
     @since 3.5.0
    
     @abstract
    
     @param string $mime_type
     @return bool
    
  **/
  public static function supports_mime_type(mime_type:String):Bool;
  /**
    
     Gets dimensions of image.
    
     @since 3.5.0
    
     @return array {'width'=>int, 'height'=>int}
    
  **/
  public function get_size():php.NativeArray;
  /**
    
     Gets the Image Compression quality on a 1-100% scale.
    
     @since 4.0.0
    
     @return int $quality Compression Quality. Range: [1,100]
    
  **/
  public function get_quality():Int;
  /**
    
     Sets Image Compression quality on a 1-100% scale.
    
     @since 3.5.0
    
     @param int $quality Compression Quality. Range: [1,100]
     @return true|WP_Error True if set successfully; WP_Error on failure.
    
  **/
  public function set_quality(quality:Int = null):haxe.extern.EitherType<Bool, wp.extern.Error>;
  /**
    
     Builds an output filename based on current file, and adding proper suffix
    
     @since 3.5.0
    
     @param string $suffix
     @param string $dest_path
     @param string $extension
     @return string filename
    
  **/
  public function generate_filename(suffix:String = null, dest_path:String = null, extension:String = null):String;
  /**
    
     Builds and returns proper suffix for file based on height and width.
    
     @since 3.5.0
    
     @return false|string suffix
    
  **/
  public function get_suffix():haxe.extern.EitherType<Bool, String>;
}
