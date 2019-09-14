package wp.extern;

@:native("Walker_Nav_Menu")
extern class WalkerNavMenu {
  /**
    
     What the class handles.
    
     @since 3.0.0
     @var string
    
     @see Walker::$tree_type
    
  **/
  @:native("tree_type") public var treeType:String;
  /**
    
     Database fields to use.
    
     @since 3.0.0
     @todo Decouple this.
     @var array
    
     @see Walker::$db_fields
    
  **/
  @:native("db_fields") public var dbFields:php.NativeStructArray<Dynamic>;
  /**
    
     Starts the list before the elements are added.
    
     @since 3.0.0
    
     @see Walker::start_lvl()
    
     @param string   $output Used to append additional content (passed by reference).
     @param int      $depth  Depth of menu item. Used for padding.
     @param stdClass $args   An object of wp_nav_menu() arguments.
    
  **/
  @:native("start_lvl") public function startLvl(output:String, depth:Int, args:Dynamic):Void;
  /**
    
     Ends the list of after the elements are added.
    
     @since 3.0.0
    
     @see Walker::end_lvl()
    
     @param string   $output Used to append additional content (passed by reference).
     @param int      $depth  Depth of menu item. Used for padding.
     @param stdClass $args   An object of wp_nav_menu() arguments.
    
  **/
  @:native("end_lvl") public function endLvl(output:String, depth:Int, args:Dynamic):Void;
  /**
    
     Starts the element output.
    
     @since 3.0.0
     @since 4.4.0 The {@see 'nav_menu_item_args'} filter was added.
    
     @see Walker::start_el()
    
     @param string   $output Used to append additional content (passed by reference).
     @param WP_Post  $item   Menu item data object.
     @param int      $depth  Depth of menu item. Used for padding.
     @param stdClass $args   An object of wp_nav_menu() arguments.
     @param int      $id     Current item ID.
    
  **/
  @:native("start_el") public function startEl(output:String, item:wp.extern.Post, depth:Int, args:Dynamic, id:Int):Void;
  /**
    
     Ends the element output, if needed.
    
     @since 3.0.0
    
     @see Walker::end_el()
    
     @param string   $output Used to append additional content (passed by reference).
     @param WP_Post  $item   Page data object. Not used.
     @param int      $depth  Depth of page. Not Used.
     @param stdClass $args   An object of wp_nav_menu() arguments.
    
  **/
  @:native("end_el") public function endEl(output:String, item:wp.extern.Post, depth:Int, args:Dynamic):Void;
}
