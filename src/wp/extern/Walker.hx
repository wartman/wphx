package wp.extern;

@:native("Walker")
extern class Walker {
  /**
    
     What the class handles.
    
     @since 2.1.0
     @var string
    
  **/
  @:native("tree_type") public var treeType:String;
  /**
    
     DB fields to use.
    
     @since 2.1.0
     @var array
    
  **/
  @:native("db_fields") public var dbFields:php.NativeStructArray<Dynamic>;
  /**
    
     Max number of pages walked by the paged walker
    
     @since 2.7.0
     @var int
    
  **/
  @:native("max_pages") public var maxPages:Int;
  /**
    
     Whether the current element has children or not.
    
     To be used in start_el().
    
     @since 4.0.0
     @var bool
    
  **/
  @:native("has_children") public var hasChildren:Bool;
  /**
    
     Starts the list before the elements are added.
    
     The $args parameter holds additional values that may be used with the child
     class methods. This method is called at the start of the output list.
    
     @since 2.1.0
     @abstract
    
     @param string $output Used to append additional content (passed by reference).
     @param int    $depth  Depth of the item.
     @param array  $args   An array of additional arguments.
    
  **/
  @:native("start_lvl") public function startLvl(output:String, depth:Int, args:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Ends the list of after the elements are added.
    
     The $args parameter holds additional values that may be used with the child
     class methods. This method finishes the list at the end of output of the elements.
    
     @since 2.1.0
     @abstract
    
     @param string $output Used to append additional content (passed by reference).
     @param int    $depth  Depth of the item.
     @param array  $args   An array of additional arguments.
    
  **/
  @:native("end_lvl") public function endLvl(output:String, depth:Int, args:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Start the element output.
    
     The $args parameter holds additional values that may be used with the child
     class methods. Includes the element output also.
    
     @since 2.1.0
     @abstract
    
     @param string $output            Used to append additional content (passed by reference).
     @param object $object            The data object.
     @param int    $depth             Depth of the item.
     @param array  $args              An array of additional arguments.
     @param int    $current_object_id ID of the current item.
    
  **/
  @:native("start_el") public function startEl(output:String, object:Dynamic, depth:Int, args:php.NativeStructArray<Dynamic>, current_object_id:Int):Void;
  /**
    
     Ends the element output, if needed.
    
     The $args parameter holds additional values that may be used with the child class methods.
    
     @since 2.1.0
     @abstract
    
     @param string $output Used to append additional content (passed by reference).
     @param object $object The data object.
     @param int    $depth  Depth of the item.
     @param array  $args   An array of additional arguments.
    
  **/
  @:native("end_el") public function endEl(output:String, object:Dynamic, depth:Int, args:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Traverse elements to create list from elements.
    
     Display one element if the element doesn't have any children otherwise,
     display the element and its children. Will only traverse up to the max
     depth and no ignore elements under that depth. It is possible to set the
     max depth to include all depths, see walk() method.
    
     This method should not be called directly, use the walk() method instead.
    
     @since 2.5.0
    
     @param object $element           Data object.
     @param array  $children_elements List of elements to continue traversing (passed by reference).
     @param int    $max_depth         Max depth to traverse.
     @param int    $depth             Depth of current element.
     @param array  $args              An array of arguments.
     @param string $output            Used to append additional content (passed by reference).
    
  **/
  @:native("display_element") public function displayElement(element:Dynamic, children_elements:php.NativeStructArray<Dynamic>, max_depth:Int, depth:Int, args:php.NativeStructArray<Dynamic>, output:String):Void;
  /**
    
     Display array of elements hierarchically.
    
     Does not assume any existing order of elements.
    
     $max_depth = -1 means flatly display every element.
     $max_depth = 0 means display all levels.
     $max_depth > 0 specifies the number of display levels.
    
     @since 2.1.0
    
     @param array $elements  An array of elements.
     @param int   $max_depth The maximum hierarchical depth.
     @return string The hierarchical item output.
    
  **/
  @:native("walk") public function walk(elements:php.NativeStructArray<Dynamic>, max_depth:Int):String;
  /**
    
     paged_walk() - produce a page of nested elements
    
     Given an array of hierarchical elements, the maximum depth, a specific page number,
     and number of elements per page, this function first determines all top level root elements
     belonging to that page, then lists them and all of their children in hierarchical order.
    
     $max_depth = 0 means display all levels.
     $max_depth > 0 specifies the number of display levels.
    
     @since 2.7.0
    
     @param array $elements
     @param int   $max_depth The maximum hierarchical depth.
     @param int   $page_num The specific page number, beginning with 1.
     @param int   $per_page
     @return string XHTML of the specified page of elements
    
  **/
  @:native("paged_walk") public function pagedWalk(elements:php.NativeStructArray<Dynamic>, max_depth:Int, page_num:Int, per_page:Int):String;
  /**
    
     Calculates the total number of root elements.
    
     @since 2.7.0
    
     @param array $elements Elements to list.
     @return int Number of root elements.
    
  **/
  @:native("get_number_of_root_elements") public function getNumberOfRootElements(elements:php.NativeStructArray<Dynamic>):Int;
  /**
    
     Unset all the children for a given top level element.
    
     @since 2.7.0
    
     @param object $e
     @param array $children_elements
    
  **/
  @:native("unset_children") public function unsetChildren(e:Dynamic, children_elements:php.NativeStructArray<Dynamic>):Void;
}
