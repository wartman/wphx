package wp.extern;

@:native("Walker_Comment")
extern class WalkerComment {
  /**
    
     What the class handles.
    
     @since 2.7.0
     @var string
    
     @see Walker::$tree_type
    
  **/
  @:native("tree_type") public var treeType:String;
  /**
    
     Database fields to use.
    
     @since 2.7.0
     @var array
    
     @see Walker::$db_fields
     @todo Decouple this
    
  **/
  @:native("db_fields") public var dbFields:php.NativeStructArray<Dynamic>;
  /**
    
     Starts the list before the elements are added.
    
     @since 2.7.0
    
     @see Walker::start_lvl()
     @global int $comment_depth
    
     @param string $output Used to append additional content (passed by reference).
     @param int    $depth  Optional. Depth of the current comment. Default 0.
     @param array  $args   Optional. Uses 'style' argument for type of HTML list. Default empty array.
    
  **/
  @:native("start_lvl") public function startLvl(output:String, depth:Int, args:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Ends the list of items after the elements are added.
    
     @since 2.7.0
    
     @see Walker::end_lvl()
     @global int $comment_depth
    
     @param string $output Used to append additional content (passed by reference).
     @param int    $depth  Optional. Depth of the current comment. Default 0.
     @param array  $args   Optional. Will only append content if style argument value is 'ol' or 'ul'.
                           Default empty array.
    
  **/
  @:native("end_lvl") public function endLvl(output:String, depth:Int, args:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Traverses elements to create list from elements.
    
     This function is designed to enhance Walker::display_element() to
     display children of higher nesting levels than selected inline on
     the highest depth level displayed. This prevents them being orphaned
     at the end of the comment list.
    
     Example: max_depth = 2, with 5 levels of nested content.
         1
          1.1
            1.1.1
            1.1.1.1
            1.1.1.1.1
            1.1.2
            1.1.2.1
         2
          2.2
    
     @since 2.7.0
    
     @see Walker::display_element()
     @see wp_list_comments()
    
     @param WP_Comment $element           Comment data object.
     @param array      $children_elements List of elements to continue traversing. Passed by reference.
     @param int        $max_depth         Max depth to traverse.
     @param int        $depth             Depth of the current element.
     @param array      $args              An array of arguments.
     @param string     $output            Used to append additional content. Passed by reference.
    
  **/
  @:native("display_element") public function displayElement(element:wp.extern.Comment, children_elements:php.NativeStructArray<Dynamic>, max_depth:Int, depth:Int, args:php.NativeStructArray<Dynamic>, output:String):Void;
  /**
    
     Starts the element output.
    
     @since 2.7.0
    
     @see Walker::start_el()
     @see wp_list_comments()
     @global int        $comment_depth
     @global WP_Comment $comment
    
     @param string     $output  Used to append additional content. Passed by reference.
     @param WP_Comment $comment Comment data object.
     @param int        $depth   Optional. Depth of the current comment in reference to parents. Default 0.
     @param array      $args    Optional. An array of arguments. Default empty array.
     @param int        $id      Optional. ID of the current comment. Default 0 (unused).
    
  **/
  @:native("start_el") public function startEl(output:String, comment:wp.extern.Comment, depth:Int, args:php.NativeStructArray<Dynamic>, id:Int):Void;
  /**
    
     Ends the element output, if needed.
    
     @since 2.7.0
    
     @see Walker::end_el()
     @see wp_list_comments()
    
     @param string     $output  Used to append additional content. Passed by reference.
     @param WP_Comment $comment The current comment object. Default current comment.
     @param int        $depth   Optional. Depth of the current comment. Default 0.
     @param array      $args    Optional. An array of arguments. Default empty array.
    
  **/
  @:native("end_el") public function endEl(output:String, comment:wp.extern.Comment, depth:Int, args:php.NativeStructArray<Dynamic>):Void;
}
