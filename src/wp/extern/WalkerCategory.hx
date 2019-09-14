package wp.extern;

@:native("Walker_Category")
extern class WalkerCategory {
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
    
     Starts the list before the elements are added.
    
     @since 2.1.0
    
     @see Walker::start_lvl()
    
     @param string $output Used to append additional content. Passed by reference.
     @param int    $depth  Optional. Depth of category. Used for tab indentation. Default 0.
     @param array  $args   Optional. An array of arguments. Will only append content if style argument
                           value is 'list'. See wp_list_categories(). Default empty array.
    
  **/
  @:native("start_lvl") public function startLvl(output:String, depth:Int, args:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Ends the list of after the elements are added.
    
     @since 2.1.0
    
     @see Walker::end_lvl()
    
     @param string $output Used to append additional content. Passed by reference.
     @param int    $depth  Optional. Depth of category. Used for tab indentation. Default 0.
     @param array  $args   Optional. An array of arguments. Will only append content if style argument
                           value is 'list'. See wp_list_categories(). Default empty array.
    
  **/
  @:native("end_lvl") public function endLvl(output:String, depth:Int, args:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Starts the element output.
    
     @since 2.1.0
    
     @see Walker::start_el()
    
     @param string $output   Used to append additional content (passed by reference).
     @param object $category Category data object.
     @param int    $depth    Optional. Depth of category in reference to parents. Default 0.
     @param array  $args     Optional. An array of arguments. See wp_list_categories(). Default empty array.
     @param int    $id       Optional. ID of the current category. Default 0.
    
  **/
  @:native("start_el") public function startEl(output:String, category:Dynamic, depth:Int, args:php.NativeStructArray<Dynamic>, id:Int):Void;
  /**
    
     Ends the element output, if needed.
    
     @since 2.1.0
    
     @see Walker::end_el()
    
     @param string $output Used to append additional content (passed by reference).
     @param object $page   Not used.
     @param int    $depth  Optional. Depth of category. Not used.
     @param array  $args   Optional. An array of arguments. Only uses 'list' for whether should append
                           to output. See wp_list_categories(). Default empty array.
    
  **/
  @:native("end_el") public function endEl(output:String, page:Dynamic, depth:Int, args:php.NativeStructArray<Dynamic>):Void;
}
