package wp.extern;

extern class PostThumbnailTemplateApi implements wp.util.ApiFunctions {
  /**
    
     Determines whether a post has an image attached.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 2.9.0
     @since 4.4.0 `$post` can be a post ID or WP_Post object.
    
     @param int|WP_Post $post Optional. Post ID or WP_Post object. Default is global `$post`.
     @return bool Whether the post has an image attached.
    
  **/
  public function has_post_thumbnail(post:haxe.extern.EitherType<Int, wp.extern.Post> = null):Bool;
  /**
    
     Retrieve post thumbnail ID.
    
     @since 2.9.0
     @since 4.4.0 `$post` can be a post ID or WP_Post object.
    
     @param int|WP_Post $post Optional. Post ID or WP_Post object. Default is global `$post`.
     @return string|int Post thumbnail ID or empty string.
    
  **/
  public function get_post_thumbnail_id(post:haxe.extern.EitherType<Int, wp.extern.Post> = null):haxe.extern.EitherType<String, Int>;
  /**
    
     Display the post thumbnail.
    
     When a theme adds 'post-thumbnail' support, a special 'post-thumbnail' image size
     is registered, which differs from the 'thumbnail' image size managed via the
     Settings > Media screen.
    
     When using the_post_thumbnail() or related functions, the 'post-thumbnail' image
     size is used by default, though a different size can be specified instead as needed.
    
     @since 2.9.0
    
     @see get_the_post_thumbnail()
    
     @param string|array $size Optional. Image size to use. Accepts any valid image size, or
                               an array of width and height values in pixels (in that order).
                               Default 'post-thumbnail'.
     @param string|array $attr Optional. Query string or array of attributes. Default empty.
    
  **/
  public function the_post_thumbnail(size:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = 'post-thumbnail', attr:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = ''):Void;
  /**
    
     Update cache for thumbnails in the current loop.
    
     @since 3.2.0
    
     @global WP_Query $wp_query
    
     @param WP_Query $wp_query Optional. A WP_Query instance. Defaults to the $wp_query global.
    
  **/
  public function update_post_thumbnail_cache(wp_query:wp.extern.Query = null):Void;
  /**
    
     Retrieve the post thumbnail.
    
     When a theme adds 'post-thumbnail' support, a special 'post-thumbnail' image size
     is registered, which differs from the 'thumbnail' image size managed via the
     Settings > Media screen.
    
     When using the_post_thumbnail() or related functions, the 'post-thumbnail' image
     size is used by default, though a different size can be specified instead as needed.
    
     @since 2.9.0
     @since 4.4.0 `$post` can be a post ID or WP_Post object.
    
     @param int|WP_Post  $post Optional. Post ID or WP_Post object.  Default is global `$post`.
     @param string|array $size Optional. Image size to use. Accepts any valid image size, or
                               an array of width and height values in pixels (in that order).
                               Default 'post-thumbnail'.
     @param string|array $attr Optional. Query string or array of attributes. Default empty.
     @return string The post thumbnail image tag.
    
  **/
  public function get_the_post_thumbnail(post:haxe.extern.EitherType<Int, wp.extern.Post> = null, size:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = 'post-thumbnail', attr:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = ''):String;
  /**
    
     Return the post thumbnail URL.
    
     @since 4.4.0
    
     @param int|WP_Post  $post Optional. Post ID or WP_Post object.  Default is global `$post`.
     @param string|array $size Optional. Registered image size to retrieve the source for or a flat
                               array of height and width dimensions. Default 'post-thumbnail'.
     @return string|false Post thumbnail URL or false if no URL is available.
    
  **/
  public function get_the_post_thumbnail_url(post:haxe.extern.EitherType<Int, wp.extern.Post> = null, size:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = 'post-thumbnail'):haxe.extern.EitherType<String, Bool>;
  /**
    
     Display the post thumbnail URL.
    
     @since 4.4.0
    
     @param string|array $size Optional. Image size to use. Accepts any valid image size,
                               or an array of width and height values in pixels (in that order).
                               Default 'post-thumbnail'.
    
  **/
  public function the_post_thumbnail_url(size:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = 'post-thumbnail'):Void;
  /**
    
     Returns the post thumbnail caption.
    
     @since 4.6.0
    
     @param int|WP_Post $post Optional. Post ID or WP_Post object. Default is global `$post`.
     @return string Post thumbnail caption.
    
  **/
  public function get_the_post_thumbnail_caption(post:haxe.extern.EitherType<Int, wp.extern.Post> = null):String;
  /**
    
     Displays the post thumbnail caption.
    
     @since 4.6.0
    
     @param int|WP_Post $post Optional. Post ID or WP_Post object. Default is global `$post`.
    
  **/
  public function the_post_thumbnail_caption(post:haxe.extern.EitherType<Int, wp.extern.Post> = null):Void;
}
