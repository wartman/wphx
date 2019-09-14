package wp.extern;

@:native("Walker_Page")
extern class WalkerPage {
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
     @todo Decouple this.
    
  **/
  @:native("db_fields") public var dbFields:php.NativeStructArray<Dynamic>;
  /**
    
     Outputs the beginning of the current level in the tree before elements are output.
    
     @since 2.1.0
    
     @see Walker::start_lvl()
    
     @param string $output Used to append additional content (passed by reference).
     @param int    $depth  Optional. Depth of page. Used for padding. Default 0.
     @param array  $args   Optional. Arguments for outputting the next level.
                           Default empty array.
    
  **/
  @:native("start_lvl") public function startLvl(output:String, depth:Int, args:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Outputs the end of the current level in the tree after elements are output.
    
     @since 2.1.0
    
     @see Walker::end_lvl()
    
     @param string $output Used to append additional content (passed by reference).
     @param int    $depth  Optional. Depth of page. Used for padding. Default 0.
     @param array  $args   Optional. Arguments for outputting the end of the current level.
                           Default empty array.
    
  **/
  @:native("end_lvl") public function endLvl(output:String, depth:Int, args:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Outputs the beginning of the current element in the tree.
    
     @see Walker::start_el()
     @since 2.1.0
    
     @param string  $output       Used to append additional content. Passed by reference.
     @param WP_Post $page         Page data object.
     @param int     $depth        Optional. Depth of page. Used for padding. Default 0.
     @param array   $args         Optional. Array of arguments. Default empty array.
     @param int     $current_page Optional. Page ID. Default 0.
    
  **/
  @:native("start_el") public function startEl(output:String, page:wp.extern.Post, depth:Int, args:php.NativeStructArray<Dynamic>, current_page:Int):Void;
  /**
    
     Outputs the end of the current element in the tree.
    
     @since 2.1.0
    
     @see Walker::end_el()
    
     @param string  $output Used to append additional content. Passed by reference.
     @param WP_Post $page   Page data object. Not used.
     @param int     $depth  Optional. Depth of page. Default 0 (unused).
     @param array   $args   Optional. Array of arguments. Default empty array.
    
  **/
  @:native("end_el") public function endEl(output:String, page:wp.extern.Post, depth:Int, args:php.NativeStructArray<Dynamic>):Void;
}
