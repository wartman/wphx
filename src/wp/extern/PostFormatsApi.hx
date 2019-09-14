package wp.extern;

extern class PostFormatsApi implements wp.util.ApiFunctions {
  /**
    
     Retrieve the format slug for a post
    
     @since 3.1.0
    
     @param int|object|null $post Post ID or post object. Optional, default is the current post from the loop.
     @return string|false The format if successful. False otherwise.
    
  **/
  public function get_post_format(post:haxe.extern.EitherType<Int, Dynamic> = null):haxe.extern.EitherType<String, Bool>;
  /**
    
     Check if a post has any of the given formats, or any format.
    
     @since 3.1.0
    
     @param string|array    $format Optional. The format or formats to check.
     @param object|int|null $post   Optional. The post to check. If not supplied, defaults to the current post if used in the loop.
     @return bool True if the post has any of the given formats (or any format, if no format specified), false otherwise.
    
  **/
  public function has_post_format(?format:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>, post:haxe.extern.EitherType<Dynamic, Int> = null):Bool;
  /**
    
     Assign a format to a post
    
     @since 3.1.0
    
     @param int|object $post   The post for which to assign a format.
     @param string     $format A format to assign. Use an empty string or array to remove all formats from the post.
     @return array|WP_Error|false WP_Error on error. Array of affected term IDs on success.
    
  **/
  public function set_post_format(post:haxe.extern.EitherType<Int, Dynamic>, format:String):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, haxe.extern.EitherType<wp.extern.Error, Bool>>;
  /**
    
     Returns an array of post format slugs to their translated and pretty display versions
    
     @since 3.1.0
    
     @return array The array of translated post format names.
    
  **/
  public function get_post_format_strings():php.NativeArray;
  /**
    
     Retrieves the array of post format slugs.
    
     @since 3.1.0
    
     @return array The array of post format slugs as both keys and values.
    
  **/
  public function get_post_format_slugs():php.NativeArray;
  /**
    
     Returns a pretty, translated version of a post format slug
    
     @since 3.1.0
    
     @param string $slug A post format slug.
     @return string The translated post format name.
    
  **/
  public function get_post_format_string(slug:String):String;
  /**
    
     Returns a link to a post format index.
    
     @since 3.1.0
    
     @param string $format The post format slug.
     @return string|WP_Error|false The post format term link.
    
  **/
  public function get_post_format_link(format:String):haxe.extern.EitherType<String, haxe.extern.EitherType<wp.extern.Error, Bool>>;
  /**
    
     Filters the request to allow for the format prefix.
    
     @access private
     @since 3.1.0
    
     @param array $qvs
     @return array
    
  **/
  public function _post_format_request(qvs:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Filters the post format term link to remove the format prefix.
    
     @access private
     @since 3.1.0
    
     @global WP_Rewrite $wp_rewrite
    
     @param string $link
     @param object $term
     @param string $taxonomy
     @return string
    
  **/
  public function _post_format_link(link:String, term:Dynamic, taxonomy:String):String;
  /**
    
     Remove the post format prefix from the name property of the term object created by get_term().
    
     @access private
     @since 3.1.0
    
     @param object $term
     @return object
    
  **/
  public function _post_format_get_term(term:Dynamic):Dynamic;
  /**
    
     Remove the post format prefix from the name property of the term objects created by get_terms().
    
     @access private
     @since 3.1.0
    
     @param array        $terms
     @param string|array $taxonomies
     @param array        $args
     @return array
    
  **/
  public function _post_format_get_terms(terms:php.NativeStructArray<Dynamic>, taxonomies:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>, args:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Remove the post format prefix from the name property of the term objects created by wp_get_object_terms().
    
     @access private
     @since 3.1.0
    
     @param array $terms
     @return array
    
  **/
  public function _post_format_wp_get_object_terms(terms:php.NativeStructArray<Dynamic>):php.NativeArray;
}
