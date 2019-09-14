package wp.extern;

extern class PostApi implements wp.util.ApiFunctions {
  /**
    
     Creates the initial post types when 'init' action is fired.
    
     See {@see 'init'}.
    
     @since 2.9.0
    
  **/
  public function create_initial_post_types():Void;
  /**
    
     Retrieve attached file path based on attachment ID.
    
     By default the path will go through the 'get_attached_file' filter, but
     passing a true to the $unfiltered argument of get_attached_file() will
     return the file path unfiltered.
    
     The function works by getting the single post meta name, named
     '_wp_attached_file' and returning it. This is a convenience function to
     prevent looking up the meta name and provide a mechanism for sending the
     attached filename through a filter.
    
     @since 2.0.0
    
     @param int  $attachment_id Attachment ID.
     @param bool $unfiltered    Optional. Whether to apply filters. Default false.
     @return string|false The file path to where the attached file should be, false otherwise.
    
  **/
  public function get_attached_file(attachment_id:Int, unfiltered:Bool = false):haxe.extern.EitherType<String, Bool>;
  /**
    
     Update attachment file path based on attachment ID.
    
     Used to update the file path of the attachment, which uses post meta name
     '_wp_attached_file' to store the path of the attachment.
    
     @since 2.1.0
    
     @param int    $attachment_id Attachment ID.
     @param string $file          File path for the attachment.
     @return bool True on success, false on failure.
    
  **/
  public function update_attached_file(attachment_id:Int, file:String):Bool;
  /**
    
     Return relative path to an uploaded file.
    
     The path is relative to the current upload dir.
    
     @since 2.9.0
     @access private
    
     @param string $path Full path to the file.
     @return string Relative path on success, unchanged path on failure.
    
  **/
  public function _wp_relative_upload_path(path:String):String;
  /**
    
     Retrieve all children of the post parent ID.
    
     Normally, without any enhancements, the children would apply to pages. In the
     context of the inner workings of WordPress, pages, posts, and attachments
     share the same table, so therefore the functionality could apply to any one
     of them. It is then noted that while this function does not work on posts, it
     does not mean that it won't work on posts. It is recommended that you know
     what context you wish to retrieve the children of.
    
     Attachments may also be made the child of a post, so if that is an accurate
     statement (which needs to be verified), it would then be possible to get
     all of the attachments for a post. Attachments have since changed since
     version 2.5, so this is most likely inaccurate, but serves generally as an
     example of what is possible.
    
     The arguments listed as defaults are for this function and also of the
     get_posts() function. The arguments are combined with the get_children defaults
     and are then passed to the get_posts() function, which accepts additional arguments.
     You can replace the defaults in this function, listed below and the additional
     arguments listed in the get_posts() function.
    
     The 'post_parent' is the most important argument and important attention
     needs to be paid to the $args parameter. If you pass either an object or an
     integer (number), then just the 'post_parent' is grabbed and everything else
     is lost. If you don't specify any arguments, then it is assumed that you are
     in The Loop and the post parent will be grabbed for from the current post.
    
     The 'post_parent' argument is the ID to get the children. The 'numberposts'
     is the amount of posts to retrieve that has a default of '-1', which is
     used to get all of the posts. Giving a number higher than 0 will only
     retrieve that amount of posts.
    
     The 'post_type' and 'post_status' arguments can be used to choose what
     criteria of posts to retrieve. The 'post_type' can be anything, but WordPress
     post types are 'post', 'pages', and 'attachments'. The 'post_status'
     argument will accept any post status within the write administration panels.
    
     @since 2.0.0
    
     @see get_posts()
     @todo Check validity of description.
    
     @global WP_Post $post
    
     @param mixed  $args   Optional. User defined arguments for replacing the defaults. Default empty.
     @param string $output Optional. The required return type. One of OBJECT, ARRAY_A, or ARRAY_N, which correspond to
                           a WP_Post object, an associative array, or a numeric array, respectively. Default OBJECT.
     @return array Array of children, where the type of each element is determined by $output parameter.
                   Empty array on failure.
    
  **/
  public function get_children(args:Dynamic = '', ?output:String):php.NativeArray;
  /**
    
     Get extended entry info (<!--more-->).
    
     There should not be any space after the second dash and before the word
     'more'. There can be text or space(s) after the word 'more', but won't be
     referenced.
    
     The returned array has 'main', 'extended', and 'more_text' keys. Main has the text before
     the `<!--more-->`. The 'extended' key has the content after the
     `<!--more-->` comment. The 'more_text' key has the custom "Read More" text.
    
     @since 1.0.0
    
     @param string $post Post content.
     @return array Post before ('main'), after ('extended'), and custom read more ('more_text').
    
  **/
  public function get_extended(post:String):php.NativeArray;
  /**
    
     Retrieves post data given a post ID or post object.
    
     See sanitize_post() for optional $filter values. Also, the parameter
     `$post`, must be given as a variable, since it is passed by reference.
    
     @since 1.5.1
    
     @global WP_Post $post
    
     @param int|WP_Post|null $post   Optional. Post ID or post object. Defaults to global $post.
     @param string           $output Optional. The required return type. One of OBJECT, ARRAY_A, or ARRAY_N, which correspond to
                                     a WP_Post object, an associative array, or a numeric array, respectively. Default OBJECT.
     @param string           $filter Optional. Type of filter to apply. Accepts 'raw', 'edit', 'db',
                                     or 'display'. Default 'raw'.
     @return WP_Post|array|null Type corresponding to $output on success or null on failure.
                                When $output is OBJECT, a `WP_Post` instance is returned.
    
  **/
  public function get_post(post:haxe.extern.EitherType<Int, wp.extern.Post> = null, ?output:String, filter:String = 'raw'):haxe.extern.EitherType<wp.extern.Post, php.NativeArray>;
  /**
    
     Retrieve ancestors of a post.
    
     @since 2.5.0
    
     @param int|WP_Post $post Post ID or post object.
     @return array Ancestor IDs or empty array if none are found.
    
  **/
  public function get_post_ancestors(post:haxe.extern.EitherType<Int, wp.extern.Post>):php.NativeArray;
  /**
    
     Retrieve data from a post field based on Post ID.
    
     Examples of the post field will be, 'post_type', 'post_status', 'post_content',
     etc and based off of the post object property or key names.
    
     The context values are based off of the taxonomy filter functions and
     supported values are found within those functions.
    
     @since 2.3.0
     @since 4.5.0 The `$post` parameter was made optional.
    
     @see sanitize_post_field()
    
     @param string      $field   Post field name.
     @param int|WP_Post $post    Optional. Post ID or post object. Defaults to global $post.
     @param string      $context Optional. How to filter the field. Accepts 'raw', 'edit', 'db',
                                 or 'display'. Default 'display'.
     @return string The value of the post field on success, empty string on failure.
    
  **/
  public function get_post_field(field:String, post:haxe.extern.EitherType<Int, wp.extern.Post> = null, context:String = 'display'):String;
  /**
    
     Retrieve the mime type of an attachment based on the ID.
    
     This function can be used with any post type, but it makes more sense with
     attachments.
    
     @since 2.0.0
    
     @param int|WP_Post $post Optional. Post ID or post object. Defaults to global $post.
     @return string|false The mime type on success, false on failure.
    
  **/
  public function get_post_mime_type(post:haxe.extern.EitherType<Int, wp.extern.Post> = null):haxe.extern.EitherType<String, Bool>;
  /**
    
     Retrieve the post status based on the post ID.
    
     If the post ID is of an attachment, then the parent post status will be given
     instead.
    
     @since 2.0.0
    
     @param int|WP_Post $post Optional. Post ID or post object. Defaults to global $post..
     @return string|false Post status on success, false on failure.
    
  **/
  public function get_post_status(post:haxe.extern.EitherType<Int, wp.extern.Post> = null):haxe.extern.EitherType<String, Bool>;
  /**
    
     Retrieve all of the WordPress supported post statuses.
    
     Posts have a limited set of valid status values, this provides the
     post_status values and descriptions.
    
     @since 2.5.0
    
     @return array List of post statuses.
    
  **/
  public function get_post_statuses():php.NativeArray;
  /**
    
     Retrieve all of the WordPress support page statuses.
    
     Pages have a limited set of valid status values, this provides the
     post_status values and descriptions.
    
     @since 2.5.0
    
     @return array List of page statuses.
    
  **/
  public function get_page_statuses():php.NativeArray;
  /**
    
     Return statuses for privacy requests.
    
     @since 4.9.6
     @access private
    
     @return array
    
  **/
  public function _wp_privacy_statuses():php.NativeArray;
  /**
    
     Register a post status. Do not use before init.
    
     A simple function for creating or modifying a post status based on the
     parameters given. The function will accept an array (second optional
     parameter), along with a string for the post status name.
    
     Arguments prefixed with an _underscore shouldn't be used by plugins and themes.
    
     @since 3.0.0
     @global array $wp_post_statuses Inserts new post status object into the list
    
     @param string $post_status Name of the post status.
     @param array|string $args {
         Optional. Array or string of post status arguments.
    
         @type bool|string $label                     A descriptive name for the post status marked
                                                      for translation. Defaults to value of $post_status.
         @type bool|array  $label_count               Descriptive text to use for nooped plurals.
                                                      Default array of $label, twice
         @type bool        $exclude_from_search       Whether to exclude posts with this post status
                                                      from search results. Default is value of $internal.
         @type bool        $_builtin                  Whether the status is built-in. Core-use only.
                                                      Default false.
         @type bool        $public                    Whether posts of this status should be shown
                                                      in the front end of the site. Default false.
         @type bool        $internal                  Whether the status is for internal use only.
                                                      Default false.
         @type bool        $protected                 Whether posts with this status should be protected.
                                                      Default false.
         @type bool        $private                   Whether posts with this status should be private.
                                                      Default false.
         @type bool        $publicly_queryable        Whether posts with this status should be publicly-
                                                      queryable. Default is value of $public.
         @type bool        $show_in_admin_all_list    Whether to include posts in the edit listing for
                                                      their post type. Default is value of $internal.
         @type bool        $show_in_admin_status_list Show in the list of statuses with post counts at
                                                      the top of the edit listings,
                                                      e.g. All (12) | Published (9) | My Custom Status (2)
                                                      Default is value of $internal.
     }
     @return object
    
  **/
  public function register_post_status(post_status:String, ?args:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String>):Dynamic;
  /**
    
     Retrieve a post status object by name.
    
     @since 3.0.0
    
     @global array $wp_post_statuses List of post statuses.
    
     @see register_post_status()
    
     @param string $post_status The name of a registered post status.
     @return object|null A post status object.
    
  **/
  public function get_post_status_object(post_status:String):Dynamic;
  /**
    
     Get a list of post statuses.
    
     @since 3.0.0
    
     @global array $wp_post_statuses List of post statuses.
    
     @see register_post_status()
    
     @param array|string $args     Optional. Array or string of post status arguments to compare against
                                   properties of the global `$wp_post_statuses objects`. Default empty array.
     @param string       $output   Optional. The type of output to return, either 'names' or 'objects'. Default 'names'.
     @param string       $operator Optional. The logical operation to perform. 'or' means only one element
                                   from the array needs to match; 'and' means all elements must match.
                                   Default 'and'.
     @return array A list of post status names or objects.
    
  **/
  public function get_post_stati(?args:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String>, output:String = 'names', operator_:String = 'and'):php.NativeArray;
  /**
    
     Whether the post type is hierarchical.
    
     A false return value might also mean that the post type does not exist.
    
     @since 3.0.0
    
     @see get_post_type_object()
    
     @param string $post_type Post type name
     @return bool Whether post type is hierarchical.
    
  **/
  public function is_post_type_hierarchical(post_type:String):Bool;
  /**
    
     Determines whether a post type is registered.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 3.0.0
    
     @see get_post_type_object()
    
     @param string $post_type Post type name.
     @return bool Whether post type is registered.
    
  **/
  public function post_type_exists(post_type:String):Bool;
  /**
    
     Retrieves the post type of the current post or of a given post.
    
     @since 2.1.0
    
     @param int|WP_Post|null $post Optional. Post ID or post object. Default is global $post.
     @return string|false          Post type on success, false on failure.
    
  **/
  public function get_post_type(post:haxe.extern.EitherType<Int, wp.extern.Post> = null):haxe.extern.EitherType<String, Bool>;
  /**
    
     Retrieves a post type object by name.
    
     @since 3.0.0
     @since 4.6.0 Object returned is now an instance of `WP_Post_Type`.
    
     @global array $wp_post_types List of post types.
    
     @see register_post_type()
    
     @param string $post_type The name of a registered post type.
     @return WP_Post_Type|null WP_Post_Type object if it exists, null otherwise.
    
  **/
  public function get_post_type_object(post_type:String):wp.extern.PostType;
  /**
    
     Get a list of all registered post type objects.
    
     @since 2.9.0
    
     @global array $wp_post_types List of post types.
    
     @see register_post_type() for accepted arguments.
    
     @param array|string $args     Optional. An array of key => value arguments to match against
                                   the post type objects. Default empty array.
     @param string       $output   Optional. The type of output to return. Accepts post type 'names'
                                   or 'objects'. Default 'names'.
     @param string       $operator Optional. The logical operation to perform. 'or' means only one
                                   element from the array needs to match; 'and' means all elements
                                   must match; 'not' means no elements may match. Default 'and'.
     @return string[]|WP_Post_Type[] An array of post type names or objects.
    
  **/
  public function get_post_types(?args:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String>, output:String = 'names', operator_:String = 'and'):haxe.extern.EitherType<php.NativeIndexedArray<String>, php.NativeIndexedArray<wp.extern.PostType>>;
  /**
    
     Registers a post type.
    
     Note: Post type registrations should not be hooked before the
     {@see 'init'} action. Also, any taxonomy connections should be
     registered via the `$taxonomies` argument to ensure consistency
     when hooks such as {@see 'parse_query'} or {@see 'pre_get_posts'}
     are used.
    
     Post types can support any number of built-in core features such
     as meta boxes, custom fields, post thumbnails, post statuses,
     comments, and more. See the `$supports` argument for a complete
     list of supported features.
    
     @since 2.9.0
     @since 3.0.0 The `show_ui` argument is now enforced on the new post screen.
     @since 4.4.0 The `show_ui` argument is now enforced on the post type listing
                  screen and post editing screen.
     @since 4.6.0 Post type object returned is now an instance of `WP_Post_Type`.
     @since 4.7.0 Introduced `show_in_rest`, `rest_base` and `rest_controller_class`
                  arguments to register the post type in REST API.
    
     @global array $wp_post_types List of post types.
    
     @param string $post_type Post type key. Must not exceed 20 characters and may
                              only contain lowercase alphanumeric characters, dashes,
                              and underscores. See sanitize_key().
     @param array|string $args {
         Array or string of arguments for registering a post type.
    
         @type string      $label                 Name of the post type shown in the menu. Usually plural.
                                                  Default is value of $labels['name'].
         @type array       $labels                An array of labels for this post type. If not set, post
                                                  labels are inherited for non-hierarchical types and page
                                                  labels for hierarchical ones. See get_post_type_labels() for a full
                                                  list of supported labels.
         @type string      $description           A short descriptive summary of what the post type is.
                                                  Default empty.
         @type bool        $public                Whether a post type is intended for use publicly either via
                                                  the admin interface or by front-end users. While the default
                                                  settings of $exclude_from_search, $publicly_queryable, $show_ui,
                                                  and $show_in_nav_menus are inherited from public, each does not
                                                  rely on this relationship and controls a very specific intention.
                                                  Default false.
         @type bool        $hierarchical          Whether the post type is hierarchical (e.g. page). Default false.
         @type bool        $exclude_from_search   Whether to exclude posts with this post type from front end search
                                                  results. Default is the opposite value of $public.
         @type bool        $publicly_queryable    Whether queries can be performed on the front end for the post type
                                                  as part of parse_request(). Endpoints would include:
                                                  * ?post_type={post_type_key}
                                                  * ?{post_type_key}={single_post_slug}
                                                  * ?{post_type_query_var}={single_post_slug}
                                                  If not set, the default is inherited from $public.
         @type bool        $show_ui               Whether to generate and allow a UI for managing this post type in the
                                                  admin. Default is value of $public.
         @type bool        $show_in_menu          Where to show the post type in the admin menu. To work, $show_ui
                                                  must be true. If true, the post type is shown in its own top level
                                                  menu. If false, no menu is shown. If a string of an existing top
                                                  level menu (eg. 'tools.php' or 'edit.php?post_type=page'), the post
                                                  type will be placed as a sub-menu of that.
                                                  Default is value of $show_ui.
         @type bool        $show_in_nav_menus     Makes this post type available for selection in navigation menus.
                                                  Default is value $public.
         @type bool        $show_in_admin_bar     Makes this post type available via the admin bar. Default is value
                                                  of $show_in_menu.
         @type bool        $show_in_rest          Whether to add the post type route in the REST API 'wp/v2' namespace.
         @type string      $rest_base             To change the base url of REST API route. Default is $post_type.
         @type string      $rest_controller_class REST API Controller class name. Default is 'WP_REST_Posts_Controller'.
         @type int         $menu_position         The position in the menu order the post type should appear. To work,
                                                  $show_in_menu must be true. Default null (at the bottom).
         @type string      $menu_icon             The url to the icon to be used for this menu. Pass a base64-encoded
                                                  SVG using a data URI, which will be colored to match the color scheme
                                                  -- this should begin with 'data:image/svg+xml;base64,'. Pass the name
                                                  of a Dashicons helper class to use a font icon, e.g.
                                                  'dashicons-chart-pie'. Pass 'none' to leave div.wp-menu-image empty
                                                  so an icon can be added via CSS. Defaults to use the posts icon.
         @type string      $capability_type       The string to use to build the read, edit, and delete capabilities.
                                                  May be passed as an array to allow for alternative plurals when using
                                                  this argument as a base to construct the capabilities, e.g.
                                                  array('story', 'stories'). Default 'post'.
         @type array       $capabilities          Array of capabilities for this post type. $capability_type is used
                                                  as a base to construct capabilities by default.
                                                  See get_post_type_capabilities().
         @type bool        $map_meta_cap          Whether to use the internal default meta capability handling.
                                                  Default false.
         @type array       $supports              Core feature(s) the post type supports. Serves as an alias for calling
                                                  add_post_type_support() directly. Core features include 'title',
                                                  'editor', 'comments', 'revisions', 'trackbacks', 'author', 'excerpt',
                                                  'page-attributes', 'thumbnail', 'custom-fields', and 'post-formats'.
                                                  Additionally, the 'revisions' feature dictates whether the post type
                                                  will store revisions, and the 'comments' feature dictates whether the
                                                  comments count will show on the edit screen. Defaults is an array
                                                  containing 'title' and 'editor'.
         @type callable    $register_meta_box_cb  Provide a callback function that sets up the meta boxes for the
                                                  edit form. Do remove_meta_box() and add_meta_box() calls in the
                                                  callback. Default null.
         @type array       $taxonomies            An array of taxonomy identifiers that will be registered for the
                                                  post type. Taxonomies can be registered later with register_taxonomy()
                                                  or register_taxonomy_for_object_type().
                                                  Default empty array.
         @type bool|string $has_archive           Whether there should be post type archives, or if a string, the
                                                  archive slug to use. Will generate the proper rewrite rules if
                                                  $rewrite is enabled. Default false.
         @type bool|array  $rewrite              {
             Triggers the handling of rewrites for this post type. To prevent rewrite, set to false.
             Defaults to true, using $post_type as slug. To specify rewrite rules, an array can be
             passed with any of these keys:
    
             @type string $slug       Customize the permastruct slug. Defaults to $post_type key.
             @type bool   $with_front Whether the permastruct should be prepended with WP_Rewrite::$front.
                                      Default true.
             @type bool   $feeds      Whether the feed permastruct should be built for this post type.
                                      Default is value of $has_archive.
             @type bool   $pages      Whether the permastruct should provide for pagination. Default true.
             @type const  $ep_mask    Endpoint mask to assign. If not specified and permalink_epmask is set,
                                      inherits from $permalink_epmask. If not specified and permalink_epmask
                                      is not set, defaults to EP_PERMALINK.
         }
         @type string|bool $query_var             Sets the query_var key for this post type. Defaults to $post_type
                                                  key. If false, a post type cannot be loaded at
                                                  ?{query_var}={post_slug}. If specified as a string, the query
                                                  ?{query_var_string}={post_slug} will be valid.
         @type bool        $can_export            Whether to allow this post type to be exported. Default true.
         @type bool        $delete_with_user      Whether to delete posts of this type when deleting a user. If true,
                                                  posts of this type belonging to the user will be moved to trash
                                                  when then user is deleted. If false, posts of this type belonging
                                                  to the user will *not* be trashed or deleted. If not set (the default),
                                                  posts are trashed if post_type_supports('author'). Otherwise posts
                                                  are not trashed or deleted. Default null.
         @type bool        $_builtin              FOR INTERNAL USE ONLY! True if this post type is a native or
                                                  "built-in" post_type. Default false.
         @type string      $_edit_link            FOR INTERNAL USE ONLY! URL segment to use for edit link of
                                                  this post type. Default 'post.php?post=%d'.
     }
     @return WP_Post_Type|WP_Error The registered post type object, or an error object.
    
  **/
  public function register_post_type(post_type:String, ?args:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String>):haxe.extern.EitherType<wp.extern.PostType, wp.extern.Error>;
  /**
    
     Unregisters a post type.
    
     Can not be used to unregister built-in post types.
    
     @since 4.5.0
    
     @global array $wp_post_types List of post types.
    
     @param string $post_type Post type to unregister.
     @return bool|WP_Error True on success, WP_Error on failure or if the post type doesn't exist.
    
  **/
  public function unregister_post_type(post_type:String):haxe.extern.EitherType<Bool, wp.extern.Error>;
  /**
    
     Build an object with all post type capabilities out of a post type object
    
     Post type capabilities use the 'capability_type' argument as a base, if the
     capability is not set in the 'capabilities' argument array or if the
     'capabilities' argument is not supplied.
    
     The capability_type argument can optionally be registered as an array, with
     the first value being singular and the second plural, e.g. array('story, 'stories')
     Otherwise, an 's' will be added to the value for the plural form. After
     registration, capability_type will always be a string of the singular value.
    
     By default, seven keys are accepted as part of the capabilities array:
    
     - edit_post, read_post, and delete_post are meta capabilities, which are then
       generally mapped to corresponding primitive capabilities depending on the
       context, which would be the post being edited/read/deleted and the user or
       role being checked. Thus these capabilities would generally not be granted
       directly to users or roles.
    
     - edit_posts - Controls whether objects of this post type can be edited.
     - edit_others_posts - Controls whether objects of this type owned by other users
       can be edited. If the post type does not support an author, then this will
       behave like edit_posts.
     - publish_posts - Controls publishing objects of this post type.
     - read_private_posts - Controls whether private objects can be read.
    
     These four primitive capabilities are checked in core in various locations.
     There are also seven other primitive capabilities which are not referenced
     directly in core, except in map_meta_cap(), which takes the three aforementioned
     meta capabilities and translates them into one or more primitive capabilities
     that must then be checked against the user or role, depending on the context.
    
     - read - Controls whether objects of this post type can be read.
     - delete_posts - Controls whether objects of this post type can be deleted.
     - delete_private_posts - Controls whether private objects can be deleted.
     - delete_published_posts - Controls whether published objects can be deleted.
     - delete_others_posts - Controls whether objects owned by other users can be
       can be deleted. If the post type does not support an author, then this will
       behave like delete_posts.
     - edit_private_posts - Controls whether private objects can be edited.
     - edit_published_posts - Controls whether published objects can be edited.
    
     These additional capabilities are only used in map_meta_cap(). Thus, they are
     only assigned by default if the post type is registered with the 'map_meta_cap'
     argument set to true (default is false).
    
     @since 3.0.0
    
     @see register_post_type()
     @see map_meta_cap()
    
     @param object $args Post type registration arguments.
     @return object Object with all the capabilities as member variables.
    
  **/
  public function get_post_type_capabilities(args:Dynamic):Dynamic;
  /**
    
     Store or return a list of post type meta caps for map_meta_cap().
    
     @since 3.1.0
     @access private
    
     @global array $post_type_meta_caps Used to store meta capabilities.
    
     @param array $capabilities Post type meta capabilities.
    
  **/
  public function _post_type_meta_capabilities(capabilities:php.NativeStructArray<Dynamic> = null):Void;
  /**
    
     Builds an object with all post type labels out of a post type object.
    
     Accepted keys of the label array in the post type object:
    
     - `name` - General name for the post type, usually plural. The same and overridden
              by `$post_type_object->label`. Default is 'Posts' / 'Pages'.
     - `singular_name` - Name for one object of this post type. Default is 'Post' / 'Page'.
     - `add_new` - Default is 'Add New' for both hierarchical and non-hierarchical types.
                 When internationalizing this string, please use a {@link https://codex.wordpress.org/I18n_for_WordPress_Developers#Disambiguation_by_context gettext context}
                 matching your post type. Example: `_x( 'Add New', 'product', 'textdomain' );`.
     - `add_new_item` - Label for adding a new singular item. Default is 'Add New Post' / 'Add New Page'.
     - `edit_item` - Label for editing a singular item. Default is 'Edit Post' / 'Edit Page'.
     - `new_item` - Label for the new item page title. Default is 'New Post' / 'New Page'.
     - `view_item` - Label for viewing a singular item. Default is 'View Post' / 'View Page'.
     - `view_items` - Label for viewing post type archives. Default is 'View Posts' / 'View Pages'.
     - `search_items` - Label for searching plural items. Default is 'Search Posts' / 'Search Pages'.
     - `not_found` - Label used when no items are found. Default is 'No posts found' / 'No pages found'.
     - `not_found_in_trash` - Label used when no items are in the trash. Default is 'No posts found in Trash' /
                            'No pages found in Trash'.
     - `parent_item_colon` - Label used to prefix parents of hierarchical items. Not used on non-hierarchical
                           post types. Default is 'Parent Page:'.
     - `all_items` - Label to signify all items in a submenu link. Default is 'All Posts' / 'All Pages'.
     - `archives` - Label for archives in nav menus. Default is 'Post Archives' / 'Page Archives'.
     - `attributes` - Label for the attributes meta box. Default is 'Post Attributes' / 'Page Attributes'.
     - `insert_into_item` - Label for the media frame button. Default is 'Insert into post' / 'Insert into page'.
     - `uploaded_to_this_item` - Label for the media frame filter. Default is 'Uploaded to this post' /
                               'Uploaded to this page'.
     - `featured_image` - Label for the Featured Image meta box title. Default is 'Featured Image'.
     - `set_featured_image` - Label for setting the featured image. Default is 'Set featured image'.
     - `remove_featured_image` - Label for removing the featured image. Default is 'Remove featured image'.
     - `use_featured_image` - Label in the media frame for using a featured image. Default is 'Use as featured image'.
     - `menu_name` - Label for the menu name. Default is the same as `name`.
     - `filter_items_list` - Label for the table views hidden heading. Default is 'Filter posts list' /
                           'Filter pages list'.
     - `items_list_navigation` - Label for the table pagination hidden heading. Default is 'Posts list navigation' /
                               'Pages list navigation'.
     - `items_list` - Label for the table hidden heading. Default is 'Posts list' / 'Pages list'.
     - `item_published` - Label used when an item is published. Default is 'Post published.' / 'Page published.'
     - `item_published_privately` - Label used when an item is published with private visibility.
                                  Default is 'Post published privately.' / 'Page published privately.'
     - `item_reverted_to_draft` - Label used when an item is switched to a draft.
                                Default is 'Post reverted to draft.' / 'Page reverted to draft.'
     - `item_scheduled` - Label used when an item is scheduled for publishing. Default is 'Post scheduled.' /
                        'Page scheduled.'
     - `item_updated` - Label used when an item is updated. Default is 'Post updated.' / 'Page updated.'
    
     Above, the first default value is for non-hierarchical post types (like posts)
     and the second one is for hierarchical post types (like pages).
    
     Note: To set labels used in post type admin notices, see the {@see 'post_updated_messages'} filter.
    
     @since 3.0.0
     @since 4.3.0 Added the `featured_image`, `set_featured_image`, `remove_featured_image`,
                  and `use_featured_image` labels.
     @since 4.4.0 Added the `archives`, `insert_into_item`, `uploaded_to_this_item`, `filter_items_list`,
                  `items_list_navigation`, and `items_list` labels.
     @since 4.6.0 Converted the `$post_type` parameter to accept a `WP_Post_Type` object.
     @since 4.7.0 Added the `view_items` and `attributes` labels.
     @since 5.0.0 Added the `item_published`, `item_published_privately`, `item_reverted_to_draft`,
                  `item_scheduled`, and `item_updated` labels.
    
     @access private
    
     @param object|WP_Post_Type $post_type_object Post type object.
     @return object Object with all the labels as member variables.
    
  **/
  public function get_post_type_labels(post_type_object:haxe.extern.EitherType<Dynamic, wp.extern.PostType>):Dynamic;
  /**
    
     Build an object with custom-something object (post type, taxonomy) labels
     out of a custom-something object
    
     @since 3.0.0
     @access private
    
     @param object $object                  A custom-something object.
     @param array  $nohier_vs_hier_defaults Hierarchical vs non-hierarchical default labels.
     @return object Object containing labels for the given custom-something object.
    
  **/
  public function _get_custom_object_labels(object:Dynamic, nohier_vs_hier_defaults:php.NativeStructArray<Dynamic>):Dynamic;
  /**
    
     Add submenus for post types.
    
     @access private
     @since 3.1.0
    
  **/
  public function _add_post_type_submenus():Void;
  /**
    
     Register support of certain features for a post type.
    
     All core features are directly associated with a functional area of the edit
     screen, such as the editor or a meta box. Features include: 'title', 'editor',
     'comments', 'revisions', 'trackbacks', 'author', 'excerpt', 'page-attributes',
     'thumbnail', 'custom-fields', and 'post-formats'.
    
     Additionally, the 'revisions' feature dictates whether the post type will
     store revisions, and the 'comments' feature dictates whether the comments
     count will show on the edit screen.
    
     @since 3.0.0
    
     @global array $_wp_post_type_features
    
     @param string       $post_type The post type for which to add the feature.
     @param string|array $feature   The feature being added, accepts an array of
                                    feature strings or a single string.
    
  **/
  public function add_post_type_support(post_type:String, feature:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>):Void;
  /**
    
     Remove support for a feature from a post type.
    
     @since 3.0.0
    
     @global array $_wp_post_type_features
    
     @param string $post_type The post type for which to remove the feature.
     @param string $feature   The feature being removed.
    
  **/
  public function remove_post_type_support(post_type:String, feature:String):Void;
  /**
    
     Get all the post type features
    
     @since 3.4.0
    
     @global array $_wp_post_type_features
    
     @param string $post_type The post type.
     @return array Post type supports list.
    
  **/
  public function get_all_post_type_supports(post_type:String):php.NativeArray;
  /**
    
     Check a post type's support for a given feature.
    
     @since 3.0.0
    
     @global array $_wp_post_type_features
    
     @param string $post_type The post type being checked.
     @param string $feature   The feature being checked.
     @return bool Whether the post type supports the given feature.
    
  **/
  public function post_type_supports(post_type:String, feature:String):Bool;
  /**
    
     Retrieves a list of post type names that support a specific feature.
    
     @since 4.5.0
    
     @global array $_wp_post_type_features Post type features
    
     @param array|string $feature  Single feature or an array of features the post types should support.
     @param string       $operator Optional. The logical operation to perform. 'or' means
                                   only one element from the array needs to match; 'and'
                                   means all elements must match; 'not' means no elements may
                                   match. Default 'and'.
     @return array A list of post type names.
    
  **/
  public function get_post_types_by_support(feature:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String>, operator_:String = 'and'):php.NativeArray;
  /**
    
     Update the post type for the post ID.
    
     The page or post cache will be cleaned for the post ID.
    
     @since 2.5.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int    $post_id   Optional. Post ID to change post type. Default 0.
     @param string $post_type Optional. Post type. Accepts 'post' or 'page' to
                              name a few. Default 'post'.
     @return int|false Amount of rows changed. Should be 1 for success and 0 for failure.
    
  **/
  public function set_post_type(post_id:Int = 0, post_type:String = 'post'):haxe.extern.EitherType<Int, Bool>;
  /**
    
     Determines whether a post type is considered "viewable".
    
     For built-in post types such as posts and pages, the 'public' value will be evaluated.
     For all others, the 'publicly_queryable' value will be used.
    
     @since 4.4.0
     @since 4.5.0 Added the ability to pass a post type name in addition to object.
     @since 4.6.0 Converted the `$post_type` parameter to accept a `WP_Post_Type` object.
    
     @param string|WP_Post_Type $post_type Post type name or object.
     @return bool Whether the post type should be considered viewable.
    
  **/
  public function is_post_type_viewable(post_type:haxe.extern.EitherType<String, wp.extern.PostType>):Bool;
  /**
    
     Retrieves an array of the latest posts, or posts matching the given criteria.
    
     The defaults are as follows:
    
     @since 1.2.0
    
     @see WP_Query::parse_query()
    
     @param array $args {
         Optional. Arguments to retrieve posts. See WP_Query::parse_query() for all
         available arguments.
    
         @type int        $numberposts      Total number of posts to retrieve. Is an alias of $posts_per_page
                                            in WP_Query. Accepts -1 for all. Default 5.
         @type int|string $category         Category ID or comma-separated list of IDs (this or any children).
                                            Is an alias of $cat in WP_Query. Default 0.
         @type array      $include          An array of post IDs to retrieve, sticky posts will be included.
                                            Is an alias of $post__in in WP_Query. Default empty array.
         @type array      $exclude          An array of post IDs not to retrieve. Default empty array.
         @type bool       $suppress_filters Whether to suppress filters. Default true.
     }
     @return WP_Post[]|int[] Array of post objects or post IDs.
    
  **/
  public function get_posts(args:php.NativeStructArray<Dynamic> = null):haxe.extern.EitherType<php.NativeIndexedArray<wp.extern.Post>, php.NativeIndexedArray<Int>>;
  /**
    
     Adds a meta field to the given post.
    
     Post meta data is called "Custom Fields" on the Administration Screen.
    
     @since 1.5.0
    
     @param int    $post_id    Post ID.
     @param string $meta_key   Metadata name.
     @param mixed  $meta_value Metadata value. Must be serializable if non-scalar.
     @param bool   $unique     Optional. Whether the same key should not be added.
                               Default false.
     @return int|false Meta ID on success, false on failure.
    
  **/
  public function add_post_meta(post_id:Int, meta_key:String, meta_value:Dynamic, unique:Bool = false):haxe.extern.EitherType<Int, Bool>;
  /**
    
     Deletes a post meta field for the given post ID.
    
     You can match based on the key, or key and value. Removing based on key and
     value, will keep from removing duplicate metadata with the same key. It also
     allows removing all metadata matching the key, if needed.
    
     @since 1.5.0
    
     @param int    $post_id    Post ID.
     @param string $meta_key   Metadata name.
     @param mixed  $meta_value Optional. Metadata value. Must be serializable if
                               non-scalar. Default empty.
     @return bool True on success, false on failure.
    
  **/
  public function delete_post_meta(post_id:Int, meta_key:String, meta_value:Dynamic = ''):Bool;
  /**
    
     Retrieves a post meta field for the given post ID.
    
     @since 1.5.0
    
     @param int    $post_id Post ID.
     @param string $key     Optional. The meta key to retrieve. By default, returns
                            data for all keys. Default empty.
     @param bool   $single  Optional. If true, returns only the first value for the specified meta key.
                            This parameter has no effect if $key is not specified. Default false.
     @return mixed Will be an array if $single is false. Will be value of the meta
                   field if $single is true.
    
  **/
  public function get_post_meta(post_id:Int, key:String = '', single:Bool = false):Dynamic;
  /**
    
     Updates a post meta field based on the given post ID.
    
     Use the `$prev_value` parameter to differentiate between meta fields with the
     same key and post ID.
    
     If the meta field for the post does not exist, it will be added and its ID returned.
    
     Can be used in place of add_post_meta().
    
     @since 1.5.0
    
     @param int    $post_id    Post ID.
     @param string $meta_key   Metadata key.
     @param mixed  $meta_value Metadata value. Must be serializable if non-scalar.
     @param mixed  $prev_value Optional. Previous value to check before updating.
     @return int|bool The new meta field ID if a field with the given key didn't exist and was
                      therefore added, true on successful update, false on failure.
    
  **/
  public function update_post_meta(post_id:Int, meta_key:String, meta_value:Dynamic, prev_value:Dynamic = ''):haxe.extern.EitherType<Int, Bool>;
  /**
    
     Deletes everything from post meta matching the given meta key.
    
     @since 2.3.0
    
     @param string $post_meta_key Key to search for when deleting.
     @return bool Whether the post meta key was deleted from the database.
    
  **/
  public function delete_post_meta_by_key(post_meta_key:String):Bool;
  /**
    
     Registers a meta key for posts.
    
     @since 4.9.8
    
     @param string $post_type Post type to register a meta key for. Pass an empty string
                              to register the meta key across all existing post types.
     @param string $meta_key  The meta key to register.
     @param array  $args      Data used to describe the meta key when registered. See
                              {@see register_meta()} for a list of supported arguments.
     @return bool True if the meta key was successfully registered, false if not.
    
  **/
  public function register_post_meta(post_type:String, meta_key:String, args:php.NativeStructArray<Dynamic>):Bool;
  /**
    
     Unregisters a meta key for posts.
    
     @since 4.9.8
    
     @param string $post_type Post type the meta key is currently registered for. Pass
                              an empty string if the meta key is registered across all
                              existing post types.
     @param string $meta_key  The meta key to unregister.
     @return bool True on success, false if the meta key was not previously registered.
    
  **/
  public function unregister_post_meta(post_type:String, meta_key:String):Bool;
  /**
    
     Retrieve post meta fields, based on post ID.
    
     The post meta fields are retrieved from the cache where possible,
     so the function is optimized to be called more than once.
    
     @since 1.2.0
    
     @param int $post_id Optional. Post ID. Default is ID of the global $post.
     @return array Post meta for the given post.
    
  **/
  public function get_post_custom(post_id:Int = 0):php.NativeArray;
  /**
    
     Retrieve meta field names for a post.
    
     If there are no meta fields, then nothing (null) will be returned.
    
     @since 1.2.0
    
     @param int $post_id Optional. Post ID. Default is ID of the global $post.
     @return array|void Array of the keys, if retrieved.
    
  **/
  public function get_post_custom_keys(post_id:Int = 0):php.NativeArray;
  /**
    
     Retrieve values for a custom post field.
    
     The parameters must not be considered optional. All of the post meta fields
     will be retrieved and only the meta field key values returned.
    
     @since 1.2.0
    
     @param string $key     Optional. Meta field key. Default empty.
     @param int    $post_id Optional. Post ID. Default is ID of the global $post.
     @return array|null Meta field values.
    
  **/
  public function get_post_custom_values(key:String = '', post_id:Int = 0):php.NativeArray;
  /**
    
     Determines whether a post is sticky.
    
     Sticky posts should remain at the top of The Loop. If the post ID is not
     given, then The Loop ID for the current post will be used.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 2.7.0
    
     @param int $post_id Optional. Post ID. Default is ID of the global $post.
     @return bool Whether post is sticky.
    
  **/
  public function is_sticky(post_id:Int = 0):Bool;
  /**
    
     Sanitize every post field.
    
     If the context is 'raw', then the post object or array will get minimal
     sanitization of the integer fields.
    
     @since 2.3.0
    
     @see sanitize_post_field()
    
     @param object|WP_Post|array $post    The Post Object or Array
     @param string               $context Optional. How to sanitize post fields.
                                          Accepts 'raw', 'edit', 'db', or 'display'.
                                          Default 'display'.
     @return object|WP_Post|array The now sanitized Post Object or Array (will be the
                                  same type as $post).
    
  **/
  public function sanitize_post(post:haxe.extern.EitherType<Dynamic, haxe.extern.EitherType<wp.extern.Post, php.NativeStructArray<Dynamic>>>, context:String = 'display'):haxe.extern.EitherType<Dynamic, haxe.extern.EitherType<wp.extern.Post, php.NativeStructArray<Dynamic>>>;
  /**
    
     Sanitize post field based on context.
    
     Possible context values are:  'raw', 'edit', 'db', 'display', 'attribute' and
     'js'. The 'display' context is used by default. 'attribute' and 'js' contexts
     are treated like 'display' when calling filters.
    
     @since 2.3.0
     @since 4.4.0 Like `sanitize_post()`, `$context` defaults to 'display'.
    
     @param string $field   The Post Object field name.
     @param mixed  $value   The Post Object value.
     @param int    $post_id Post ID.
     @param string $context Optional. How to sanitize post fields. Looks for 'raw', 'edit',
                            'db', 'display', 'attribute' and 'js'. Default 'display'.
     @return mixed Sanitized value.
    
  **/
  public function sanitize_post_field(field:String, value:Dynamic, post_id:Int, context:String = 'display'):Dynamic;
  /**
    
     Make a post sticky.
    
     Sticky posts should be displayed at the top of the front page.
    
     @since 2.7.0
    
     @param int $post_id Post ID.
    
  **/
  public function stick_post(post_id:Int):Void;
  /**
    
     Un-stick a post.
    
     Sticky posts should be displayed at the top of the front page.
    
     @since 2.7.0
    
     @param int $post_id Post ID.
    
  **/
  public function unstick_post(post_id:Int):Void;
  /**
    
     Return the cache key for wp_count_posts() based on the passed arguments.
    
     @since 3.9.0
     @access private
    
     @param string $type Optional. Post type to retrieve count Default 'post'.
     @param string $perm Optional. 'readable' or empty. Default empty.
     @return string The cache key.
    
  **/
  public function _count_posts_cache_key(type:String = 'post', perm:String = ''):String;
  /**
    
     Count number of posts of a post type and if user has permissions to view.
    
     This function provides an efficient method of finding the amount of post's
     type a blog has. Another method is to count the amount of items in
     get_posts(), but that method has a lot of overhead with doing so. Therefore,
     when developing for 2.5+, use this function instead.
    
     The $perm parameter checks for 'readable' value and if the user can read
     private posts, it will display that for the user that is signed in.
    
     @since 2.5.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string $type Optional. Post type to retrieve count. Default 'post'.
     @param string $perm Optional. 'readable' or empty. Default empty.
     @return object Number of posts for each status.
    
  **/
  public function wp_count_posts(type:String = 'post', perm:String = ''):Dynamic;
  /**
    
     Count number of attachments for the mime type(s).
    
     If you set the optional mime_type parameter, then an array will still be
     returned, but will only have the item you are looking for. It does not give
     you the number of attachments that are children of a post. You can get that
     by counting the number of children that post has.
    
     @since 2.5.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string|array $mime_type Optional. Array or comma-separated list of
                                    MIME patterns. Default empty.
     @return object An object containing the attachment counts by mime type.
    
  **/
  public function wp_count_attachments(mime_type:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = ''):Dynamic;
  /**
    
     Get default post mime types.
    
     @since 2.9.0
    
     @return array List of post mime types.
    
  **/
  public function get_post_mime_types():php.NativeArray;
  /**
    
     Check a MIME-Type against a list.
    
     If the wildcard_mime_types parameter is a string, it must be comma separated
     list. If the real_mime_types is a string, it is also comma separated to
     create the list.
    
     @since 2.5.0
    
     @param string|array $wildcard_mime_types Mime types, e.g. audio/mpeg or image (same as image/*)
                                              or flash (same as *flash*).
     @param string|array $real_mime_types     Real post mime type values.
     @return array array(wildcard=>array(real types)).
    
  **/
  public function wp_match_mime_types(wildcard_mime_types:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>, real_mime_types:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>):php.NativeArray;
  /**
    
     Convert MIME types into SQL.
    
     @since 2.5.0
    
     @param string|array $post_mime_types List of mime types or comma separated string
                                          of mime types.
     @param string       $table_alias     Optional. Specify a table alias, if needed.
                                          Default empty.
     @return string The SQL AND clause for mime searching.
    
  **/
  public function wp_post_mime_type_where(post_mime_types:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>, table_alias:String = ''):String;
  /**
    
     Trash or delete a post or page.
    
     When the post and page is permanently deleted, everything that is tied to
     it is deleted also. This includes comments, post meta fields, and terms
     associated with the post.
    
     The post or page is moved to trash instead of permanently deleted unless
     trash is disabled, item is already in the trash, or $force_delete is true.
    
     @since 1.0.0
    
     @global wpdb $wpdb WordPress database abstraction object.
     @see wp_delete_attachment()
     @see wp_trash_post()
    
     @param int  $postid       Optional. Post ID. Default 0.
     @param bool $force_delete Optional. Whether to bypass trash and force deletion.
                               Default false.
     @return WP_Post|false|null Post data on success, false or null on failure.
    
  **/
  public function wp_delete_post(postid:Int = 0, force_delete:Bool = false):haxe.extern.EitherType<wp.extern.Post, Bool>;
  /**
    
     Reset the page_on_front, show_on_front, and page_for_post settings when
     a linked page is deleted or trashed.
    
     Also ensures the post is no longer sticky.
    
     @since 3.7.0
     @access private
    
     @param int $post_id Post ID.
    
  **/
  public function _reset_front_page_settings_for_post(post_id:Int):Void;
  /**
    
     Move a post or page to the Trash
    
     If trash is disabled, the post or page is permanently deleted.
    
     @since 2.9.0
    
     @see wp_delete_post()
    
     @param int $post_id Optional. Post ID. Default is ID of the global $post
                         if EMPTY_TRASH_DAYS equals true.
     @return WP_Post|false|null Post data on success, false or null on failure.
    
  **/
  public function wp_trash_post(post_id:Int = 0):haxe.extern.EitherType<wp.extern.Post, Bool>;
  /**
    
     Restore a post or page from the Trash.
    
     @since 2.9.0
    
     @param int $post_id Optional. Post ID. Default is ID of the global $post.
     @return WP_Post|false|null Post data on success, false or null on failure.
    
  **/
  public function wp_untrash_post(post_id:Int = 0):haxe.extern.EitherType<wp.extern.Post, Bool>;
  /**
    
     Moves comments for a post to the trash.
    
     @since 2.9.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int|WP_Post|null $post Optional. Post ID or post object. Defaults to global $post.
     @return mixed|void False on failure.
    
  **/
  public function wp_trash_post_comments(post:haxe.extern.EitherType<Int, wp.extern.Post> = null):Dynamic;
  /**
    
     Restore comments for a post from the trash.
    
     @since 2.9.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int|WP_Post|null $post Optional. Post ID or post object. Defaults to global $post.
     @return true|void
    
  **/
  public function wp_untrash_post_comments(post:haxe.extern.EitherType<Int, wp.extern.Post> = null):Bool;
  /**
    
     Retrieve the list of categories for a post.
    
     Compatibility layer for themes and plugins. Also an easy layer of abstraction
     away from the complexity of the taxonomy layer.
    
     @since 2.1.0
    
     @see wp_get_object_terms()
    
     @param int   $post_id Optional. The Post ID. Does not default to the ID of the
                           global $post. Default 0.
     @param array $args    Optional. Category query parameters. Default empty array.
                           See WP_Term_Query::__construct() for supported arguments.
     @return array|WP_Error List of categories. If the `$fields` argument passed via `$args` is 'all' or
                            'all_with_object_id', an array of WP_Term objects will be returned. If `$fields`
                            is 'ids', an array of category ids. If `$fields` is 'names', an array of category names.
                            WP_Error object if 'category' taxonomy doesn't exist.
    
  **/
  public function wp_get_post_categories(post_id:Int = 0, ?args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, wp.extern.Error>;
  /**
    
     Retrieve the tags for a post.
    
     There is only one default for this function, called 'fields' and by default
     is set to 'all'. There are other defaults that can be overridden in
     wp_get_object_terms().
    
     @since 2.3.0
    
     @param int   $post_id Optional. The Post ID. Does not default to the ID of the
                           global $post. Default 0.
     @param array $args    Optional. Tag query parameters. Default empty array.
                           See WP_Term_Query::__construct() for supported arguments.
     @return array|WP_Error Array of WP_Term objects on success or empty array if no tags were found.
                            WP_Error object if 'post_tag' taxonomy doesn't exist.
    
  **/
  public function wp_get_post_tags(post_id:Int = 0, ?args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, wp.extern.Error>;
  /**
    
     Retrieves the terms for a post.
    
     @since 2.8.0
    
     @param int          $post_id  Optional. The Post ID. Does not default to the ID of the
                                   global $post. Default 0.
     @param string|array $taxonomy Optional. The taxonomy slug or array of slugs for which
                                   to retrieve terms. Default 'post_tag'.
     @param array        $args     {
         Optional. Term query parameters. See WP_Term_Query::__construct() for supported arguments.
    
         @type string $fields Term fields to retrieve. Default 'all'.
     }
     @return array|WP_Error Array of WP_Term objects on success or empty array if no terms were found.
                            WP_Error object if `$taxonomy` doesn't exist.
    
  **/
  public function wp_get_post_terms(post_id:Int = 0, taxonomy:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = 'post_tag', ?args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, wp.extern.Error>;
  /**
    
     Retrieve a number of recent posts.
    
     @since 1.0.0
    
     @see get_posts()
    
     @param array  $args   Optional. Arguments to retrieve posts. Default empty array.
     @param string $output Optional. The required return type. One of OBJECT or ARRAY_A, which correspond to
                           a WP_Post object or an associative array, respectively. Default ARRAY_A.
     @return array|false Array of recent posts, where the type of each element is determined by $output parameter.
                         Empty array on failure.
    
  **/
  public function wp_get_recent_posts(?args:php.NativeStructArray<Dynamic>, ?output:String):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Bool>;
  /**
    
     Insert or update a post.
    
     If the $postarr parameter has 'ID' set to a value, then post will be updated.
    
     You can set the post date manually, by setting the values for 'post_date'
     and 'post_date_gmt' keys. You can close the comments or open the comments by
     setting the value for 'comment_status' key.
    
     @since 1.0.0
     @since 4.2.0 Support was added for encoding emoji in the post title, content, and excerpt.
     @since 4.4.0 A 'meta_input' array can now be passed to `$postarr` to add post meta data.
    
     @see sanitize_post()
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param array $postarr {
         An array of elements that make up a post to update or insert.
    
         @type int    $ID                    The post ID. If equal to something other than 0,
                                             the post with that ID will be updated. Default 0.
         @type int    $post_author           The ID of the user who added the post. Default is
                                             the current user ID.
         @type string $post_date             The date of the post. Default is the current time.
         @type string $post_date_gmt         The date of the post in the GMT timezone. Default is
                                             the value of `$post_date`.
         @type mixed  $post_content          The post content. Default empty.
         @type string $post_content_filtered The filtered post content. Default empty.
         @type string $post_title            The post title. Default empty.
         @type string $post_excerpt          The post excerpt. Default empty.
         @type string $post_status           The post status. Default 'draft'.
         @type string $post_type             The post type. Default 'post'.
         @type string $comment_status        Whether the post can accept comments. Accepts 'open' or 'closed'.
                                             Default is the value of 'default_comment_status' option.
         @type string $ping_status           Whether the post can accept pings. Accepts 'open' or 'closed'.
                                             Default is the value of 'default_ping_status' option.
         @type string $post_password         The password to access the post. Default empty.
         @type string $post_name             The post name. Default is the sanitized post title
                                             when creating a new post.
         @type string $to_ping               Space or carriage return-separated list of URLs to ping.
                                             Default empty.
         @type string $pinged                Space or carriage return-separated list of URLs that have
                                             been pinged. Default empty.
         @type string $post_modified         The date when the post was last modified. Default is
                                             the current time.
         @type string $post_modified_gmt     The date when the post was last modified in the GMT
                                             timezone. Default is the current time.
         @type int    $post_parent           Set this for the post it belongs to, if any. Default 0.
         @type int    $menu_order            The order the post should be displayed in. Default 0.
         @type string $post_mime_type        The mime type of the post. Default empty.
         @type string $guid                  Global Unique ID for referencing the post. Default empty.
         @type array  $post_category         Array of category IDs.
                                             Defaults to value of the 'default_category' option.
         @type array  $tags_input            Array of tag names, slugs, or IDs. Default empty.
         @type array  $tax_input             Array of taxonomy terms keyed by their taxonomy name. Default empty.
         @type array  $meta_input            Array of post meta values keyed by their post meta key. Default empty.
     }
     @param bool  $wp_error Optional. Whether to return a WP_Error on failure. Default false.
     @return int|WP_Error The post ID on success. The value 0 or WP_Error on failure.
    
  **/
  public function wp_insert_post(postarr:php.NativeStructArray<Dynamic>, wp_error:Bool = false):haxe.extern.EitherType<Int, wp.extern.Error>;
  /**
    
     Update a post with new post data.
    
     The date does not have to be set for drafts. You can set the date and it will
     not be overridden.
    
     @since 1.0.0
    
     @param array|object $postarr  Optional. Post data. Arrays are expected to be escaped,
                                   objects are not. Default array.
     @param bool         $wp_error Optional. Allow return of WP_Error on failure. Default false.
     @return int|WP_Error The value 0 or WP_Error on failure. The post ID on success.
    
  **/
  public function wp_update_post(?postarr:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Dynamic>, wp_error:Bool = false):haxe.extern.EitherType<Int, wp.extern.Error>;
  /**
    
     Publish a post by transitioning the post status.
    
     @since 2.1.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int|WP_Post $post Post ID or post object.
    
  **/
  public function wp_publish_post(post:haxe.extern.EitherType<Int, wp.extern.Post>):Void;
  /**
    
     Publish future post and make sure post ID has future post status.
    
     Invoked by cron 'publish_future_post' event. This safeguard prevents cron
     from publishing drafts, etc.
    
     @since 2.5.0
    
     @param int|WP_Post $post_id Post ID or post object.
    
  **/
  public function check_and_publish_future_post(post_id:haxe.extern.EitherType<Int, wp.extern.Post>):Void;
  /**
    
     Computes a unique slug for the post, when given the desired slug and some post details.
    
     @since 2.8.0
    
     @global wpdb       $wpdb WordPress database abstraction object.
     @global WP_Rewrite $wp_rewrite
    
     @param string $slug        The desired slug (post_name).
     @param int    $post_ID     Post ID.
     @param string $post_status No uniqueness checks are made if the post is still draft or pending.
     @param string $post_type   Post type.
     @param int    $post_parent Post parent ID.
     @return string Unique slug for the post, based on $post_name (with a -1, -2, etc. suffix)
    
  **/
  public function wp_unique_post_slug(slug:String, post_ID:Int, post_status:String, post_type:String, post_parent:Int):String;
  /**
    
     Truncate a post slug.
    
     @since 3.6.0
     @access private
    
     @see utf8_uri_encode()
    
     @param string $slug   The slug to truncate.
     @param int    $length Optional. Max length of the slug. Default 200 (characters).
     @return string The truncated slug.
    
  **/
  public function _truncate_post_slug(slug:String, length:Int = 200):String;
  /**
    
     Add tags to a post.
    
     @see wp_set_post_tags()
    
     @since 2.3.0
    
     @param int          $post_id Optional. The Post ID. Does not default to the ID of the global $post.
     @param string|array $tags    Optional. An array of tags to set for the post, or a string of tags
                                  separated by commas. Default empty.
     @return array|false|WP_Error Array of affected term IDs. WP_Error or false on failure.
    
  **/
  public function wp_add_post_tags(post_id:Int = 0, tags:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = ''):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, haxe.extern.EitherType<Bool, wp.extern.Error>>;
  /**
    
     Set the tags for a post.
    
     @since 2.3.0
    
     @see wp_set_object_terms()
    
     @param int          $post_id Optional. The Post ID. Does not default to the ID of the global $post.
     @param string|array $tags    Optional. An array of tags to set for the post, or a string of tags
                                  separated by commas. Default empty.
     @param bool         $append  Optional. If true, don't delete existing tags, just add on. If false,
                                  replace the tags with the new tags. Default false.
     @return array|false|WP_Error Array of term taxonomy IDs of affected terms. WP_Error or false on failure.
    
  **/
  public function wp_set_post_tags(post_id:Int = 0, tags:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = '', append:Bool = false):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, haxe.extern.EitherType<Bool, wp.extern.Error>>;
  /**
    
     Set the terms for a post.
    
     @since 2.8.0
    
     @see wp_set_object_terms()
    
     @param int          $post_id  Optional. The Post ID. Does not default to the ID of the global $post.
     @param string|array $tags     Optional. An array of terms to set for the post, or a string of terms
                                   separated by commas. Hierarchical taxonomies must always pass IDs rather
                                   than names so that children with the same names but different parents
                                   aren't confused. Default empty.
     @param string       $taxonomy Optional. Taxonomy name. Default 'post_tag'.
     @param bool         $append   Optional. If true, don't delete existing terms, just add on. If false,
                                   replace the terms with the new terms. Default false.
     @return array|false|WP_Error Array of term taxonomy IDs of affected terms. WP_Error or false on failure.
    
  **/
  public function wp_set_post_terms(post_id:Int = 0, tags:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = '', taxonomy:String = 'post_tag', append:Bool = false):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, haxe.extern.EitherType<Bool, wp.extern.Error>>;
  /**
    
     Set categories for a post.
    
     If the post categories parameter is not set, then the default category is
     going used.
    
     @since 2.1.0
    
     @param int       $post_ID         Optional. The Post ID. Does not default to the ID
                                       of the global $post. Default 0.
     @param array|int $post_categories Optional. List of category IDs, or the ID of a single category.
                                       Default empty array.
     @param bool      $append          If true, don't delete existing categories, just add on.
                                       If false, replace the categories with the new categories.
     @return array|false|WP_Error Array of term taxonomy IDs of affected categories. WP_Error or false on failure.
    
  **/
  public function wp_set_post_categories(post_ID:Int = 0, ?post_categories:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Int>, append:Bool = false):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, haxe.extern.EitherType<Bool, wp.extern.Error>>;
  /**
    
     Fires actions related to the transitioning of a post's status.
    
     When a post is saved, the post status is "transitioned" from one status to another,
     though this does not always mean the status has actually changed before and after
     the save. This function fires a number of action hooks related to that transition:
     the generic {@see 'transition_post_status'} action, as well as the dynamic hooks
     {@see '$old_status_to_$new_status'} and {@see '$new_status_$post->post_type'}. Note
     that the function does not transition the post object in the database.
    
     For instance: When publishing a post for the first time, the post status may transition
     from 'draft' – or some other status – to 'publish'. However, if a post is already
     published and is simply being updated, the "old" and "new" statuses may both be 'publish'
     before and after the transition.
    
     @since 2.3.0
    
     @param string  $new_status Transition to this post status.
     @param string  $old_status Previous post status.
     @param WP_Post $post Post data.
    
  **/
  public function wp_transition_post_status(new_status:String, old_status:String, post:wp.extern.Post):Void;
  /**
    
     Add a URL to those already pinged.
    
     @since 1.5.0
     @since 4.7.0 `$post_id` can be a WP_Post object.
     @since 4.7.0 `$uri` can be an array of URIs.
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int|WP_Post  $post_id Post object or ID.
     @param string|array $uri     Ping URI or array of URIs.
     @return int|false How many rows were updated.
    
  **/
  public function add_ping(post_id:haxe.extern.EitherType<Int, wp.extern.Post>, uri:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>):haxe.extern.EitherType<Int, Bool>;
  /**
    
     Retrieve enclosures already enclosed for a post.
    
     @since 1.5.0
    
     @param int $post_id Post ID.
     @return array List of enclosures.
    
  **/
  public function get_enclosed(post_id:Int):php.NativeArray;
  /**
    
     Retrieve URLs already pinged for a post.
    
     @since 1.5.0
    
     @since 4.7.0 `$post_id` can be a WP_Post object.
    
     @param int|WP_Post $post_id Post ID or object.
     @return bool|string[] Array of URLs already pinged for the given post, false if the post is not found.
    
  **/
  public function get_pung(post_id:haxe.extern.EitherType<Int, wp.extern.Post>):haxe.extern.EitherType<Bool, php.NativeIndexedArray<String>>;
  /**
    
     Retrieve URLs that need to be pinged.
    
     @since 1.5.0
     @since 4.7.0 `$post_id` can be a WP_Post object.
    
     @param int|WP_Post $post_id Post Object or ID
     @return array
    
  **/
  public function get_to_ping(post_id:haxe.extern.EitherType<Int, wp.extern.Post>):php.NativeArray;
  /**
    
     Do trackbacks for a list of URLs.
    
     @since 1.0.0
    
     @param string $tb_list Comma separated list of URLs.
     @param int    $post_id Post ID.
    
  **/
  public function trackback_url_list(tb_list:String, post_id:Int):Void;
  /**
    
     Get a list of page IDs.
    
     @since 2.0.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @return array List of page IDs.
    
  **/
  public function get_all_page_ids():php.NativeArray;
  /**
    
     Retrieves page data given a page ID or page object.
    
     Use get_post() instead of get_page().
    
     @since 1.5.1
     @deprecated 3.5.0 Use get_post()
    
     @param mixed  $page   Page object or page ID. Passed by reference.
     @param string $output Optional. The required return type. One of OBJECT, ARRAY_A, or ARRAY_N, which correspond to
                           a WP_Post object, an associative array, or a numeric array, respectively. Default OBJECT.
     @param string $filter Optional. How the return value should be filtered. Accepts 'raw',
                           'edit', 'db', 'display'. Default 'raw'.
     @return WP_Post|array|null WP_Post (or array) on success, or null on failure.
    
  **/
  public function get_page(page:Dynamic, ?output:String, filter:String = 'raw'):haxe.extern.EitherType<wp.extern.Post, php.NativeArray>;
  /**
    
     Retrieves a page given its path.
    
     @since 2.1.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string       $page_path Page path.
     @param string       $output    Optional. The required return type. One of OBJECT, ARRAY_A, or ARRAY_N, which correspond to
                                    a WP_Post object, an associative array, or a numeric array, respectively. Default OBJECT.
     @param string|array $post_type Optional. Post type or array of post types. Default 'page'.
     @return WP_Post|array|null WP_Post (or array) on success, or null on failure.
    
  **/
  public function get_page_by_path(page_path:String, ?output:String, post_type:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = 'page'):haxe.extern.EitherType<wp.extern.Post, php.NativeArray>;
  /**
    
     Retrieve a page given its title.
    
     @since 2.1.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string       $page_title Page title
     @param string       $output     Optional. The required return type. One of OBJECT, ARRAY_A, or ARRAY_N, which correspond to
                                     a WP_Post object, an associative array, or a numeric array, respectively. Default OBJECT.
     @param string|array $post_type  Optional. Post type or array of post types. Default 'page'.
     @return WP_Post|array|null WP_Post (or array) on success, or null on failure.
    
  **/
  public function get_page_by_title(page_title:String, ?output:String, post_type:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = 'page'):haxe.extern.EitherType<wp.extern.Post, php.NativeArray>;
  /**
    
     Identify descendants of a given page ID in a list of page objects.
    
     Descendants are identified from the `$pages` array passed to the function. No database queries are performed.
    
     @since 1.5.1
    
     @param int   $page_id Page ID.
     @param array $pages   List of page objects from which descendants should be identified.
     @return array List of page children.
    
  **/
  public function get_page_children(page_id:Int, pages:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Order the pages with children under parents in a flat list.
    
     It uses auxiliary structure to hold parent-children relationships and
     runs in O(N) complexity
    
     @since 2.0.0
    
     @param array $pages   Posts array (passed by reference).
     @param int   $page_id Optional. Parent page ID. Default 0.
     @return array A list arranged by hierarchy. Children immediately follow their parents.
    
  **/
  public function get_page_hierarchy(pages:php.NativeStructArray<Dynamic>, page_id:Int):php.NativeArray;
  /**
    
     Traverse and return all the nested children post names of a root page.
    
     $children contains parent-children relations
    
     @since 2.9.0
     @access private
    
     @see _page_traverse_name()
    
     @param int   $page_id   Page ID.
     @param array $children  Parent-children relations (passed by reference).
     @param array $result    Result (passed by reference).
    
  **/
  public function _page_traverse_name(page_id:Int, children:php.NativeStructArray<Dynamic>, result:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Build the URI path for a page.
    
     Sub pages will be in the "directory" under the parent page post name.
    
     @since 1.5.0
     @since 4.6.0 Converted the `$page` parameter to optional.
    
     @param WP_Post|object|int $page Optional. Page ID or WP_Post object. Default is global $post.
     @return string|false Page URI, false on error.
    
  **/
  public function get_page_uri(page:haxe.extern.EitherType<wp.extern.Post, haxe.extern.EitherType<Dynamic, Int>> = 0):haxe.extern.EitherType<String, Bool>;
  /**
    
     Retrieve a list of pages (or hierarchical post type items).
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @since 1.5.0
    
     @param array|string $args {
         Optional. Array or string of arguments to retrieve pages.
    
         @type int          $child_of     Page ID to return child and grandchild pages of. Note: The value
                                          of `$hierarchical` has no bearing on whether `$child_of` returns
                                          hierarchical results. Default 0, or no restriction.
         @type string       $sort_order   How to sort retrieved pages. Accepts 'ASC', 'DESC'. Default 'ASC'.
         @type string       $sort_column  What columns to sort pages by, comma-separated. Accepts 'post_author',
                                          'post_date', 'post_title', 'post_name', 'post_modified', 'menu_order',
                                          'post_modified_gmt', 'post_parent', 'ID', 'rand', 'comment_count'.
                                          'post_' can be omitted for any values that start with it.
                                          Default 'post_title'.
         @type bool         $hierarchical Whether to return pages hierarchically. If false in conjunction with
                                          `$child_of` also being false, both arguments will be disregarded.
                                          Default true.
         @type array        $exclude      Array of page IDs to exclude. Default empty array.
         @type array        $include      Array of page IDs to include. Cannot be used with `$child_of`,
                                          `$parent`, `$exclude`, `$meta_key`, `$meta_value`, or `$hierarchical`.
                                          Default empty array.
         @type string       $meta_key     Only include pages with this meta key. Default empty.
         @type string       $meta_value   Only include pages with this meta value. Requires `$meta_key`.
                                          Default empty.
         @type string       $authors      A comma-separated list of author IDs. Default empty.
         @type int          $parent       Page ID to return direct children of. Default -1, or no restriction.
         @type string|array $exclude_tree Comma-separated string or array of page IDs to exclude.
                                          Default empty array.
         @type int          $number       The number of pages to return. Default 0, or all pages.
         @type int          $offset       The number of pages to skip before returning. Requires `$number`.
                                          Default 0.
         @type string       $post_type    The post type to query. Default 'page'.
         @type string|array $post_status  A comma-separated list or array of post statuses to include.
                                          Default 'publish'.
     }
     @return array|false List of pages matching defaults or `$args`.
    
  **/
  public function get_pages(?args:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Bool>;
  /**
    
     Determines whether an attachment URI is local and really an attachment.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 2.0.0
    
     @param string $url URL to check
     @return bool True on success, false on failure.
    
  **/
  public function is_local_attachment(url:String):Bool;
  /**
    
     Insert an attachment.
    
     If you set the 'ID' in the $args parameter, it will mean that you are
     updating and attempt to update the attachment. You can also set the
     attachment name or title by setting the key 'post_name' or 'post_title'.
    
     You can set the dates for the attachment manually by setting the 'post_date'
     and 'post_date_gmt' keys' values.
    
     By default, the comments will use the default settings for whether the
     comments are allowed. You can close them manually or keep them open by
     setting the value for the 'comment_status' key.
    
     @since 2.0.0
     @since 4.7.0 Added the `$wp_error` parameter to allow a WP_Error to be returned on failure.
    
     @see wp_insert_post()
    
     @param string|array $args     Arguments for inserting an attachment.
     @param string       $file     Optional. Filename.
     @param int          $parent   Optional. Parent post ID.
     @param bool         $wp_error Optional. Whether to return a WP_Error on failure. Default false.
     @return int|WP_Error The attachment ID on success. The value 0 or WP_Error on failure.
    
  **/
  public function wp_insert_attachment(args:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>, file:String = cast false, parent:Int = 0, wp_error:Bool = false):haxe.extern.EitherType<Int, wp.extern.Error>;
  /**
    
     Trash or delete an attachment.
    
     When an attachment is permanently deleted, the file will also be removed.
     Deletion removes all post meta fields, taxonomy, comments, etc. associated
     with the attachment (except the main post).
    
     The attachment is moved to the trash instead of permanently deleted unless trash
     for media is disabled, item is already in the trash, or $force_delete is true.
    
     @since 2.0.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int  $post_id      Attachment ID.
     @param bool $force_delete Optional. Whether to bypass trash and force deletion.
                               Default false.
     @return WP_Post|false|null Post data on success, false or null on failure.
    
  **/
  public function wp_delete_attachment(post_id:Int, force_delete:Bool = false):haxe.extern.EitherType<wp.extern.Post, Bool>;
  /**
    
     Deletes all files that belong to the given attachment.
    
     @since 4.9.7
    
     @param int    $post_id      Attachment ID.
     @param array  $meta         The attachment's meta data.
     @param array  $backup_sizes The meta data for the attachment's backup images.
     @param string $file         Absolute path to the attachment's file.
     @return bool True on success, false on failure.
    
  **/
  public function wp_delete_attachment_files(post_id:Int, meta:php.NativeStructArray<Dynamic>, backup_sizes:php.NativeStructArray<Dynamic>, file:String):Bool;
  /**
    
     Retrieve attachment meta field for attachment ID.
    
     @since 2.1.0
    
     @param int  $attachment_id Attachment post ID. Defaults to global $post.
     @param bool $unfiltered    Optional. If true, filters are not run. Default false.
     @return mixed Attachment meta field. False on failure.
    
  **/
  public function wp_get_attachment_metadata(attachment_id:Int = 0, unfiltered:Bool = false):Dynamic;
  /**
    
     Update metadata for an attachment.
    
     @since 2.1.0
    
     @param int   $attachment_id Attachment post ID.
     @param array $data          Attachment meta data.
     @return int|bool False if $post is invalid.
    
  **/
  public function wp_update_attachment_metadata(attachment_id:Int, data:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Int, Bool>;
  /**
    
     Retrieve the URL for an attachment.
    
     @since 2.1.0
    
     @global string $pagenow
    
     @param int $attachment_id Optional. Attachment post ID. Defaults to global $post.
     @return string|false Attachment URL, otherwise false.
    
  **/
  public function wp_get_attachment_url(attachment_id:Int = 0):haxe.extern.EitherType<String, Bool>;
  /**
    
     Retrieves the caption for an attachment.
    
     @since 4.6.0
    
     @param int $post_id Optional. Attachment ID. Default is the ID of the global `$post`.
     @return string|false False on failure. Attachment caption on success.
    
  **/
  public function wp_get_attachment_caption(post_id:Int = 0):haxe.extern.EitherType<String, Bool>;
  /**
    
     Retrieve thumbnail for an attachment.
    
     @since 2.1.0
    
     @param int $post_id Optional. Attachment ID. Default 0.
     @return string|false False on failure. Thumbnail file path on success.
    
  **/
  public function wp_get_attachment_thumb_file(post_id:Int = 0):haxe.extern.EitherType<String, Bool>;
  /**
    
     Retrieve URL for an attachment thumbnail.
    
     @since 2.1.0
    
     @param int $post_id Optional. Attachment ID. Default 0.
     @return string|false False on failure. Thumbnail URL on success.
    
  **/
  public function wp_get_attachment_thumb_url(post_id:Int = 0):haxe.extern.EitherType<String, Bool>;
  /**
    
     Verifies an attachment is of a given type.
    
     @since 4.2.0
    
     @param string      $type Attachment type. Accepts 'image', 'audio', or 'video'.
     @param int|WP_Post $post Optional. Attachment ID or object. Default is global $post.
     @return bool True if one of the accepted types, false otherwise.
    
  **/
  public function wp_attachment_is(type:String, post:haxe.extern.EitherType<Int, wp.extern.Post> = null):Bool;
  /**
    
     Determines whether an attachment is an image.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 2.1.0
     @since 4.2.0 Modified into wrapper for wp_attachment_is() and
                  allowed WP_Post object to be passed.
    
     @param int|WP_Post $post Optional. Attachment ID or object. Default is global $post.
     @return bool Whether the attachment is an image.
    
  **/
  public function wp_attachment_is_image(post:haxe.extern.EitherType<Int, wp.extern.Post> = null):Bool;
  /**
    
     Retrieve the icon for a MIME type.
    
     @since 2.1.0
    
     @param string|int $mime MIME type or attachment ID.
     @return string|false Icon, false otherwise.
    
  **/
  public function wp_mime_type_icon(mime:haxe.extern.EitherType<String, Int> = 0):haxe.extern.EitherType<String, Bool>;
  /**
    
     Check for changed slugs for published post objects and save the old slug.
    
     The function is used when a post object of any type is updated,
     by comparing the current and previous post objects.
    
     If the slug was changed and not already part of the old slugs then it will be
     added to the post meta field ('_wp_old_slug') for storing old slugs for that
     post.
    
     The most logically usage of this function is redirecting changed post objects, so
     that those that linked to an changed post will be redirected to the new post.
    
     @since 2.1.0
    
     @param int     $post_id     Post ID.
     @param WP_Post $post        The Post Object
     @param WP_Post $post_before The Previous Post Object
    
  **/
  public function wp_check_for_changed_slugs(post_id:Int, post:wp.extern.Post, post_before:wp.extern.Post):Void;
  /**
    
     Check for changed dates for published post objects and save the old date.
    
     The function is used when a post object of any type is updated,
     by comparing the current and previous post objects.
    
     If the date was changed and not already part of the old dates then it will be
     added to the post meta field ('_wp_old_date') for storing old dates for that
     post.
    
     The most logically usage of this function is redirecting changed post objects, so
     that those that linked to an changed post will be redirected to the new post.
    
     @since 4.9.3
    
     @param int     $post_id     Post ID.
     @param WP_Post $post        The Post Object
     @param WP_Post $post_before The Previous Post Object
    
  **/
  public function wp_check_for_changed_dates(post_id:Int, post:wp.extern.Post, post_before:wp.extern.Post):Void;
  /**
    
     Retrieve the private post SQL based on capability.
    
     This function provides a standardized way to appropriately select on the
     post_status of a post type. The function will return a piece of SQL code
     that can be added to a WHERE clause; this SQL is constructed to allow all
     published posts, and all private posts to which the user has access.
    
     @since 2.2.0
     @since 4.3.0 Added the ability to pass an array to `$post_type`.
    
     @param string|array $post_type Single post type or an array of post types. Currently only supports 'post' or 'page'.
     @return string SQL code that can be added to a where clause.
    
  **/
  public function get_private_posts_cap_sql(post_type:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>):String;
  /**
    
     Retrieve the post SQL based on capability, author, and type.
    
     @since 3.0.0
     @since 4.3.0 Introduced the ability to pass an array of post types to `$post_type`.
    
     @see get_private_posts_cap_sql()
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param array|string   $post_type   Single post type or an array of post types.
     @param bool           $full        Optional. Returns a full WHERE statement instead of just
                                        an 'andalso' term. Default true.
     @param int            $post_author Optional. Query posts having a single author ID. Default null.
     @param bool           $public_only Optional. Only return public posts. Skips cap checks for
                                        $current_user.  Default false.
     @return string SQL WHERE code that can be added to a query.
    
  **/
  public function get_posts_by_author_sql(post_type:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String>, full:Bool = true, post_author:Int = null, public_only:Bool = false):String;
  /**
    
     Retrieve the date that the last post was published.
    
     The server timezone is the default and is the difference between GMT and
     server time. The 'blog' value is the date when the last post was posted. The
     'gmt' is when the last post was posted in GMT formatted date.
    
     @since 0.71
     @since 4.4.0 The `$post_type` argument was added.
    
     @param string $timezone  Optional. The timezone for the timestamp. Accepts 'server', 'blog', or 'gmt'.
                              'server' uses the server's internal timezone.
                              'blog' uses the `post_modified` field, which proxies to the timezone set for the site.
                              'gmt' uses the `post_modified_gmt` field.
                              Default 'server'.
     @param string $post_type Optional. The post type to check. Default 'any'.
     @return string The date of the last post.
    
  **/
  public function get_lastpostdate(timezone:String = 'server', post_type:String = 'any'):String;
  /**
    
     Get the timestamp of the last time any post was modified.
    
     The server timezone is the default and is the difference between GMT and
     server time. The 'blog' value is just when the last post was modified. The
     'gmt' is when the last post was modified in GMT time.
    
     @since 1.2.0
     @since 4.4.0 The `$post_type` argument was added.
    
     @param string $timezone  Optional. The timezone for the timestamp. See get_lastpostdate()
                              for information on accepted values.
                              Default 'server'.
     @param string $post_type Optional. The post type to check. Default 'any'.
     @return string The timestamp.
    
  **/
  public function get_lastpostmodified(timezone:String = 'server', post_type:String = 'any'):String;
  /**
    
     Get the timestamp of the last time any post was modified or published.
    
     @since 3.1.0
     @since 4.4.0 The `$post_type` argument was added.
     @access private
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string $timezone  The timezone for the timestamp. See get_lastpostdate().
                              for information on accepted values.
     @param string $field     Post field to check. Accepts 'date' or 'modified'.
     @param string $post_type Optional. The post type to check. Default 'any'.
     @return string|false The timestamp.
    
  **/
  public function _get_last_post_time(timezone:String, field:String, post_type:String = 'any'):haxe.extern.EitherType<String, Bool>;
  /**
    
     Updates posts in cache.
    
     @since 1.5.1
    
     @param array $posts Array of post objects (passed by reference).
    
  **/
  public function update_post_cache(posts:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Will clean the post in the cache.
    
     Cleaning means delete from the cache of the post. Will call to clean the term
     object cache associated with the post ID.
    
     This function not run if $_wp_suspend_cache_invalidation is not empty. See
     wp_suspend_cache_invalidation().
    
     @since 2.0.0
    
     @global bool $_wp_suspend_cache_invalidation
    
     @param int|WP_Post $post Post ID or post object to remove from the cache.
    
  **/
  public function clean_post_cache(post:haxe.extern.EitherType<Int, wp.extern.Post>):Void;
  /**
    
     Call major cache updating functions for list of Post objects.
    
     @since 1.5.0
    
     @param array  $posts             Array of Post objects
     @param string $post_type         Optional. Post type. Default 'post'.
     @param bool   $update_term_cache Optional. Whether to update the term cache. Default true.
     @param bool   $update_meta_cache Optional. Whether to update the meta cache. Default true.
    
  **/
  public function update_post_caches(posts:php.NativeStructArray<Dynamic>, post_type:String, update_term_cache:Bool, update_meta_cache:Bool):Void;
  /**
    
     Updates metadata cache for list of post IDs.
    
     Performs SQL query to retrieve the metadata for the post IDs and updates the
     metadata cache for the posts. Therefore, the functions, which call this
     function, do not need to perform SQL queries on their own.
    
     @since 2.1.0
    
     @param array $post_ids List of post IDs.
     @return array|false Returns false if there is nothing to update or an array
                         of metadata.
    
  **/
  public function update_postmeta_cache(post_ids:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Bool>;
  /**
    
     Will clean the attachment in the cache.
    
     Cleaning means delete from the cache. Optionally will clean the term
     object cache associated with the attachment ID.
    
     This function will not run if $_wp_suspend_cache_invalidation is not empty.
    
     @since 3.0.0
    
     @global bool $_wp_suspend_cache_invalidation
    
     @param int  $id          The attachment ID in the cache to clean.
     @param bool $clean_terms Optional. Whether to clean terms cache. Default false.
    
  **/
  public function clean_attachment_cache(id:Int, clean_terms:Bool = false):Void;
  /**
    
     Hook for managing future post transitions to published.
    
     @since 2.3.0
     @access private
    
     @see wp_clear_scheduled_hook()
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string  $new_status New post status.
     @param string  $old_status Previous post status.
     @param WP_Post $post       Post object.
    
  **/
  public function _transition_post_status(new_status:String, old_status:String, post:wp.extern.Post):Void;
  /**
    
     Hook used to schedule publication for a post marked for the future.
    
     The $post properties used and must exist are 'ID' and 'post_date_gmt'.
    
     @since 2.3.0
     @access private
    
     @param int     $deprecated Not used. Can be set to null. Never implemented. Not marked
                                as deprecated with _deprecated_argument() as it conflicts with
                                wp_transition_post_status() and the default filter for _future_post_hook().
     @param WP_Post $post       Post object.
    
  **/
  public function _future_post_hook(deprecated:Int, post:wp.extern.Post):Void;
  /**
    
     Hook to schedule pings and enclosures when a post is published.
    
     Uses XMLRPC_REQUEST and WP_IMPORTING constants.
    
     @since 2.3.0
     @access private
    
     @param int $post_id The ID in the database table of the post being published.
    
  **/
  public function _publish_post_hook(post_id:Int):Void;
  /**
    
     Returns the ID of the post's parent.
    
     @since 3.1.0
    
     @param int|WP_Post $post Post ID or post object. Defaults to global $post.
     @return int|false Post parent ID (which can be 0 if there is no parent), or false if the post does not exist.
    
  **/
  public function wp_get_post_parent_id(post:haxe.extern.EitherType<Int, wp.extern.Post>):haxe.extern.EitherType<Int, Bool>;
  /**
    
     Check the given subset of the post hierarchy for hierarchy loops.
    
     Prevents loops from forming and breaks those that it finds. Attached
     to the {@see 'wp_insert_post_parent'} filter.
    
     @since 3.1.0
    
     @see wp_find_hierarchy_loop()
    
     @param int $post_parent ID of the parent for the post we're checking.
     @param int $post_ID     ID of the post we're checking.
     @return int The new post_parent for the post, 0 otherwise.
    
  **/
  public function wp_check_post_hierarchy_for_loops(post_parent:Int, post_ID:Int):Int;
  /**
    
     Sets the post thumbnail (featured image) for the given post.
    
     @since 3.1.0
    
     @param int|WP_Post $post         Post ID or post object where thumbnail should be attached.
     @param int         $thumbnail_id Thumbnail to attach.
     @return int|bool True on success, false on failure.
    
  **/
  public function set_post_thumbnail(post:haxe.extern.EitherType<Int, wp.extern.Post>, thumbnail_id:Int):haxe.extern.EitherType<Int, Bool>;
  /**
    
     Removes the thumbnail (featured image) from the given post.
    
     @since 3.3.0
    
     @param int|WP_Post $post Post ID or post object from which the thumbnail should be removed.
     @return bool True on success, false on failure.
    
  **/
  public function delete_post_thumbnail(post:haxe.extern.EitherType<Int, wp.extern.Post>):Bool;
  /**
    
     Delete auto-drafts for new posts that are > 7 days old.
    
     @since 3.4.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
  **/
  public function wp_delete_auto_drafts():Void;
  /**
    
     Queues posts for lazy-loading of term meta.
    
     @since 4.5.0
    
     @param array $posts Array of WP_Post objects.
    
  **/
  public function wp_queue_posts_for_term_meta_lazyload(posts:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Update the custom taxonomies' term counts when a post's status is changed.
    
     For example, default posts term counts (for custom taxonomies) don't include
     private / draft posts.
    
     @since 3.3.0
     @access private
    
     @param string  $new_status New post status.
     @param string  $old_status Old post status.
     @param WP_Post $post       Post object.
    
  **/
  public function _update_term_count_on_transition_post_status(new_status:String, old_status:String, post:wp.extern.Post):Void;
  /**
    
     Adds any posts from the given ids to the cache that do not already exist in cache
    
     @since 3.4.0
     @access private
    
     @see update_post_caches()
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param array $ids               ID list.
     @param bool  $update_term_cache Optional. Whether to update the term cache. Default true.
     @param bool  $update_meta_cache Optional. Whether to update the meta cache. Default true.
    
  **/
  public function _prime_post_caches(ids:php.NativeStructArray<Dynamic>, update_term_cache:Bool = true, update_meta_cache:Bool = true):Void;
  /**
    
     Adds a suffix if any trashed posts have a given slug.
    
     Store its desired (i.e. current) slug so it can try to reclaim it
     if the post is untrashed.
    
     For internal use.
    
     @since 4.5.0
     @access private
    
     @param string $post_name Slug.
     @param string $post_ID   Optional. Post ID that should be ignored. Default 0.
    
  **/
  public function wp_add_trashed_suffix_to_post_name_for_trashed_posts(post_name:String, post_ID:String = cast 0):Void;
  /**
    
     Adds a trashed suffix for a given post.
    
     Store its desired (i.e. current) slug so it can try to reclaim it
     if the post is untrashed.
    
     For internal use.
    
     @since 4.5.0
     @access private
    
     @param WP_Post $post The post.
     @return string New slug for the post.
    
  **/
  public function wp_add_trashed_suffix_to_post_name_for_post(post:wp.extern.Post):String;
  /**
    
     Filter the SQL clauses of an attachment query to include filenames.
    
     @since 4.7.0
     @access private
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param array $clauses An array including WHERE, GROUP BY, JOIN, ORDER BY,
                           DISTINCT, fields (SELECT), and LIMITS clauses.
     @return array The modified clauses.
    
  **/
  public function _filter_query_attachment_filenames(clauses:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Sets the last changed time for the 'posts' cache group.
    
     @since 5.0.0
    
  **/
  public function wp_cache_set_posts_last_changed():Void;
}
