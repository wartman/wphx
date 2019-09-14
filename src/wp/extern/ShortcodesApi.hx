package wp.extern;

extern class ShortcodesApi implements wp.util.ApiFunctions {
  /**
    
     Adds a new shortcode.
    
     Care should be taken through prefixing or other means to ensure that the
     shortcode tag being added is unique and will not conflict with other,
     already-added shortcode tags. In the event of a duplicated tag, the tag
     loaded last will take precedence.
    
     @since 2.5.0
    
     @global array $shortcode_tags
    
     @param string   $tag      Shortcode tag to be searched in post content.
     @param callable $callback The callback function to run when the shortcode is found.
                               Every shortcode callback is passed three parameters by default,
                               including an array of attributes (`$atts`), the shortcode content
                               or null if not set (`$content`), and finally the shortcode tag
                               itself (`$shortcode_tag`), in that order.
    
  **/
  public function add_shortcode(tag:String, callback:Dynamic):Void;
  /**
    
     Removes hook for shortcode.
    
     @since 2.5.0
    
     @global array $shortcode_tags
    
     @param string $tag Shortcode tag to remove hook for.
    
  **/
  public function remove_shortcode(tag:String):Void;
  /**
    
     Clear all shortcodes.
    
     This function is simple, it clears all of the shortcode tags by replacing the
     shortcodes global by a empty array. This is actually a very efficient method
     for removing all shortcodes.
    
     @since 2.5.0
    
     @global array $shortcode_tags
    
  **/
  public function remove_all_shortcodes():Void;
  /**
    
     Whether a registered shortcode exists named $tag
    
     @since 3.6.0
    
     @global array $shortcode_tags List of shortcode tags and their callback hooks.
    
     @param string $tag Shortcode tag to check.
     @return bool Whether the given shortcode exists.
    
  **/
  public function shortcode_exists(tag:String):Bool;
  /**
    
     Whether the passed content contains the specified shortcode
    
     @since 3.6.0
    
     @global array $shortcode_tags
    
     @param string $content Content to search for shortcodes.
     @param string $tag     Shortcode tag to check.
     @return bool Whether the passed content contains the given shortcode.
    
  **/
  public function has_shortcode(content:String, tag:String):Bool;
  /**
    
     Search content for shortcodes and filter shortcodes through their hooks.
    
     If there are no shortcode tags defined, then the content will be returned
     without any filtering. This might cause issues when plugins are disabled but
     the shortcode will still show up in the post or content.
    
     @since 2.5.0
    
     @global array $shortcode_tags List of shortcode tags and their callback hooks.
    
     @param string $content Content to search for shortcodes.
     @param bool $ignore_html When true, shortcodes inside HTML elements will be skipped.
     @return string Content with shortcodes filtered out.
    
  **/
  public function do_shortcode(content:String, ignore_html:Bool = false):String;
  /**
    
     Retrieve the shortcode regular expression for searching.
    
     The regular expression combines the shortcode tags in the regular expression
     in a regex class.
    
     The regular expression contains 6 different sub matches to help with parsing.
    
     1 - An extra [ to allow for escaping shortcodes with double [[]]
     2 - The shortcode name
     3 - The shortcode argument list
     4 - The self closing /
     5 - The content of a shortcode when it wraps some content.
     6 - An extra ] to allow for escaping shortcodes with double [[]]
    
     @since 2.5.0
     @since 4.4.0 Added the `$tagnames` parameter.
    
     @global array $shortcode_tags
    
     @param array $tagnames Optional. List of shortcodes to find. Defaults to all registered shortcodes.
     @return string The shortcode search regular expression
    
  **/
  public function get_shortcode_regex(tagnames:php.NativeStructArray<Dynamic> = null):String;
  /**
    
     Regular Expression callable for do_shortcode() for calling shortcode hook.
    
     @see get_shortcode_regex for details of the match array contents.
    
     @since 2.5.0
     @access private
    
     @global array $shortcode_tags
    
     @param array $m Regular expression match array
     @return string|false False on failure.
    
  **/
  public function do_shortcode_tag(m:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<String, Bool>;
  /**
    
     Search only inside HTML elements for shortcodes and process them.
    
     Any [ or ] characters remaining inside elements will be HTML encoded
     to prevent interference with shortcodes that are outside the elements.
     Assumes $content processed by KSES already.  Users with unfiltered_html
     capability may get unexpected output if angle braces are nested in tags.
    
     @since 4.2.3
    
     @param string $content Content to search for shortcodes
     @param bool $ignore_html When true, all square braces inside elements will be encoded.
     @param array $tagnames List of shortcodes to find.
     @return string Content with shortcodes filtered out.
    
  **/
  public function do_shortcodes_in_html_tags(content:String, ignore_html:Bool, tagnames:php.NativeStructArray<Dynamic>):String;
  /**
    
     Remove placeholders added by do_shortcodes_in_html_tags().
    
     @since 4.2.3
    
     @param string $content Content to search for placeholders.
     @return string Content with placeholders removed.
    
  **/
  public function unescape_invalid_shortcodes(content:String):String;
  /**
    
     Retrieve the shortcode attributes regex.
    
     @since 4.4.0
    
     @return string The shortcode attribute regular expression
    
  **/
  public function get_shortcode_atts_regex():String;
  /**
    
     Retrieve all attributes from the shortcodes tag.
    
     The attributes list has the attribute name as the key and the value of the
     attribute as the value in the key/value pair. This allows for easier
     retrieval of the attributes, since all attributes have to be known.
    
     @since 2.5.0
    
     @param string $text
     @return array|string List of attribute values.
                          Returns empty array if trim( $text ) == '""'.
                          Returns empty string if trim( $text ) == ''.
                          All other matches are checked for not empty().
    
  **/
  public function shortcode_parse_atts(text:String):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String>;
  /**
    
     Combine user attributes with known attributes and fill in defaults when needed.
    
     The pairs should be considered to be all of the attributes which are
     supported by the caller and given as a list. The returned attributes will
     only contain the attributes in the $pairs list.
    
     If the $atts list has unsupported attributes, then they will be ignored and
     removed from the final returned list.
    
     @since 2.5.0
    
     @param array  $pairs     Entire list of supported attributes and their defaults.
     @param array  $atts      User defined attributes in shortcode tag.
     @param string $shortcode Optional. The name of the shortcode, provided for context to enable filtering
     @return array Combined and filtered attribute list.
    
  **/
  public function shortcode_atts(pairs:php.NativeStructArray<Dynamic>, atts:php.NativeStructArray<Dynamic>, shortcode:String = ''):php.NativeArray;
  /**
    
     Remove all shortcode tags from the given content.
    
     @since 2.5.0
    
     @global array $shortcode_tags
    
     @param string $content Content to remove shortcode tags.
     @return string Content without shortcode tags.
    
  **/
  public function strip_shortcodes(content:String):String;
  /**
    
     Strips a shortcode tag based on RegEx matches against post content.
    
     @since 3.3.0
    
     @param array $m RegEx matches against post content.
     @return string|false The content stripped of the tag, otherwise false.
    
  **/
  public function strip_shortcode_tag(m:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<String, Bool>;
}
