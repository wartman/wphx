package wp.extern;

extern class MediaTemplateApi implements wp.util.ApiFunctions {
  /**
    
     Output the markup for a audio tag to be used in an Underscore template
     when data.model is passed.
    
     @since 3.9.0
    
  **/
  public function wp_underscore_audio_template():Void;
  /**
    
     Output the markup for a video tag to be used in an Underscore template
     when data.model is passed.
    
     @since 3.9.0
    
  **/
  public function wp_underscore_video_template():Void;
  /**
    
     Prints the templates used in the media manager.
    
     @since 3.5.0
    
     @global bool $is_IE
    
  **/
  public function wp_print_media_templates():Void;
}
