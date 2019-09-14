package wp.extern;

@:native("WP_Block_Type_Registry")
extern class BlockTypeRegistry {
  /**
    
     Registers a block type.
    
     @since 5.0.0
    
     @param string|WP_Block_Type $name Block type name including namespace, or alternatively a
                                       complete WP_Block_Type instance. In case a WP_Block_Type
                                       is provided, the $args parameter will be ignored.
     @param array                $args {
         Optional. Array of block type arguments. Any arguments may be defined, however the
         ones described below are supported by default. Default empty array.
    
         @type callable $render_callback Callback used to render blocks of this block type.
         @type array    $attributes      Block attributes mapping, property name to schema.
     }
     @return WP_Block_Type|false The registered block type on success, or false on failure.
    
  **/
  @:native("register") public function register(name:haxe.extern.EitherType<String, wp.extern.BlockType>, ?args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<wp.extern.BlockType, Bool>;
  /**
    
     Unregisters a block type.
    
     @since 5.0.0
    
     @param string|WP_Block_Type $name Block type name including namespace, or alternatively a
                                       complete WP_Block_Type instance.
     @return WP_Block_Type|false The unregistered block type on success, or false on failure.
    
  **/
  @:native("unregister") public function unregister(name:haxe.extern.EitherType<String, wp.extern.BlockType>):haxe.extern.EitherType<wp.extern.BlockType, Bool>;
  /**
    
     Retrieves a registered block type.
    
     @since 5.0.0
    
     @param string $name Block type name including namespace.
     @return WP_Block_Type|null The registered block type, or null if it is not registered.
    
  **/
  @:native("get_registered") public function getRegistered(name:String):wp.extern.BlockType;
  /**
    
     Retrieves all registered block types.
    
     @since 5.0.0
    
     @return WP_Block_Type[] Associative array of `$block_type_name => $block_type` pairs.
    
  **/
  @:native("get_all_registered") public function getAllRegistered():php.NativeIndexedArray<wp.extern.BlockType>;
  /**
    
     Checks if a block type is registered.
    
     @since 5.0.0
    
     @param string $name Block type name including namespace.
     @return bool True if the block type is registered, false otherwise.
    
  **/
  @:native("is_registered") public function isRegistered(name:String):Bool;
  /**
    
     Utility method to retrieve the main instance of the class.
    
     The instance will be created if it does not exist yet.
    
     @since 5.0.0
    
     @return WP_Block_Type_Registry The main instance.
    
  **/
  @:native("get_instance") public static function getInstance():wp.extern.BlockTypeRegistry;
}
