package wp.extern;

extern class KsesApi implements wp.util.ApiFunctions {
  /**
    
     Filters text content and strips out disallowed HTML.
    
     This function makes sure that only the allowed HTML element names, attribute
     names, attribute values, and HTML entities will occur in the given text string.
    
     This function expects unslashed data.
    
     @see wp_kses_post() for specifically filtering post content and fields.
     @see wp_allowed_protocols() for the default allowed protocols in link URLs.
    
     @since 1.0.0
    
     @param string         $string            Text content to filter.
     @param array[]|string $allowed_html      An array of allowed HTML elements and attributes, or a
                                              context name such as 'post'.
     @param string[]       $allowed_protocols Array of allowed URL protocols.
     @return string Filtered content containing only the allowed HTML.
    
  **/
  public function wp_kses(string:String, allowed_html:haxe.extern.EitherType<php.NativeIndexedArray<php.NativeStructArray<Dynamic>>, String>, ?allowed_protocols:php.NativeIndexedArray<String>):String;
  /**
    
     Filters one HTML attribute and ensures its value is allowed.
    
     This function can escape data in some situations where `wp_kses()` must strip the whole attribute.
    
     @since 4.2.3
    
     @param string $string  The 'whole' attribute, including name and value.
     @param string $element The HTML element name to which the attribute belongs.
     @return string Filtered attribute.
    
  **/
  public function wp_kses_one_attr(string:String, element:String):String;
  /**
    
     Returns an array of allowed HTML tags and attributes for a given context.
    
     @since 3.5.0
     @since 5.0.1 `form` removed as allowable HTML tag.
    
     @global array $allowedposttags
     @global array $allowedtags
     @global array $allowedentitynames
    
     @param string|array $context The context for which to retrieve tags. Allowed values are 'post',
                                  'strip', 'data', 'entities', or the name of a field filter such as
                                  'pre_user_description'.
     @return array Array of allowed HTML tags and their allowed attributes.
    
  **/
  public function wp_kses_allowed_html(context:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = ''):php.NativeArray;
  /**
    
     You add any KSES hooks here.
    
     There is currently only one KSES WordPress hook, {@see 'pre_kses'}, and it is called here.
     All parameters are passed to the hooks and expected to receive a string.
    
     @since 1.0.0
    
     @param string          $string            Content to filter through KSES.
     @param array[]|string  $allowed_html      List of allowed HTML elements.
     @param string[]        $allowed_protocols Array of allowed URL protocols.
     @return string Filtered content through {@see 'pre_kses'} hook.
    
  **/
  public function wp_kses_hook(string:String, allowed_html:haxe.extern.EitherType<php.NativeIndexedArray<php.NativeStructArray<Dynamic>>, String>, allowed_protocols:php.NativeIndexedArray<String>):String;
  /**
    
     Returns the version number of KSES.
    
     @since 1.0.0
    
     @return string KSES version number.
    
  **/
  public function wp_kses_version():String;
  /**
    
     Searches for HTML tags, no matter how malformed.
    
     It also matches stray `>` characters.
    
     @since 1.0.0
    
     @global array $pass_allowed_html
     @global array $pass_allowed_protocols
    
     @param string   $string            Content to filter.
     @param array    $allowed_html      Allowed HTML elements.
     @param string[] $allowed_protocols Array of allowed URL protocols.
     @return string Content with fixed HTML tags
    
  **/
  public function wp_kses_split(string:String, allowed_html:php.NativeStructArray<Dynamic>, allowed_protocols:php.NativeIndexedArray<String>):String;
  /**
    
     Helper function listing HTML attributes containing a URL.
    
     This function returns a list of all HTML attributes that must contain
     a URL according to the HTML specification.
    
     This list includes URI attributes both allowed and disallowed by KSES.
    
     @link https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes
    
     @since 5.0.1
    
     @return array HTML attributes that must include a URL.
    
  **/
  public function wp_kses_uri_attributes():php.NativeArray;
  /**
    
     Callback for `wp_kses_split()`.
    
     @since 3.1.0
     @access private
     @ignore
    
     @global array $pass_allowed_html
     @global array $pass_allowed_protocols
    
     @return string
    
  **/
  public function _wp_kses_split_callback(match:Dynamic):String;
  /**
    
     Callback for `wp_kses_split()` for fixing malformed HTML tags.
    
     This function does a lot of work. It rejects some very malformed things like
     `<:::>`. It returns an empty string, if the element isn't allowed (look ma, no
     `strip_tags()`!). Otherwise it splits the tag into an element and an attribute
     list.
    
     After the tag is split into an element and an attribute list, it is run
     through another filter which will remove illegal attributes and once that is
     completed, will be returned.
    
     @access private
     @ignore
     @since 1.0.0
    
     @param string   $string            Content to filter.
     @param array    $allowed_html      Allowed HTML elements.
     @param string[] $allowed_protocols Array of allowed URL protocols.
     @return string Fixed HTML element
    
  **/
  public function wp_kses_split2(string:String, allowed_html:php.NativeStructArray<Dynamic>, allowed_protocols:php.NativeIndexedArray<String>):String;
  /**
    
     Removes all attributes, if none are allowed for this element.
    
     If some are allowed it calls `wp_kses_hair()` to split them further, and then
     it builds up new HTML code from the data that `kses_hair()` returns. It also
     removes `<` and `>` characters, if there are any left. One more thing it does
     is to check if the tag has a closing XHTML slash, and if it does, it puts one
     in the returned code as well.
    
     @since 1.0.0
    
     @param string   $element           HTML element/tag.
     @param string   $attr              HTML attributes from HTML element to closing HTML element tag.
     @param array    $allowed_html      Allowed HTML elements.
     @param string[] $allowed_protocols Array of allowed URL protocols.
     @return string Sanitized HTML element.
    
  **/
  public function wp_kses_attr(element:String, attr:String, allowed_html:php.NativeStructArray<Dynamic>, allowed_protocols:php.NativeIndexedArray<String>):String;
  /**
    
     Determines whether an attribute is allowed.
    
     @since 4.2.3
     @since 5.0.0 Add support for `data-*` wildcard attributes.
    
     @param string $name         The attribute name. Passed by reference. Returns empty string when not allowed.
     @param string $value        The attribute value. Passed by reference. Returns a filtered value.
     @param string $whole        The `name=value` input. Passed by reference. Returns filtered input.
     @param string $vless        Whether the attribute is valueless. Use 'y' or 'n'.
     @param string $element      The name of the element to which this attribute belongs.
     @param array  $allowed_html The full list of allowed elements and attributes.
     @return bool Whether or not the attribute is allowed.
    
  **/
  public function wp_kses_attr_check(name:String, value:String, whole:String, vless:String, element:String, allowed_html:php.NativeStructArray<Dynamic>):Bool;
  /**
    
     Builds an attribute list from string containing attributes.
    
     This function does a lot of work. It parses an attribute list into an array
     with attribute data, and tries to do the right thing even if it gets weird
     input. It will add quotes around attribute values that don't have any quotes
     or apostrophes around them, to make it easier to produce HTML code that will
     conform to W3C's HTML specification. It will also remove bad URL protocols
     from attribute values. It also reduces duplicate attributes by using the
     attribute defined first (`foo='bar' foo='baz'` will result in `foo='bar'`).
    
     @since 1.0.0
    
     @param string   $attr              Attribute list from HTML element to closing HTML element tag.
     @param string[] $allowed_protocols Array of allowed URL protocols.
     @return array[] Array of attribute information after parsing.
    
  **/
  public function wp_kses_hair(attr:String, allowed_protocols:php.NativeIndexedArray<String>):php.NativeIndexedArray<php.NativeStructArray<Dynamic>>;
  /**
    
     Finds all attributes of an HTML element.
    
     Does not modify input.  May return "evil" output.
    
     Based on `wp_kses_split2()` and `wp_kses_attr()`.
    
     @since 4.2.3
    
     @param string $element HTML element.
     @return array|bool List of attributes found in the element. Returns false on failure.
    
  **/
  public function wp_kses_attr_parse(element:String):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Bool>;
  /**
    
     Builds an attribute list from string containing attributes.
    
     Does not modify input.  May return "evil" output.
     In case of unexpected input, returns false instead of stripping things.
    
     Based on `wp_kses_hair()` but does not return a multi-dimensional array.
    
     @since 4.2.3
    
     @param string $attr Attribute list from HTML element to closing HTML element tag.
     @return array|bool List of attributes found in $attr. Returns false on failure.
    
  **/
  public function wp_kses_hair_parse(attr:String):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Bool>;
  /**
    
     Performs different checks for attribute values.
    
     The currently implemented checks are "maxlen", "minlen", "maxval", "minval",
     and "valueless".
    
     @since 1.0.0
    
     @param string $value      Attribute value.
     @param string $vless      Whether the attribute is valueless. Use 'y' or 'n'.
     @param string $checkname  What $checkvalue is checking for.
     @param mixed  $checkvalue What constraint the value should pass.
     @return bool Whether check passes.
    
  **/
  public function wp_kses_check_attr_val(value:String, vless:String, checkname:String, checkvalue:Dynamic):Bool;
  /**
    
     Sanitizes a string and removed disallowed URL protocols.
    
     This function removes all non-allowed protocols from the beginning of the
     string. It ignores whitespace and the case of the letters, and it does
     understand HTML entities. It does its work recursively, so it won't be
     fooled by a string like `javascript:javascript:alert(57)`.
    
     @since 1.0.0
    
     @param string   $string            Content to filter bad protocols from.
     @param string[] $allowed_protocols Array of allowed URL protocols.
     @return string Filtered content.
    
  **/
  public function wp_kses_bad_protocol(string:String, allowed_protocols:php.NativeIndexedArray<String>):String;
  /**
    
     Removes any invalid control characters in a text string.
    
     Also removes any instance of the `\0` string.
    
     @since 1.0.0
    
     @param string $string  Content to filter null characters from.
     @param array  $options Set 'slash_zero' => 'keep' when '\0' is allowed. Default is 'remove'.
     @return string Filtered content.
    
  **/
  public function wp_kses_no_null(string:String, options:php.NativeStructArray<Dynamic> = null):String;
  /**
    
     Strips slashes from in front of quotes.
    
     This function changes the character sequence `\"` to just `"`. It leaves all other
     slashes alone. The quoting from `preg_replace(//e)` requires this.
    
     @since 1.0.0
    
     @param string $string String to strip slashes from.
     @return string Fixed string with quoted slashes.
    
  **/
  public function wp_kses_stripslashes(string:String):String;
  /**
    
     Converts the keys of an array to lowercase.
    
     @since 1.0.0
    
     @param array $inarray Unfiltered array.
     @return array Fixed array with all lowercase keys.
    
  **/
  public function wp_kses_array_lc(inarray:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Handles parsing errors in `wp_kses_hair()`.
    
     The general plan is to remove everything to and including some whitespace,
     but it deals with quotes and apostrophes as well.
    
     @since 1.0.0
    
     @param string $string
     @return string
    
  **/
  public function wp_kses_html_error(string:String):String;
  /**
    
     Sanitizes content from bad protocols and other characters.
    
     This function searches for URL protocols at the beginning of the string, while
     handling whitespace and HTML entities.
    
     @since 1.0.0
    
     @param string   $string            Content to check for bad protocols.
     @param string[] $allowed_protocols Array of allowed URL protocols.
     @return string Sanitized content.
    
  **/
  public function wp_kses_bad_protocol_once(string:String, allowed_protocols:php.NativeIndexedArray<String>, count:Dynamic = 1):String;
  /**
    
     Callback for `wp_kses_bad_protocol_once()` regular expression.
    
     This function processes URL protocols, checks to see if they're in the
     whitelist or not, and returns different data depending on the answer.
    
     @access private
     @ignore
     @since 1.0.0
    
     @param string   $string            URI scheme to check against the whitelist.
     @param string[] $allowed_protocols Array of allowed URL protocols.
     @return string Sanitized content.
    
  **/
  public function wp_kses_bad_protocol_once2(string:String, allowed_protocols:php.NativeIndexedArray<String>):String;
  /**
    
     Converts and fixes HTML entities.
    
     This function normalizes HTML entities. It will convert `AT&T` to the correct
     `AT&amp;T`, `&#00058;` to `&#58;`, `&#XYZZY;` to `&amp;#XYZZY;` and so on.
    
     @since 1.0.0
    
     @param string $string Content to normalize entities.
     @return string Content with normalized entities.
    
  **/
  public function wp_kses_normalize_entities(string:String):String;
  /**
    
     Callback for `wp_kses_normalize_entities()` regular expression.
    
     This function only accepts valid named entity references, which are finite,
     case-sensitive, and highly scrutinized by HTML and XML validators.
    
     @since 3.0.0
    
     @global array $allowedentitynames
    
     @param array $matches preg_replace_callback() matches array.
     @return string Correctly encoded entity.
    
  **/
  public function wp_kses_named_entities(matches:php.NativeStructArray<Dynamic>):String;
  /**
    
     Callback for `wp_kses_normalize_entities()` regular expression.
    
     This function helps `wp_kses_normalize_entities()` to only accept 16-bit
     values and nothing more for `&#number;` entities.
    
     @access private
     @ignore
     @since 1.0.0
    
     @param array $matches `preg_replace_callback()` matches array.
     @return string Correctly encoded entity.
    
  **/
  public function wp_kses_normalize_entities2(matches:php.NativeStructArray<Dynamic>):String;
  /**
    
     Callback for `wp_kses_normalize_entities()` for regular expression.
    
     This function helps `wp_kses_normalize_entities()` to only accept valid Unicode
     numeric entities in hex form.
    
     @since 2.7.0
     @access private
     @ignore
    
     @param array $matches `preg_replace_callback()` matches array.
     @return string Correctly encoded entity.
    
  **/
  public function wp_kses_normalize_entities3(matches:php.NativeStructArray<Dynamic>):String;
  /**
    
     Determines if a Unicode codepoint is valid.
    
     @since 2.7.0
    
     @param int $i Unicode codepoint.
     @return bool Whether or not the codepoint is a valid Unicode codepoint.
    
  **/
  public function valid_unicode(i:Int):Bool;
  /**
    
     Converts all numeric HTML entities to their named counterparts.
    
     This function decodes numeric HTML entities (`&#65;` and `&#x41;`).
     It doesn't do anything with named entities like `&auml;`, but we don't
     need them in the URL protocol whitelisting system anyway.
    
     @since 1.0.0
    
     @param string $string Content to change entities.
     @return string Content after decoded entities.
    
  **/
  public function wp_kses_decode_entities(string:String):String;
  /**
    
     Regex callback for `wp_kses_decode_entities()`.
    
     @since 2.9.0
     @access private
     @ignore
    
     @param array $match preg match
     @return string
    
  **/
  public function _wp_kses_decode_entities_chr(match:php.NativeStructArray<Dynamic>):String;
  /**
    
     Regex callback for `wp_kses_decode_entities()`.
    
     @since 2.9.0
     @access private
     @ignore
    
     @param array $match preg match
     @return string
    
  **/
  public function _wp_kses_decode_entities_chr_hexdec(match:php.NativeStructArray<Dynamic>):String;
  /**
    
     Sanitize content with allowed HTML KSES rules.
    
     This function expects slashed data.
    
     @since 1.0.0
    
     @param string $data Content to filter, expected to be escaped with slashes.
     @return string Filtered content.
    
  **/
  public function wp_filter_kses(data:String):String;
  /**
    
     Sanitize content with allowed HTML KSES rules.
    
     This function expects unslashed data.
    
     @since 2.9.0
    
     @param string $data Content to filter, expected to not be escaped.
     @return string Filtered content.
    
  **/
  public function wp_kses_data(data:String):String;
  /**
    
     Sanitizes content for allowed HTML tags for post content.
    
     Post content refers to the page contents of the 'post' type and not `$_POST`
     data from forms.
    
     This function expects slashed data.
    
     @since 2.0.0
    
     @param string $data Post content to filter, expected to be escaped with slashes.
     @return string Filtered post content with allowed HTML tags and attributes intact.
    
  **/
  public function wp_filter_post_kses(data:String):String;
  /**
    
     Sanitizes content for allowed HTML tags for post content.
    
     Post content refers to the page contents of the 'post' type and not `$_POST`
     data from forms.
    
     This function expects unslashed data.
    
     @since 2.9.0
    
     @param string $data Post content to filter.
     @return string Filtered post content with allowed HTML tags and attributes intact.
    
  **/
  public function wp_kses_post(data:String):String;
  /**
    
     Navigates through an array, object, or scalar, and sanitizes content for
     allowed HTML tags for post content.
    
     @since 4.4.2
    
     @see map_deep()
    
     @param mixed $data The array, object, or scalar value to inspect.
     @return mixed The filtered content.
    
  **/
  public function wp_kses_post_deep(data:Dynamic):Dynamic;
  /**
    
     Strips all HTML from a text string.
    
     This function expects slashed data.
    
     @since 2.1.0
    
     @param string $data Content to strip all HTML from.
     @return string Filtered content without any HTML.
    
  **/
  public function wp_filter_nohtml_kses(data:String):String;
  /**
    
     Adds all KSES input form content filters.
    
     All hooks have default priority. The `wp_filter_kses()` function is added to
     the 'pre_comment_content' and 'title_save_pre' hooks.
    
     The `wp_filter_post_kses()` function is added to the 'content_save_pre',
     'excerpt_save_pre', and 'content_filtered_save_pre' hooks.
    
     @since 2.0.0
    
  **/
  public function kses_init_filters():Void;
  /**
    
     Removes all KSES input form content filters.
    
     A quick procedural method to removing all of the filters that KSES uses for
     content in WordPress Loop.
    
     Does not remove the `kses_init()` function from {@see 'init'} hook (priority is
     default). Also does not remove `kses_init()` function from {@see 'set_current_user'}
     hook (priority is also default).
    
     @since 2.0.6
    
  **/
  public function kses_remove_filters():Void;
  /**
    
     Sets up most of the KSES filters for input form content.
    
     First removes all of the KSES filters in case the current user does not need
     to have KSES filter the content. If the user does not have `unfiltered_html`
     capability, then KSES filters are added.
    
     @since 2.0.0
    
  **/
  public function kses_init():Void;
  /**
    
     Filters an inline style attribute and removes disallowed rules.
    
     @since 2.8.1
    
     @param string $css        A string of CSS rules.
     @param string $deprecated Not used.
     @return string Filtered string of CSS rules.
    
  **/
  public function safecss_filter_attr(css:String, deprecated:String = ''):String;
  /**
    
     Helper function to add global attributes to a tag in the allowed html list.
    
     @since 3.5.0
     @since 5.0.0 Add support for `data-*` wildcard attributes.
     @access private
     @ignore
    
     @param array $value An array of attributes.
     @return array The array of attributes with global attributes added.
    
  **/
  public function _wp_add_global_attributes(value:php.NativeStructArray<Dynamic>):php.NativeArray;
}
