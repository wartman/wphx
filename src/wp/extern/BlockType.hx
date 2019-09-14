package wp.extern;

@:native("WP_Block_Type")
extern class BlockType {
  /**
    
     Block type key.
    
     @since 5.0.0
     @var string
    
  **/
  @:native("name") public var name:String;
  /**
    
     Block type render callback.
    
     @since 5.0.0
     @var callable
    
  **/
  @:native("render_callback") public var renderCallback:Dynamic;
  /**
    
     Block type attributes property schemas.
    
     @since 5.0.0
     @var array
    
  **/
  @:native("attributes") public var attributes:php.NativeStructArray<Dynamic>;
  /**
    
     Block type editor script handle.
    
     @since 5.0.0
     @var string
    
  **/
  @:native("editor_script") public var editorScript:String;
  /**
    
     Block type front end script handle.
    
     @since 5.0.0
     @var string
    
  **/
  @:native("script") public var script:String;
  /**
    
     Block type editor style handle.
    
     @since 5.0.0
     @var string
    
  **/
  @:native("editor_style") public var editorStyle:String;
  /**
    
     Block type front end style handle.
    
     @since 5.0.0
     @var string
    
  **/
  @:native("style") public var style:String;
  /**
    
     Constructor.
    
     Will populate object properties from the provided arguments.
    
     @since 5.0.0
    
     @see register_block_type()
    
     @param string       $block_type Block type name including namespace.
     @param array|string $args       Optional. Array or string of arguments for registering a block type.
                                     Default empty array.
    
  **/
  public function new(block_type:String, ?args:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String>):Void;
  /**
    
     Renders the block type output for given attributes.
    
     @since 5.0.0
    
     @param array  $attributes Optional. Block attributes. Default empty array.
     @param string $content    Optional. Block content. Default empty string.
     @return string Rendered block type output.
    
  **/
  @:native("render") public function render(?attributes:php.NativeStructArray<Dynamic>, content:String = ''):String;
  /**
    
     Returns true if the block type is dynamic, or false otherwise. A dynamic
     block is one which defers its rendering to occur on-demand at runtime.
    
     @since 5.0.0
    
     @return boolean Whether block type is dynamic.
    
  **/
  @:native("is_dynamic") public function isDynamic():Bool;
  /**
    
     Validates attributes against the current block schema, populating
     defaulted and missing values.
    
     @since 5.0.0
    
     @param  array $attributes Original block attributes.
     @return array             Prepared block attributes.
    
  **/
  @:native("prepare_attributes_for_render") public function prepareAttributesForRender(attributes:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Sets block type properties.
    
     @since 5.0.0
    
     @param array|string $args Array or string of arguments for registering a block type.
    
  **/
  @:native("set_props") public function setProps(args:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String>):Void;
  /**
    
     Get all available block attributes including possible layout attribute from Columns block.
    
     @since 5.0.0
    
     @return array Array of attributes.
    
  **/
  @:native("get_attributes") public function getAttributes():php.NativeArray;
}
