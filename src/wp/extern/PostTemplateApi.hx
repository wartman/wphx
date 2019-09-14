package wp.extern;

extern class PostTemplateApi implements wp.util.ApiFunctions {
  /**
    
     Display the ID of the current item in the WordPress Loop.
    
     @since 0.71
    
  **/
  public function the_ID():Void;
  /**
    
     Retrieve the ID of the current item in the WordPress Loop.
    
     @since 2.1.0
    
     @return int|false The ID of the current item in the WordPress Loop. False if $post is not set.
    
  **/
  public function get_the_ID():haxe.extern.EitherType<Int, Bool>;
  /**
    
     Display or retrieve the current post title with optional markup.
    
     @since 0.71
    
     @param string $before Optional. Markup to prepend to the title. Default empty.
     @param string $after  Optional. Markup to append to the title. Default empty.
     @param bool   $echo   Optional. Whether to echo or return the title. Default true for echo.
     @return string|void Current post title if $echo is false.
    
  **/
  public function the_title(before:String = '', after:String = '', echo:Bool = true):String;
  /**
    
     Sanitize the current title when retrieving or displaying.
    
     Works like the_title(), except the parameters can be in a string or
     an array. See the function for what can be override in the $args parameter.
    
     The title before it is displayed will have the tags stripped and esc_attr()
     before it is passed to the user or displayed. The default as with the_title(),
     is to display the title.
    
     @since 2.3.0
    
     @param string|array $args {
         Title attribute arguments. Optional.
    
         @type string  $before Markup to prepend to the title. Default empty.
         @type string  $after  Markup to append to the title. Default empty.
         @type bool    $echo   Whether to echo or return the title. Default true for echo.
         @type WP_Post $post   Current post object to retrieve the title for.
     }
     @return string|void String when echo is false.
    
  **/
  public function the_title_attribute(args:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = ''):String;
  /**
    
     Retrieve post title.
    
     If the post is protected and the visitor is not an admin, then "Protected"
     will be displayed before the post title. If the post is private, then
     "Private" will be located before the post title.
    
     @since 0.71
    
     @param int|WP_Post $post Optional. Post ID or WP_Post object. Default is global $post.
     @return string
    
  **/
  public function get_the_title(post:haxe.extern.EitherType<Int, wp.extern.Post> = 0):String;
  /**
    
     Display the Post Global Unique Identifier (guid).
    
     The guid will appear to be a link, but should not be used as a link to the
     post. The reason you should not use it as a link, is because of moving the
     blog across domains.
    
     URL is escaped to make it XML-safe.
    
     @since 1.5.0
    
     @param int|WP_Post $post Optional. Post ID or post object. Default is global $post.
    
  **/
  public function the_guid(post:haxe.extern.EitherType<Int, wp.extern.Post> = 0):Void;
  /**
    
     Retrieve the Post Global Unique Identifier (guid).
    
     The guid will appear to be a link, but should not be used as an link to the
     post. The reason you should not use it as a link, is because of moving the
     blog across domains.
    
     @since 1.5.0
    
     @param int|WP_Post $post Optional. Post ID or post object. Default is global $post.
     @return string
    
  **/
  public function get_the_guid(post:haxe.extern.EitherType<Int, wp.extern.Post> = 0):String;
  /**
    
     Display the post content.
    
     @since 0.71
    
     @param string $more_link_text Optional. Content for when there is more text.
     @param bool   $strip_teaser   Optional. Strip teaser content before the more text. Default is false.
    
  **/
  public function the_content(more_link_text:String = null, strip_teaser:Bool = false):Void;
  /**
    
     Retrieve the post content.
    
     @since 0.71
    
     @global int   $page      Page number of a single post/page.
     @global int   $more      Boolean indicator for whether single post/page is being viewed.
     @global bool  $preview   Whether post/page is in preview mode.
     @global array $pages     Array of all pages in post/page. Each array element contains
                              part of the content separated by the `<!--nextpage-->` tag.
     @global int   $multipage Boolean indicator for whether multiple pages are in play.
    
     @param string $more_link_text Optional. Content for when there is more text.
     @param bool   $strip_teaser   Optional. Strip teaser content before the more text. Default is false.
     @return string
    
  **/
  public function get_the_content(more_link_text:String = null, strip_teaser:Bool = false):String;
  /**
    
     Display the post excerpt.
    
     @since 0.71
    
  **/
  public function the_excerpt():Void;
  /**
    
     Retrieves the post excerpt.
    
     @since 0.71
     @since 4.5.0 Introduced the `$post` parameter.
    
     @param int|WP_Post $post Optional. Post ID or WP_Post object. Default is global $post.
     @return string Post excerpt.
    
  **/
  public function get_the_excerpt(post:haxe.extern.EitherType<Int, wp.extern.Post> = null):String;
  /**
    
     Determines whether the post has a custom excerpt.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 2.3.0
    
     @param int|WP_Post $post Optional. Post ID or WP_Post object. Default is global $post.
     @return bool True if the post has a custom excerpt, false otherwise.
    
  **/
  public function has_excerpt(post:haxe.extern.EitherType<Int, wp.extern.Post> = 0):Bool;
  /**
    
     Displays the classes for the post container element.
    
     @since 2.7.0
    
     @param string|array $class   One or more classes to add to the class list.
     @param int|WP_Post  $post_id Optional. Post ID or post object. Defaults to the global `$post`.
    
  **/
  public function post_class(class_:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = '', post_id:haxe.extern.EitherType<Int, wp.extern.Post> = null):Void;
  /**
    
     Retrieves an array of the class names for the post container element.
    
     The class names are many. If the post is a sticky, then the 'sticky'
     class name. The class 'hentry' is always added to each post. If the post has a
     post thumbnail, 'has-post-thumbnail' is added as a class. For each taxonomy that
     the post belongs to, a class will be added of the format '{$taxonomy}-{$slug}' -
     eg 'category-foo' or 'my_custom_taxonomy-bar'.
    
     The 'post_tag' taxonomy is a special
     case; the class has the 'tag-' prefix instead of 'post_tag-'. All class names are
     passed through the filter, {@see 'post_class'}, with the list of class names, followed by
     $class parameter value, with the post ID as the last parameter.
    
     @since 2.7.0
     @since 4.2.0 Custom taxonomy class names were added.
    
     @param string|string[] $class   Space-separated string or array of class names to add to the class list.
     @param int|WP_Post     $post_id Optional. Post ID or post object.
     @return string[] Array of class names.
    
  **/
  public function get_post_class(class_:haxe.extern.EitherType<String, php.NativeIndexedArray<String>> = '', post_id:haxe.extern.EitherType<Int, wp.extern.Post> = null):php.NativeIndexedArray<String>;
  /**
    
     Displays the class names for the body element.
    
     @since 2.8.0
    
     @param string|string[] $class Space-separated string or array of class names to add to the class list.
    
  **/
  public function body_class(class_:haxe.extern.EitherType<String, php.NativeIndexedArray<String>> = ''):Void;
  /**
    
     Retrieves an array of the class names for the body element.
    
     @since 2.8.0
    
     @global WP_Query $wp_query
    
     @param string|string[] $class Space-separated string or array of class names to add to the class list.
     @return string[] Array of class names.
    
  **/
  public function get_body_class(class_:haxe.extern.EitherType<String, php.NativeIndexedArray<String>> = ''):php.NativeIndexedArray<String>;
  /**
    
     Whether post requires password and correct password has been provided.
    
     @since 2.7.0
    
     @param int|WP_Post|null $post An optional post. Global $post used if not provided.
     @return bool false if a password is not required or the correct password cookie is present, true otherwise.
    
  **/
  public function post_password_required(post:haxe.extern.EitherType<Int, wp.extern.Post> = null):Bool;
  /**
    
     The formatted output of a list of pages.
    
     Displays page links for paginated posts (i.e. including the `<!--nextpage-->`
     Quicktag one or more times). This tag must be within The Loop.
    
     @since 1.2.0
     @since 5.1.0 Added the `aria_current` argument.
    
     @global int $page
     @global int $numpages
     @global int $multipage
     @global int $more
    
     @param string|array $args {
         Optional. Array or string of default arguments.
    
         @type string       $before           HTML or text to prepend to each link. Default is `<p> Pages:`.
         @type string       $after            HTML or text to append to each link. Default is `</p>`.
         @type string       $link_before      HTML or text to prepend to each link, inside the `<a>` tag.
                                              Also prepended to the current item, which is not linked. Default empty.
         @type string       $link_after       HTML or text to append to each Pages link inside the `<a>` tag.
                                              Also appended to the current item, which is not linked. Default empty.
         @type string       $aria_current     The value for the aria-current attribute. Possible values are 'page',
                                              'step', 'location', 'date', 'time', 'true', 'false'. Default is 'page'.
         @type string       $next_or_number   Indicates whether page numbers should be used. Valid values are number
                                              and next. Default is 'number'.
         @type string       $separator        Text between pagination links. Default is ' '.
         @type string       $nextpagelink     Link text for the next page link, if available. Default is 'Next Page'.
         @type string       $previouspagelink Link text for the previous page link, if available. Default is 'Previous Page'.
         @type string       $pagelink         Format string for page numbers. The % in the parameter string will be
                                              replaced with the page number, so 'Page %' generates "Page 1", "Page 2", etc.
                                              Defaults to '%', just the page number.
         @type int|bool     $echo             Whether to echo or not. Accepts 1|true or 0|false. Default 1|true.
     }
     @return string Formatted output in HTML.
    
  **/
  public function wp_link_pages(args:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = ''):String;
  /**
    
     Helper function for wp_link_pages().
    
     @since 3.1.0
     @access private
    
     @global WP_Rewrite $wp_rewrite
    
     @param int $i Page number.
     @return string Link.
    
  **/
  public function _wp_link_page(i:Int):String;
  /**
    
     Retrieve post custom meta data field.
    
     @since 1.5.0
    
     @param string $key Meta data key name.
     @return false|string|array Array of values or single value, if only one element exists. False will be returned if key does not exist.
    
  **/
  public function post_custom(key:String = ''):haxe.extern.EitherType<Bool, haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>>;
  /**
    
     Display a list of post custom fields.
    
     @since 1.2.0
    
     @internal This will probably change at some point...
    
  **/
  public function the_meta():Void;
  /**
    
     Retrieve or display a list of pages as a dropdown (select list).
    
     @since 2.1.0
     @since 4.2.0 The `$value_field` argument was added.
     @since 4.3.0 The `$class` argument was added.
    
     @see get_pages()
    
     @param array|string $args {
         Optional. Array or string of arguments to generate a page dropdown. See `get_pages()` for additional arguments.
    
         @type int          $depth                 Maximum depth. Default 0.
         @type int          $child_of              Page ID to retrieve child pages of. Default 0.
         @type int|string   $selected              Value of the option that should be selected. Default 0.
         @type bool|int     $echo                  Whether to echo or return the generated markup. Accepts 0, 1,
                                                   or their bool equivalents. Default 1.
         @type string       $name                  Value for the 'name' attribute of the select element.
                                                   Default 'page_id'.
         @type string       $id                    Value for the 'id' attribute of the select element.
         @type string       $class                 Value for the 'class' attribute of the select element. Default: none.
                                                   Defaults to the value of `$name`.
         @type string       $show_option_none      Text to display for showing no pages. Default empty (does not display).
         @type string       $show_option_no_change Text to display for "no change" option. Default empty (does not display).
         @type string       $option_none_value     Value to use when no page is selected. Default empty.
         @type string       $value_field           Post field used to populate the 'value' attribute of the option
                                                   elements. Accepts any valid post field. Default 'ID'.
     }
     @return string HTML content, if not displaying.
    
  **/
  public function wp_dropdown_pages(args:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String> = ''):String;
  /**
    
     Retrieve or display a list of pages (or hierarchical post type items) in list (li) format.
    
     @since 1.5.0
     @since 4.7.0 Added the `item_spacing` argument.
    
     @see get_pages()
    
     @global WP_Query $wp_query
    
     @param array|string $args {
         Optional. Array or string of arguments to generate a list of pages. See `get_pages()` for additional arguments.
    
         @type int          $child_of     Display only the sub-pages of a single page by ID. Default 0 (all pages).
         @type string       $authors      Comma-separated list of author IDs. Default empty (all authors).
         @type string       $date_format  PHP date format to use for the listed pages. Relies on the 'show_date' parameter.
                                          Default is the value of 'date_format' option.
         @type int          $depth        Number of levels in the hierarchy of pages to include in the generated list.
                                          Accepts -1 (any depth), 0 (all pages), 1 (top-level pages only), and n (pages to
                                          the given n depth). Default 0.
         @type bool         $echo         Whether or not to echo the list of pages. Default true.
         @type string       $exclude      Comma-separated list of page IDs to exclude. Default empty.
         @type array        $include      Comma-separated list of page IDs to include. Default empty.
         @type string       $link_after   Text or HTML to follow the page link label. Default null.
         @type string       $link_before  Text or HTML to precede the page link label. Default null.
         @type string       $post_type    Post type to query for. Default 'page'.
         @type string|array $post_status  Comma-separated list or array of post statuses to include. Default 'publish'.
         @type string       $show_date    Whether to display the page publish or modified date for each page. Accepts
                                          'modified' or any other value. An empty value hides the date. Default empty.
         @type string       $sort_column  Comma-separated list of column names to sort the pages by. Accepts 'post_author',
                                          'post_date', 'post_title', 'post_name', 'post_modified', 'post_modified_gmt',
                                          'menu_order', 'post_parent', 'ID', 'rand', or 'comment_count'. Default 'post_title'.
         @type string       $title_li     List heading. Passing a null or empty value will result in no heading, and the list
                                          will not be wrapped with unordered list `<ul>` tags. Default 'Pages'.
         @type string       $item_spacing Whether to preserve whitespace within the menu's HTML. Accepts 'preserve' or 'discard'.
                                          Default 'preserve'.
         @type Walker       $walker       Walker instance to use for listing pages. Default empty (Walker_Page).
     }
     @return string|void HTML list of pages.
    
  **/
  public function wp_list_pages(args:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String> = ''):String;
  /**
    
     Displays or retrieves a list of pages with an optional home link.
    
     The arguments are listed below and part of the arguments are for wp_list_pages() function.
     Check that function for more info on those arguments.
    
     @since 2.7.0
     @since 4.4.0 Added `menu_id`, `container`, `before`, `after`, and `walker` arguments.
     @since 4.7.0 Added the `item_spacing` argument.
    
     @param array|string $args {
         Optional. Array or string of arguments to generate a page menu. See `wp_list_pages()` for additional arguments.
    
         @type string          $sort_column  How to sort the list of pages. Accepts post column names.
                                             Default 'menu_order, post_title'.
         @type string          $menu_id      ID for the div containing the page list. Default is empty string.
         @type string          $menu_class   Class to use for the element containing the page list. Default 'menu'.
         @type string          $container    Element to use for the element containing the page list. Default 'div'.
         @type bool            $echo         Whether to echo the list or return it. Accepts true (echo) or false (return).
                                             Default true.
         @type int|bool|string $show_home    Whether to display the link to the home page. Can just enter the text
                                             you'd like shown for the home link. 1|true defaults to 'Home'.
         @type string          $link_before  The HTML or text to prepend to $show_home text. Default empty.
         @type string          $link_after   The HTML or text to append to $show_home text. Default empty.
         @type string          $before       The HTML or text to prepend to the menu. Default is '<ul>'.
         @type string          $after        The HTML or text to append to the menu. Default is '</ul>'.
         @type string          $item_spacing Whether to preserve whitespace within the menu's HTML. Accepts 'preserve'
                                             or 'discard'. Default 'discard'.
         @type Walker          $walker       Walker instance to use for listing pages. Default empty (Walker_Page).
     }
     @return string|void HTML menu
    
  **/
  public function wp_page_menu(?args:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String>):String;
  /**
    
     Retrieve HTML list content for page list.
    
     @uses Walker_Page to create HTML list content.
     @since 2.1.0
    
     @param array $pages
     @param int   $depth
     @param int   $current_page
     @param array $r
     @return string
    
  **/
  public function walk_page_tree(pages:php.NativeStructArray<Dynamic>, depth:Int, current_page:Int, r:php.NativeStructArray<Dynamic>):String;
  /**
    
     Retrieve HTML dropdown (select) content for page list.
    
     @uses Walker_PageDropdown to create HTML dropdown content.
     @since 2.1.0
     @see Walker_PageDropdown::walk() for parameters and return description.
    
     @return string
    
  **/
  public function walk_page_dropdown_tree():String;
  /**
    
     Display an attachment page link using an image or icon.
    
     @since 2.0.0
    
     @param int|WP_Post $id Optional. Post ID or post object.
     @param bool        $fullsize     Optional, default is false. Whether to use full size.
     @param bool        $deprecated   Deprecated. Not used.
     @param bool        $permalink    Optional, default is false. Whether to include permalink.
    
  **/
  public function the_attachment_link(id:haxe.extern.EitherType<Int, wp.extern.Post> = 0, fullsize:Bool = false, deprecated:Bool = false, permalink:Bool = false):Void;
  /**
    
     Retrieve an attachment page link using an image or icon, if possible.
    
     @since 2.5.0
     @since 4.4.0 The `$id` parameter can now accept either a post ID or `WP_Post` object.
    
     @param int|WP_Post  $id        Optional. Post ID or post object.
     @param string|array $size      Optional. Image size. Accepts any valid image size, or an array
                                    of width and height values in pixels (in that order).
                                    Default 'thumbnail'.
     @param bool         $permalink Optional, Whether to add permalink to image. Default false.
     @param bool         $icon      Optional. Whether the attachment is an icon. Default false.
     @param string|false $text      Optional. Link text to use. Activated by passing a string, false otherwise.
                                    Default false.
     @param array|string $attr      Optional. Array or string of attributes. Default empty.
     @return string HTML content.
    
  **/
  public function wp_get_attachment_link(id:haxe.extern.EitherType<Int, wp.extern.Post> = 0, size:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = 'thumbnail', permalink:Bool = false, icon:Bool = false, text:haxe.extern.EitherType<String, Bool> = false, attr:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String> = ''):String;
  /**
    
     Wrap attachment in paragraph tag before content.
    
     @since 2.0.0
    
     @param string $content
     @return string
    
  **/
  public function prepend_attachment(content:String):String;
  /**
    
     Retrieve protected post password form content.
    
     @since 1.0.0
    
     @param int|WP_Post $post Optional. Post ID or WP_Post object. Default is global $post.
     @return string HTML content for password form for password protected post.
    
  **/
  public function get_the_password_form(post:haxe.extern.EitherType<Int, wp.extern.Post> = 0):String;
  /**
    
     Determines whether currently in a page template.
    
     This template tag allows you to determine if you are in a page template.
     You can optionally provide a template name or array of template names
     and then the check will be specific to that template.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 2.5.0
     @since 4.2.0 The `$template` parameter was changed to also accept an array of page templates.
     @since 4.7.0 Now works with any post type, not just pages.
    
     @param string|array $template The specific template name or array of templates to match.
     @return bool True on success, false on failure.
    
  **/
  public function is_page_template(template:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = ''):Bool;
  /**
    
     Get the specific template name for a given post.
    
     @since 3.4.0
     @since 4.7.0 Now works with any post type, not just pages.
    
     @param int|WP_Post $post Optional. Post ID or WP_Post object. Default is global $post.
     @return string|false Page template filename. Returns an empty string when the default page template
      is in use. Returns false if the post does not exist.
    
  **/
  public function get_page_template_slug(post:haxe.extern.EitherType<Int, wp.extern.Post> = null):haxe.extern.EitherType<String, Bool>;
  /**
    
     Retrieve formatted date timestamp of a revision (linked to that revisions's page).
    
     @since 2.6.0
    
     @param int|object $revision Revision ID or revision object.
     @param bool       $link     Optional, default is true. Link to revisions's page?
     @return string|false i18n formatted datetimestamp or localized 'Current Revision'.
    
  **/
  public function wp_post_revision_title(revision:haxe.extern.EitherType<Int, Dynamic>, link:Bool = true):haxe.extern.EitherType<String, Bool>;
  /**
    
     Retrieve formatted date timestamp of a revision (linked to that revisions's page).
    
     @since 3.6.0
    
     @param int|object $revision Revision ID or revision object.
     @param bool       $link     Optional, default is true. Link to revisions's page?
     @return string|false gravatar, user, i18n formatted datetimestamp or localized 'Current Revision'.
    
  **/
  public function wp_post_revision_title_expanded(revision:haxe.extern.EitherType<Int, Dynamic>, link:Bool = true):haxe.extern.EitherType<String, Bool>;
  /**
    
     Display a list of a post's revisions.
    
     Can output either a UL with edit links or a TABLE with diff interface, and
     restore action links.
    
     @since 2.6.0
    
     @param int|WP_Post $post_id Optional. Post ID or WP_Post object. Default is global $post.
     @param string      $type    'all' (default), 'revision' or 'autosave'
    
  **/
  public function wp_list_post_revisions(post_id:haxe.extern.EitherType<Int, wp.extern.Post> = 0, type:String = 'all'):Void;
}
