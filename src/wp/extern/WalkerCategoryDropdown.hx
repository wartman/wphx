package wp.extern;

@:native("Walker_CategoryDropdown")
extern class WalkerCategoryDropdown {
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
     @todo Decouple this
     @var array
    
     @see Walker::$db_fields
    
  **/
  @:native("db_fields") public var dbFields:php.NativeStructArray<Dynamic>;
  /**
    
     Starts the element output.
    
     @since 2.1.0
    
     @see Walker::start_el()
    
     @param string $output   Used to append additional content (passed by reference).
     @param object $category Category data object.
     @param int    $depth    Depth of category. Used for padding.
     @param array  $args     Uses 'selected', 'show_count', and 'value_field' keys, if they exist.
                             See wp_dropdown_categories().
     @param int    $id       Optional. ID of the current category. Default 0 (unused).
    
  **/
  @:native("start_el") public function startEl(output:String, category:Dynamic, depth:Int, args:php.NativeStructArray<Dynamic>, id:Int):Void;
}
