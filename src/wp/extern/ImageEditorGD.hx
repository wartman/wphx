package wp.extern;

@:native("WP_Image_Editor_GD")
extern class ImageEditorGD {
  /**
    
     Checks to see if current environment supports GD.
    
     @since 3.5.0
    
     @param array $args
     @return bool
    
  **/
  @:native("test") public static function test(?args:php.NativeStructArray<Dynamic>):Bool;
  /**
    
     Checks to see if editor supports the mime-type specified.
    
     @since 3.5.0
    
     @param string $mime_type
     @return bool
    
  **/
  @:native("supports_mime_type") public static function supportsMimeType(mime_type:String):Bool;
  /**
    
     Loads image from $this->file into new GD Resource.
    
     @since 3.5.0
    
     @return bool|WP_Error True if loaded successfully; WP_Error on failure.
    
  **/
  @:native("load") public function load():haxe.extern.EitherType<Bool, wp.extern.Error>;
  /**
    
     Resizes current image.
     Wraps _resize, since _resize returns a GD Resource.
    
     At minimum, either a height or width must be provided.
     If one of the two is set to null, the resize will
     maintain aspect ratio according to the provided dimension.
    
     @since 3.5.0
    
     @param  int|null $max_w Image width.
     @param  int|null $max_h Image height.
     @param  bool     $crop
     @return true|WP_Error
    
  **/
  @:native("resize") public function resize(max_w:Int, max_h:Int, crop:Bool = false):haxe.extern.EitherType<Bool, wp.extern.Error>;
  /**
    
     Resize multiple images from a single source.
    
     @since 3.5.0
    
     @param array $sizes {
         An array of image size arrays. Default sizes are 'small', 'medium', 'medium_large', 'large'.
    
         Either a height or width must be provided.
         If one of the two is set to null, the resize will
         maintain aspect ratio according to the provided dimension.
    
         @type array $size {
             Array of height, width values, and whether to crop.
    
             @type int  $width  Image width. Optional if `$height` is specified.
             @type int  $height Image height. Optional if `$width` is specified.
             @type bool $crop   Optional. Whether to crop the image. Default false.
         }
     }
     @return array An array of resized images' metadata by size.
    
  **/
  @:native("multi_resize") public function multiResize(sizes:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Crops Image.
    
     @since 3.5.0
    
     @param int  $src_x   The start x position to crop from.
     @param int  $src_y   The start y position to crop from.
     @param int  $src_w   The width to crop.
     @param int  $src_h   The height to crop.
     @param int  $dst_w   Optional. The destination width.
     @param int  $dst_h   Optional. The destination height.
     @param bool $src_abs Optional. If the source crop points are absolute.
     @return bool|WP_Error
    
  **/
  @:native("crop") public function crop(src_x:Int, src_y:Int, src_w:Int, src_h:Int, dst_w:Int = null, dst_h:Int = null, src_abs:Bool = false):haxe.extern.EitherType<Bool, wp.extern.Error>;
  /**
    
     Rotates current image counter-clockwise by $angle.
     Ported from image-edit.php
    
     @since 3.5.0
    
     @param float $angle
     @return true|WP_Error
    
  **/
  @:native("rotate") public function rotate(angle:Int):haxe.extern.EitherType<Bool, wp.extern.Error>;
  /**
    
     Flips current image.
    
     @since 3.5.0
    
     @param bool $horz Flip along Horizontal Axis.
     @param bool $vert Flip along Vertical Axis.
     @return true|WP_Error
    
  **/
  @:native("flip") public function flip(horz:Bool, vert:Bool):haxe.extern.EitherType<Bool, wp.extern.Error>;
  /**
    
     Saves current in-memory image to file.
    
     @since 3.5.0
    
     @param string|null $filename
     @param string|null $mime_type
     @return array|WP_Error {'path'=>string, 'file'=>string, 'width'=>int, 'height'=>int, 'mime-type'=>string}
    
  **/
  @:native("save") public function save(filename:String = null, mime_type:String = null):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, wp.extern.Error>;
  /**
    
     Returns stream of current image.
    
     @since 3.5.0
    
     @param string $mime_type The mime type of the image.
     @return bool True on success, false on failure.
    
  **/
  @:native("stream") public function stream(mime_type:String = null):Bool;
}
