package wp.extern;

extern class AuthorTemplateApi implements wp.util.ApiFunctions {
  /**
    
     Retrieve the author of the current post.
    
     @since 1.5.0
    
     @global object $authordata The current author's DB object.
    
     @param string $deprecated Deprecated.
     @return string|null The author's display name.
    
  **/
  public function get_the_author(deprecated:String = ''):String;
  /**
    
     Display the name of the author of the current post.
    
     The behavior of this function is based off of old functionality predating
     get_the_author(). This function is not deprecated, but is designed to echo
     the value from get_the_author() and as an result of any old theme that might
     still use the old behavior will also pass the value from get_the_author().
    
     The normal, expected behavior of this function is to echo the author and not
     return it. However, backward compatibility has to be maintained.
    
     @since 0.71
     @see get_the_author()
     @link https://codex.wordpress.org/Template_Tags/the_author
    
     @param string $deprecated Deprecated.
     @param string $deprecated_echo Deprecated. Use get_the_author(). Echo the string or return it.
     @return string|null The author's display name, from get_the_author().
    
  **/
  public function the_author(deprecated:String = '', deprecated_echo:String = true):String;
  /**
    
     Retrieve the author who last edited the current post.
    
     @since 2.8.0
    
     @return string|void The author's display name.
    
  **/
  public function get_the_modified_author():String;
  /**
    
     Display the name of the author who last edited the current post,
     if the author's ID is available.
    
     @since 2.8.0
    
     @see get_the_author()
    
  **/
  public function the_modified_author():Void;
  /**
    
     Retrieves the requested data of the author of the current post.
    
     Valid values for the `$field` parameter include:
    
     - admin_color
     - aim
     - comment_shortcuts
     - description
     - display_name
     - first_name
     - ID
     - jabber
     - last_name
     - nickname
     - plugins_last_view
     - plugins_per_page
     - rich_editing
     - syntax_highlighting
     - user_activation_key
     - user_description
     - user_email
     - user_firstname
     - user_lastname
     - user_level
     - user_login
     - user_nicename
     - user_pass
     - user_registered
     - user_status
     - user_url
     - yim
    
     @since 2.8.0
    
     @global object $authordata The current author's DB object.
    
     @param string $field   Optional. The user field to retrieve. Default empty.
     @param int    $user_id Optional. User ID.
     @return string The author's field from the current author's DB object, otherwise an empty string.
    
  **/
  public function get_the_author_meta(field:String = '', user_id:Int = false):String;
  /**
    
     Outputs the field from the user's DB object. Defaults to current post's author.
    
     @since 2.8.0
    
     @param string $field   Selects the field of the users record. See get_the_author_meta()
                            for the list of possible fields.
     @param int    $user_id Optional. User ID.
    
     @see get_the_author_meta()
    
  **/
  public function the_author_meta(field:String = '', user_id:Int = false):Void;
  /**
    
     Retrieve either author's link or author's name.
    
     If the author has a home page set, return an HTML link, otherwise just return the
     author's name.
    
     @since 3.0.0
    
     @return string|null An HTML link if the author's url exist in user meta,
                         else the result of get_the_author().
    
  **/
  public function get_the_author_link():String;
  /**
    
     Display either author's link or author's name.
    
     If the author has a home page set, echo an HTML link, otherwise just echo the
     author's name.
    
     @link https://codex.wordpress.org/Template_Tags/the_author_link
    
     @since 2.1.0
    
  **/
  public function the_author_link():Void;
  /**
    
     Retrieve the number of posts by the author of the current post.
    
     @since 1.5.0
    
     @return int The number of posts by the author.
    
  **/
  public function get_the_author_posts():Int;
  /**
    
     Display the number of posts by the author of the current post.
    
     @link https://codex.wordpress.org/Template_Tags/the_author_posts
     @since 0.71
    
  **/
  public function the_author_posts():Void;
  /**
    
     Retrieves an HTML link to the author page of the current post's author.
    
     Returns an HTML-formatted link using get_author_posts_url().
    
     @since 4.4.0
    
     @global object $authordata The current author's DB object.
    
     @return string An HTML link to the author page, or an empty string if $authordata isn't defined.
    
  **/
  public function get_the_author_posts_link():String;
  /**
    
     Displays an HTML link to the author page of the current post's author.
    
     @since 1.2.0
     @since 4.4.0 Converted into a wrapper for get_the_author_posts_link()
    
     @param string $deprecated Unused.
    
  **/
  public function the_author_posts_link(deprecated:String = ''):Void;
  /**
    
     Retrieve the URL to the author page for the user with the ID provided.
    
     @since 2.1.0
    
     @global WP_Rewrite $wp_rewrite
    
     @param int    $author_id       Author ID.
     @param string $author_nicename Optional. The author's nicename (slug). Default empty.
     @return string The URL to the author's page.
    
  **/
  public function get_author_posts_url(author_id:Int, author_nicename:String = ''):String;
  /**
    
     List all the authors of the site, with several options available.
    
     @link https://codex.wordpress.org/Template_Tags/wp_list_authors
    
     @since 1.2.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string|array $args {
         Optional. Array or string of default arguments.
    
         @type string       $orderby       How to sort the authors. Accepts 'nicename', 'email', 'url', 'registered',
                                           'user_nicename', 'user_email', 'user_url', 'user_registered', 'name',
                                           'display_name', 'post_count', 'ID', 'meta_value', 'user_login'. Default 'name'.
         @type string       $order         Sorting direction for $orderby. Accepts 'ASC', 'DESC'. Default 'ASC'.
         @type int          $number        Maximum authors to return or display. Default empty (all authors).
         @type bool         $optioncount   Show the count in parenthesis next to the author's name. Default false.
         @type bool         $exclude_admin Whether to exclude the 'admin' account, if it exists. Default true.
         @type bool         $show_fullname Whether to show the author's full name. Default false.
         @type bool         $hide_empty    Whether to hide any authors with no posts. Default true.
         @type string       $feed          If not empty, show a link to the author's feed and use this text as the alt
                                           parameter of the link. Default empty.
         @type string       $feed_image    If not empty, show a link to the author's feed and use this image URL as
                                           clickable anchor. Default empty.
         @type string       $feed_type     The feed type to link to, such as 'rss2'. Defaults to default feed type.
         @type bool         $echo          Whether to output the result or instead return it. Default true.
         @type string       $style         If 'list', each author is wrapped in an `<li>` element, otherwise the authors
                                           will be separated by commas.
         @type bool         $html          Whether to list the items in HTML form or plaintext. Default true.
         @type array|string $exclude       Array or comma/space-separated list of author IDs to exclude. Default empty.
         @type array|string $include       Array or comma/space-separated list of author IDs to include. Default empty.
     }
     @return string|void The output, if echo is set to false.
    
  **/
  public function wp_list_authors(args:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = ''):String;
  /**
    
     Determines whether this site has more than one author.
    
     Checks to see if more than one author has published posts.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 3.2.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @return bool Whether or not we have more than one author
    
  **/
  public function is_multi_author():Bool;
  /**
    
     Helper function to clear the cache for number of authors.
    
     @since 3.2.0
     @access private
    
  **/
  public function __clear_multi_author_cache():Void;
}
