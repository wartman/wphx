package wp.extern;

@:native("WP_Admin_Bar")
extern class AdminBar {
  /**
    
     @param string $name
     @return string|array|void
    
  **/
  @:native("__get") public function __get(name:String):haxe.extern.EitherType<String, php.NativeArray>;
  /**
    
    
  **/
  @:native("initialize") public function initialize():Void;
  /**
    
     @param array $node
    
  **/
  @:native("add_menu") public function addMenu(node:php.NativeStructArray<Dynamic>):Void;
  /**
    
     @param string $id
    
  **/
  @:native("remove_menu") public function removeMenu(id:String):Void;
  /**
    
     Adds a node to the menu.
    
     @since 3.1.0
     @since 4.5.0 Added the ability to pass 'lang' and 'dir' meta data.
    
     @param array $args {
         Arguments for adding a node.
    
         @type string $id     ID of the item.
         @type string $title  Title of the node.
         @type string $parent Optional. ID of the parent node.
         @type string $href   Optional. Link for the item.
         @type bool   $group  Optional. Whether or not the node is a group. Default false.
         @type array  $meta   Meta data including the following keys: 'html', 'class', 'rel', 'lang', 'dir',
                              'onclick', 'target', 'title', 'tabindex'. Default empty.
     }
    
  **/
  @:native("add_node") public function addNode(args:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Gets a node.
    
     @param string $id
     @return object Node.
    
  **/
  @:native("get_node") public function getNode(id:String):Dynamic;
  /**
    
     @return array|void
    
  **/
  @:native("get_nodes") public function getNodes():php.NativeArray;
  /**
    
     Add a group to a menu node.
    
     @since 3.3.0
    
     @param array $args {
         Array of arguments for adding a group.
    
         @type string $id     ID of the item.
         @type string $parent Optional. ID of the parent node. Default 'root'.
         @type array  $meta   Meta data for the group including the following keys:
                             'class', 'onclick', 'target', and 'title'.
     }
    
  **/
  @:native("add_group") public function addGroup(args:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Remove a node.
    
     @param string $id The ID of the item.
    
  **/
  @:native("remove_node") public function removeNode(id:String):Void;
  /**
    
    
  **/
  @:native("render") public function render():Void;
  /**
    
     Renders toolbar items recursively.
    
     @since 3.1.0
     @deprecated 3.3.0 Use WP_Admin_Bar::_render_item() or WP_Admin_bar::render() instead.
     @see WP_Admin_Bar::_render_item()
     @see WP_Admin_Bar::render()
    
     @param string $id    Unused.
     @param object $node
    
  **/
  @:native("recursive_render") public function recursiveRender(id:String, node:Dynamic):Void;
  /**
    
    
  **/
  @:native("add_menus") public function addMenus():Void;
}
