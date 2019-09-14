package wp.extern;

extern class VarsApi implements wp.util.ApiFunctions {
  /**
    
     Test if the current browser runs on a mobile device (smart phone, tablet, etc.)
    
     @since 3.4.0
    
     @return bool
    
  **/
  public function wp_is_mobile():Bool;
}
