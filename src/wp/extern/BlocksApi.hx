package wp.extern;

extern class BlocksApi implements wp.util.ApiFunctions {
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
     }
     @return WP_Block_Type|false The registered block type on success, or false on failure.
    
  **/
  public function register_block_type(name:haxe.extern.EitherType<String, wp.extern.BlockType>, ?args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<wp.extern.BlockType, Bool>;
  /**
    
     Unregisters a block type.
    
     @since 5.0.0
    
     @param string|WP_Block_Type $name Block type name including namespace, or alternatively a
                                       complete WP_Block_Type instance.
     @return WP_Block_Type|false The unregistered block type on success, or false on failure.
    
  **/
  public function unregister_block_type(name:haxe.extern.EitherType<String, wp.extern.BlockType>):haxe.extern.EitherType<wp.extern.BlockType, Bool>;
  /**
    
     Determine whether a post or content string has blocks.
    
     This test optimizes for performance rather than strict accuracy, detecting
     the pattern of a block but not validating its structure. For strict accuracy,
     you should use the block parser on post content.
    
     @since 5.0.0
     @see parse_blocks()
    
     @param int|string|WP_Post|null $post Optional. Post content, post ID, or post object. Defaults to global $post.
     @return bool Whether the post has blocks.
    
  **/
  public function has_blocks(post:haxe.extern.EitherType<Int, haxe.extern.EitherType<String, wp.extern.Post>> = null):Bool;
  /**
    
     Determine whether a $post or a string contains a specific block type.
    
     This test optimizes for performance rather than strict accuracy, detecting
     the block type exists but not validating its structure. For strict accuracy,
     you should use the block parser on post content.
    
     @since 5.0.0
     @see parse_blocks()
    
     @param string                  $block_type Full Block type to look for.
     @param int|string|WP_Post|null $post Optional. Post content, post ID, or post object. Defaults to global $post.
     @return bool Whether the post content contains the specified block.
    
  **/
  public function has_block(block_type:String, post:haxe.extern.EitherType<Int, haxe.extern.EitherType<String, wp.extern.Post>> = null):Bool;
  /**
    
     Returns an array of the names of all registered dynamic block types.
    
     @since 5.0.0
    
     @return array Array of dynamic block names.
    
  **/
  public function get_dynamic_block_names():php.NativeArray;
  /**
    
     Parses blocks out of a content string, and renders those appropriate for the excerpt.
    
     As the excerpt should be a small string of text relevant to the full post content,
     this function renders the blocks that are most likely to contain such text.
    
     @since 5.0.0
    
     @param string $content The content to parse.
     @return string The parsed and filtered content.
    
  **/
  public function excerpt_remove_blocks(content:String):String;
  /**
    
     Renders a single block into a HTML string.
    
     @since 5.0.0
    
     @global WP_Post $post The post to edit.
    
     @param array $block A single parsed block object.
     @return string String of rendered HTML.
    
  **/
  public function render_block(block:php.NativeStructArray<Dynamic>):String;
  /**
    
     Parses blocks out of a content string.
    
     @since 5.0.0
    
     @param string $content Post content.
     @return array Array of parsed block objects.
    
  **/
  public function parse_blocks(content:String):php.NativeArray;
  /**
    
     Parses dynamic blocks out of `post_content` and re-renders them.
    
     @since 5.0.0
     @global WP_Post $post The post to edit.
    
     @param  string $content Post content.
     @return string Updated post content.
    
  **/
  public function do_blocks(content:String):String;
  /**
    
     If do_blocks() needs to remove wp_autop() from the `the_content` filter, this re-adds it afterwards,
     for subsequent `the_content` usage.
    
     @access private
    
     @since 5.0.0
    
     @param string $content The post content running through this filter.
     @return string The unmodified content.
    
  **/
  public function _restore_wpautop_hook(content:String):String;
  /**
    
     Returns the current version of the block format that the content string is using.
    
     If the string doesn't contain blocks, it returns 0.
    
     @since 5.0.0
    
     @param string $content Content to test.
     @return int The block format version is 1 if the content contains one or more blocks, 0 otherwise.
    
  **/
  public function block_version(content:String):Int;
}
