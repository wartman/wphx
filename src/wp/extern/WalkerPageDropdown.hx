package wp.extern;

@:native("Walker_PageDropdown")
extern class WalkerPageDropdown {
  /**
    
     What the class handles.
    
     @since 2.1.0
     @var string
    
     @see Walker::$tree_type
    
  **/
  @:native("tree_type") public var treeType:String;
  /**
    
     Database fields to use.
    
     @since 2.1.0
     @var array
    
     @see Walker::$db_fields
     @todo Decouple this
    
  **/
  @:native("db_fields") public var dbFields:php.NativeStructArray<Dynamic>;
  /**
    
     Starts the element output.
    
     @since 2.1.0
    
     @see Walker::start_el()
    
     @param string  $output Used to append additional content. Passed by reference.
     @param WP_Post $page   Page data object.
     @param int     $depth  Optional. Depth of page in reference to parent pages. Used for padding.
                            Default 0.
     @param array   $args   Optional. Uses 'selected' argument for selected page to set selected HTML
                            attribute for option element. Uses 'value_field' argument to fill "value"
                            attribute. See wp_dropdown_pages(). Default empty array.
     @param int     $id     Optional. ID of the current page. Default 0 (unused).
    
  **/
  @:native("start_el") public function startEl(output:String, page:wp.extern.Post, depth:Int, args:php.NativeStructArray<Dynamic>, id:Int):Void;
}
