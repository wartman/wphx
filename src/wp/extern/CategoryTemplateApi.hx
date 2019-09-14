package wp.extern;

extern class CategoryTemplateApi implements wp.util.ApiFunctions {
  /**
    
     Retrieve category link URL.
    
     @since 1.0.0
     @see get_term_link()
    
     @param int|object $category Category ID or object.
     @return string Link on success, empty string if category does not exist.
    
  **/
  public function get_category_link(category:haxe.extern.EitherType<Int, Dynamic>):String;
  /**
    
     Retrieve category parents with separator.
    
     @since 1.2.0
     @since 4.8.0 The `$visited` parameter was deprecated and renamed to `$deprecated`.
    
     @param int $id Category ID.
     @param bool $link Optional, default is false. Whether to format with link.
     @param string $separator Optional, default is '/'. How to separate categories.
     @param bool $nicename Optional, default is false. Whether to use nice name for display.
     @param array $deprecated Not used.
     @return string|WP_Error A list of category parents on success, WP_Error on failure.
    
  **/
  public function get_category_parents(id:Int, link:Bool = false, separator:String = '/', nicename:Bool = false, ?deprecated:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<String, wp.extern.Error>;
  /**
    
     Retrieve post categories.
    
     This tag may be used outside The Loop by passing a post id as the parameter.
    
     Note: This function only returns results from the default "category" taxonomy.
     For custom taxonomies use get_the_terms().
    
     @since 0.71
    
     @param int $id Optional, default to current post ID. The post ID.
     @return WP_Term[] Array of WP_Term objects, one for each category assigned to the post.
    
  **/
  public function get_the_category(id:Int = false):php.NativeIndexedArray<wp.extern.Term>;
  /**
    
     Retrieve category name based on category ID.
    
     @since 0.71
    
     @param int $cat_ID Category ID.
     @return string|WP_Error Category name on success, WP_Error on failure.
    
  **/
  public function get_the_category_by_ID(cat_ID:Int):haxe.extern.EitherType<String, wp.extern.Error>;
  /**
    
     Retrieve category list for a post in either HTML list or custom format.
    
     @since 1.5.1
    
     @global WP_Rewrite $wp_rewrite
    
     @param string $separator Optional. Separator between the categories. By default, the links are placed
                              in an unordered list. An empty string will result in the default behavior.
     @param string $parents Optional. How to display the parents.
     @param int $post_id Optional. Post ID to retrieve categories.
     @return string
    
  **/
  public function get_the_category_list(separator:String = '', parents:String = '', post_id:Int = false):String;
  /**
    
     Checks if the current post is within any of the given categories.
    
     The given categories are checked against the post's categories' term_ids, names and slugs.
     Categories given as integers will only be checked against the post's categories' term_ids.
    
     Prior to v2.5 of WordPress, category names were not supported.
     Prior to v2.7, category slugs were not supported.
     Prior to v2.7, only one category could be compared: in_category( $single_category ).
     Prior to v2.7, this function could only be used in the WordPress Loop.
     As of 2.7, the function can be used anywhere if it is provided a post ID or post object.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 1.2.0
    
     @param int|string|array $category Category ID, name or slug, or array of said.
     @param int|object $post Optional. Post to check instead of the current post. (since 2.7.0)
     @return bool True if the current post is in any of the given categories.
    
  **/
  public function in_category(category:haxe.extern.EitherType<Int, haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>>, post:haxe.extern.EitherType<Int, Dynamic> = null):Bool;
  /**
    
     Display category list for a post in either HTML list or custom format.
    
     @since 0.71
    
     @param string $separator Optional. Separator between the categories. By default, the links are placed
                              in an unordered list. An empty string will result in the default behavior.
     @param string $parents Optional. How to display the parents.
     @param int $post_id Optional. Post ID to retrieve categories.
    
  **/
  public function the_category(separator:String = '', parents:String = '', post_id:Int = false):Void;
  /**
    
     Retrieve category description.
    
     @since 1.0.0
    
     @param int $category Optional. Category ID. Will use global category ID by default.
     @return string Category description, available.
    
  **/
  public function category_description(category:Int = 0):String;
  /**
    
     Display or retrieve the HTML dropdown list of categories.
    
     The 'hierarchical' argument, which is disabled by default, will override the
     depth argument, unless it is true. When the argument is false, it will
     display all of the categories. When it is enabled it will use the value in
     the 'depth' argument.
    
     @since 2.1.0
     @since 4.2.0 Introduced the `value_field` argument.
     @since 4.6.0 Introduced the `required` argument.
    
     @param string|array $args {
         Optional. Array or string of arguments to generate a categories drop-down element. See WP_Term_Query::__construct()
         for information on additional accepted arguments.
    
         @type string       $show_option_all   Text to display for showing all categories. Default empty.
         @type string       $show_option_none  Text to display for showing no categories. Default empty.
         @type string       $option_none_value Value to use when no category is selected. Default empty.
         @type string       $orderby           Which column to use for ordering categories. See get_terms() for a list
                                               of accepted values. Default 'id' (term_id).
         @type bool         $pad_counts        See get_terms() for an argument description. Default false.
         @type bool|int     $show_count        Whether to include post counts. Accepts 0, 1, or their bool equivalents.
                                               Default 0.
         @type bool|int     $echo              Whether to echo or return the generated markup. Accepts 0, 1, or their
                                               bool equivalents. Default 1.
         @type bool|int     $hierarchical      Whether to traverse the taxonomy hierarchy. Accepts 0, 1, or their bool
                                               equivalents. Default 0.
         @type int          $depth             Maximum depth. Default 0.
         @type int          $tab_index         Tab index for the select element. Default 0 (no tabindex).
         @type string       $name              Value for the 'name' attribute of the select element. Default 'cat'.
         @type string       $id                Value for the 'id' attribute of the select element. Defaults to the value
                                               of `$name`.
         @type string       $class             Value for the 'class' attribute of the select element. Default 'postform'.
         @type int|string   $selected          Value of the option that should be selected. Default 0.
         @type string       $value_field       Term field that should be used to populate the 'value' attribute
                                               of the option elements. Accepts any valid term field: 'term_id', 'name',
                                               'slug', 'term_group', 'term_taxonomy_id', 'taxonomy', 'description',
                                               'parent', 'count'. Default 'term_id'.
         @type string|array $taxonomy          Name of the category or categories to retrieve. Default 'category'.
         @type bool         $hide_if_empty     True to skip generating markup if no categories are found.
                                               Default false (create select element even if no categories are found).
         @type bool         $required          Whether the `<select>` element should have the HTML5 'required' attribute.
                                               Default false.
     }
     @return string HTML content only if 'echo' argument is 0.
    
  **/
  public function wp_dropdown_categories(args:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = ''):String;
  /**
    
     Display or retrieve the HTML list of categories.
    
     @since 2.1.0
     @since 4.4.0 Introduced the `hide_title_if_empty` and `separator` arguments. The `current_category` argument was modified to
                  optionally accept an array of values.
    
     @param string|array $args {
         Array of optional arguments.
    
         @type int          $child_of              Term ID to retrieve child terms of. See get_terms(). Default 0.
         @type int|array    $current_category      ID of category, or array of IDs of categories, that should get the
                                                   'current-cat' class. Default 0.
         @type int          $depth                 Category depth. Used for tab indentation. Default 0.
         @type bool|int     $echo                  True to echo markup, false to return it. Default 1.
         @type array|string $exclude               Array or comma/space-separated string of term IDs to exclude.
                                                   If `$hierarchical` is true, descendants of `$exclude` terms will also
                                                   be excluded; see `$exclude_tree`. See get_terms().
                                                   Default empty string.
         @type array|string $exclude_tree          Array or comma/space-separated string of term IDs to exclude, along
                                                   with their descendants. See get_terms(). Default empty string.
         @type string       $feed                  Text to use for the feed link. Default 'Feed for all posts filed
                                                   under [cat name]'.
         @type string       $feed_image            URL of an image to use for the feed link. Default empty string.
         @type string       $feed_type             Feed type. Used to build feed link. See get_term_feed_link().
                                                   Default empty string (default feed).
         @type bool|int     $hide_empty            Whether to hide categories that don't have any posts attached to them.
                                                   Default 1.
         @type bool         $hide_title_if_empty   Whether to hide the `$title_li` element if there are no terms in
                                                   the list. Default false (title will always be shown).
         @type bool         $hierarchical          Whether to include terms that have non-empty descendants.
                                                   See get_terms(). Default true.
         @type string       $order                 Which direction to order categories. Accepts 'ASC' or 'DESC'.
                                                   Default 'ASC'.
         @type string       $orderby               The column to use for ordering categories. Default 'name'.
         @type string       $separator             Separator between links. Default '<br />'.
         @type bool|int     $show_count            Whether to show how many posts are in the category. Default 0.
         @type string       $show_option_all       Text to display for showing all categories. Default empty string.
         @type string       $show_option_none      Text to display for the 'no categories' option.
                                                   Default 'No categories'.
         @type string       $style                 The style used to display the categories list. If 'list', categories
                                                   will be output as an unordered list. If left empty or another value,
                                                   categories will be output separated by `<br>` tags. Default 'list'.
         @type string       $taxonomy              Taxonomy name. Default 'category'.
         @type string       $title_li              Text to use for the list title `<li>` element. Pass an empty string
                                                   to disable. Default 'Categories'.
         @type bool|int     $use_desc_for_title    Whether to use the category description as the title attribute.
                                                   Default 1.
     }
     @return false|string HTML content only if 'echo' argument is 0.
    
  **/
  public function wp_list_categories(args:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = ''):haxe.extern.EitherType<Bool, String>;
  /**
    
     Displays a tag cloud.
    
     @since 2.3.0
     @since 4.8.0 Added the `show_count` argument.
    
     @param array|string $args {
         Optional. Array or string of arguments for displaying a tag cloud. See wp_generate_tag_cloud()
         and get_terms() for the full lists of arguments that can be passed in `$args`.
    
         @type int    $number    The number of tags to display. Accepts any positive integer
                                 or zero to return all. Default 0 (all tags).
         @type string $link      Whether to display term editing links or term permalinks.
                                 Accepts 'edit' and 'view'. Default 'view'.
         @type string $post_type The post type. Used to highlight the proper post type menu
                                 on the linked edit page. Defaults to the first post type
                                 associated with the taxonomy.
         @type bool   $echo      Whether or not to echo the return value. Default true.
     }
     @return void|array Generated tag cloud, only if no failures and 'array' is set for the 'format' argument.
                        Otherwise, this function outputs the tag cloud.
    
  **/
  public function wp_tag_cloud(args:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String> = ''):php.NativeArray;
  /**
    
     Default topic count scaling for tag links.
    
     @since 2.9.0
    
     @param int $count Number of posts with that tag.
     @return int Scaled count.
    
  **/
  public function default_topic_count_scale(count:Int):Int;
  /**
    
     Generates a tag cloud (heatmap) from provided data.
    
     @todo Complete functionality.
     @since 2.3.0
     @since 4.8.0 Added the `show_count` argument.
    
     @param WP_Term[]    $tags Array of WP_Term objects to generate the tag cloud for.
     @param string|array $args {
         Optional. Array or string of arguments for generating a tag cloud.
    
         @type int      $smallest                   Smallest font size used to display tags. Paired
                                                    with the value of `$unit`, to determine CSS text
                                                    size unit. Default 8 (pt).
         @type int      $largest                    Largest font size used to display tags. Paired
                                                    with the value of `$unit`, to determine CSS text
                                                    size unit. Default 22 (pt).
         @type string   $unit                       CSS text size unit to use with the `$smallest`
                                                    and `$largest` values. Accepts any valid CSS text
                                                    size unit. Default 'pt'.
         @type int      $number                     The number of tags to return. Accepts any
                                                    positive integer or zero to return all.
                                                    Default 0.
         @type string   $format                     Format to display the tag cloud in. Accepts 'flat'
                                                    (tags separated with spaces), 'list' (tags displayed
                                                    in an unordered list), or 'array' (returns an array).
                                                    Default 'flat'.
         @type string   $separator                  HTML or text to separate the tags. Default "\n" (newline).
         @type string   $orderby                    Value to order tags by. Accepts 'name' or 'count'.
                                                    Default 'name'. The {@see 'tag_cloud_sort'} filter
                                                    can also affect how tags are sorted.
         @type string   $order                      How to order the tags. Accepts 'ASC' (ascending),
                                                    'DESC' (descending), or 'RAND' (random). Default 'ASC'.
         @type int|bool $filter                     Whether to enable filtering of the final output
                                                    via {@see 'wp_generate_tag_cloud'}. Default 1|true.
         @type string   $topic_count_text           Nooped plural text from _n_noop() to supply to
                                                    tag counts. Default null.
         @type callable $topic_count_text_callback  Callback used to generate nooped plural text for
                                                    tag counts based on the count. Default null.
         @type callable $topic_count_scale_callback Callback used to determine the tag count scaling
                                                    value. Default default_topic_count_scale().
         @type bool|int $show_count                 Whether to display the tag counts. Default 0. Accepts
                                                    0, 1, or their bool equivalents.
     }
     @return string|array Tag cloud as a string or an array, depending on 'format' argument.
    
  **/
  public function wp_generate_tag_cloud(tags:php.NativeIndexedArray<wp.extern.Term>, args:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = ''):haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>;
  /**
    
     Serves as a callback for comparing objects based on name.
    
     Used with `uasort()`.
    
     @since 3.1.0
     @access private
    
     @param object $a The first object to compare.
     @param object $b The second object to compare.
     @return int Negative number if `$a->name` is less than `$b->name`, zero if they are equal,
                 or greater than zero if `$a->name` is greater than `$b->name`.
    
  **/
  public function _wp_object_name_sort_cb(a:Dynamic, b:Dynamic):Int;
  /**
    
     Serves as a callback for comparing objects based on count.
    
     Used with `uasort()`.
    
     @since 3.1.0
     @access private
    
     @param object $a The first object to compare.
     @param object $b The second object to compare.
     @return bool Whether the count value for `$a` is greater than the count value for `$b`.
    
  **/
  public function _wp_object_count_sort_cb(a:Dynamic, b:Dynamic):Bool;
  /**
    
     Retrieve HTML list content for category list.
    
     @uses Walker_Category to create HTML list content.
     @since 2.1.0
     @see Walker_Category::walk() for parameters and return description.
     @return string
    
  **/
  public function walk_category_tree():String;
  /**
    
     Retrieve HTML dropdown (select) content for category list.
    
     @uses Walker_CategoryDropdown to create HTML dropdown content.
     @since 2.1.0
     @see Walker_CategoryDropdown::walk() for parameters and return description.
     @return string
    
  **/
  public function walk_category_dropdown_tree():String;
  /**
    
     Retrieve the link to the tag.
    
     @since 2.3.0
     @see get_term_link()
    
     @param int|object $tag Tag ID or object.
     @return string Link on success, empty string if tag does not exist.
    
  **/
  public function get_tag_link(tag:haxe.extern.EitherType<Int, Dynamic>):String;
  /**
    
     Retrieve the tags for a post.
    
     @since 2.3.0
    
     @param int $id Post ID.
     @return array|false|WP_Error Array of tag objects on success, false on failure.
    
  **/
  public function get_the_tags(id:Int = 0):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, haxe.extern.EitherType<Bool, wp.extern.Error>>;
  /**
    
     Retrieve the tags for a post formatted as a string.
    
     @since 2.3.0
    
     @param string $before Optional. Before tags.
     @param string $sep Optional. Between tags.
     @param string $after Optional. After tags.
     @param int $id Optional. Post ID. Defaults to the current post.
     @return string|false|WP_Error A list of tags on success, false if there are no terms, WP_Error on failure.
    
  **/
  public function get_the_tag_list(before:String = '', sep:String = '', after:String = '', id:Int = 0):haxe.extern.EitherType<String, haxe.extern.EitherType<Bool, wp.extern.Error>>;
  /**
    
     Retrieve the tags for a post.
    
     @since 2.3.0
    
     @param string $before Optional. Before list.
     @param string $sep Optional. Separate items using this.
     @param string $after Optional. After list.
    
  **/
  public function the_tags(before:String = null, sep:String = ', ', after:String = ''):Void;
  /**
    
     Retrieve tag description.
    
     @since 2.8.0
    
     @param int $tag Optional. Tag ID. Will use global tag ID by default.
     @return string Tag description, available.
    
  **/
  public function tag_description(tag:Int = 0):String;
  /**
    
     Retrieve term description.
    
     @since 2.8.0
     @since 4.9.2 The `$taxonomy` parameter was deprecated.
    
     @param int  $term       Optional. Term ID. Will use global term ID by default.
     @param null $deprecated Deprecated argument.
     @return string Term description, available.
    
  **/
  public function term_description(term:Int = 0, deprecated:Dynamic = null):String;
  /**
    
     Retrieve the terms of the taxonomy that are attached to the post.
    
     @since 2.5.0
    
     @param int|WP_Post $post     Post ID or object.
     @param string      $taxonomy Taxonomy name.
     @return WP_Term[]|false|WP_Error Array of WP_Term objects on success, false if there are no terms
                                      or the post does not exist, WP_Error on failure.
    
  **/
  public function get_the_terms(post:haxe.extern.EitherType<Int, wp.extern.Post>, taxonomy:String):haxe.extern.EitherType<php.NativeIndexedArray<wp.extern.Term>, haxe.extern.EitherType<Bool, wp.extern.Error>>;
  /**
    
     Retrieve a post's terms as a list with specified format.
    
     @since 2.5.0
    
     @param int $id Post ID.
     @param string $taxonomy Taxonomy name.
     @param string $before Optional. Before list.
     @param string $sep Optional. Separate items using this.
     @param string $after Optional. After list.
     @return string|false|WP_Error A list of terms on success, false if there are no terms, WP_Error on failure.
    
  **/
  public function get_the_term_list(id:Int, taxonomy:String, before:String = '', sep:String = '', after:String = ''):haxe.extern.EitherType<String, haxe.extern.EitherType<Bool, wp.extern.Error>>;
  /**
    
     Retrieve term parents with separator.
    
     @since 4.8.0
    
     @param int     $term_id  Term ID.
     @param string  $taxonomy Taxonomy name.
     @param string|array $args {
         Array of optional arguments.
    
         @type string $format    Use term names or slugs for display. Accepts 'name' or 'slug'.
                                 Default 'name'.
         @type string $separator Separator for between the terms. Default '/'.
         @type bool   $link      Whether to format as a link. Default true.
         @type bool   $inclusive Include the term to get the parents for. Default true.
     }
     @return string|WP_Error A list of term parents on success, WP_Error or empty string on failure.
    
  **/
  public function get_term_parents_list(term_id:Int, taxonomy:String, ?args:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>):haxe.extern.EitherType<String, wp.extern.Error>;
  /**
    
     Display the terms in a list.
    
     @since 2.5.0
    
     @param int $id Post ID.
     @param string $taxonomy Taxonomy name.
     @param string $before Optional. Before list.
     @param string $sep Optional. Separate items using this.
     @param string $after Optional. After list.
     @return false|void False on WordPress error.
    
  **/
  public function the_terms(id:Int, taxonomy:String, before:String = '', sep:String = ', ', after:String = ''):Bool;
  /**
    
     Check if the current post has any of given category.
    
     @since 3.1.0
    
     @param string|int|array $category Optional. The category name/term_id/slug or array of them to check for.
     @param int|object $post Optional. Post to check instead of the current post.
     @return bool True if the current post has any of the given categories (or any category, if no category specified).
    
  **/
  public function has_category(category:haxe.extern.EitherType<String, haxe.extern.EitherType<Int, php.NativeStructArray<Dynamic>>> = '', post:haxe.extern.EitherType<Int, Dynamic> = null):Bool;
  /**
    
     Checks if the current post has any of given tags.
    
     The given tags are checked against the post's tags' term_ids, names and slugs.
     Tags given as integers will only be checked against the post's tags' term_ids.
     If no tags are given, determines if post has any tags.
    
     Prior to v2.7 of WordPress, tags given as integers would also be checked against the post's tags' names and slugs (in addition to term_ids)
     Prior to v2.7, this function could only be used in the WordPress Loop.
     As of 2.7, the function can be used anywhere if it is provided a post ID or post object.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 2.6.0
    
     @param string|int|array $tag Optional. The tag name/term_id/slug or array of them to check for.
     @param int|object $post Optional. Post to check instead of the current post. (since 2.7.0)
     @return bool True if the current post has any of the given tags (or any tag, if no tag specified).
    
  **/
  public function has_tag(tag:haxe.extern.EitherType<String, haxe.extern.EitherType<Int, php.NativeStructArray<Dynamic>>> = '', post:haxe.extern.EitherType<Int, Dynamic> = null):Bool;
  /**
    
     Check if the current post has any of given terms.
    
     The given terms are checked against the post's terms' term_ids, names and slugs.
     Terms given as integers will only be checked against the post's terms' term_ids.
     If no terms are given, determines if post has any terms.
    
     @since 3.1.0
    
     @param string|int|array $term Optional. The term name/term_id/slug or array of them to check for.
     @param string $taxonomy Taxonomy name
     @param int|object $post Optional. Post to check instead of the current post.
     @return bool True if the current post has any of the given tags (or any tag, if no tag specified).
    
  **/
  public function has_term(term:haxe.extern.EitherType<String, haxe.extern.EitherType<Int, php.NativeStructArray<Dynamic>>> = '', taxonomy:String = '', post:haxe.extern.EitherType<Int, Dynamic> = null):Bool;
}
