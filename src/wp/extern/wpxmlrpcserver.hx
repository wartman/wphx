package wp.extern;

@:native("wp_xmlrpc_server")
extern class wpxmlrpcserver {
  /**
    
     Methods.
    
     @var array
    
  **/
  @:native("methods") public var methods:php.NativeStructArray<Dynamic>;
  /**
    
     Blog options.
    
     @var array
    
  **/
  @:native("blog_options") public var blogOptions:php.NativeStructArray<Dynamic>;
  /**
    
     IXR_Error instance.
    
     @var IXR_Error
    
  **/
  @:native("error") public var error:IXR_Error;
  /**
    
     Registers all of the XMLRPC methods that XMLRPC server understands.
    
     Sets up server and method property. Passes XMLRPC
     methods through the {@see 'xmlrpc_methods'} filter to allow plugins to extend
     or replace XML-RPC methods.
    
     @since 1.5.0
    
  **/
  public function new():Void;
  /**
    
     Make private/protected methods readable for backward compatibility.
    
     @since 4.0.0
    
     @param string   $name      Method to call.
     @param array    $arguments Arguments to pass when calling.
     @return array|IXR_Error|false Return value of the callback, false otherwise.
    
  **/
  @:native("__call") public function __call(name:String, arguments:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, haxe.extern.EitherType<IXR_Error, Bool>>;
  /**
    
     Serves the XML-RPC request.
    
     @since 2.9.0
    
  **/
  @:native("serve_request") public function serveRequest():Void;
  /**
    
     Test XMLRPC API by saying, "Hello!" to client.
    
     @since 1.5.0
    
     @return string Hello string response.
    
  **/
  @:native("sayHello") public function sayHello():String;
  /**
    
     Test XMLRPC API by adding two numbers for client.
    
     @since 1.5.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int $number1 A number to add.
         @type int $number2 A second number to add.
     }
     @return int Sum of the two given numbers.
    
  **/
  @:native("addTwoNumbers") public function addTwoNumbers(args:php.NativeStructArray<Dynamic>):Int;
  /**
    
     Log user in.
    
     @since 2.8.0
    
     @param string $username User's username.
     @param string $password User's password.
     @return WP_User|bool WP_User object if authentication passed, false otherwise
    
  **/
  @:native("login") public function login(username:String, password:String):haxe.extern.EitherType<wp.extern.User, Bool>;
  /**
    
     Check user's credentials. Deprecated.
    
     @since 1.5.0
     @deprecated 2.8.0 Use wp_xmlrpc_server::login()
     @see wp_xmlrpc_server::login()
    
     @param string $username User's username.
     @param string $password User's password.
     @return bool Whether authentication passed.
    
  **/
  @:native("login_pass_ok") public function loginPassOk(username:String, password:String):Bool;
  /**
    
     Escape string or array of strings for database.
    
     @since 1.5.2
    
     @param string|array $data Escape single string or array of strings.
     @return string|void Returns with string is passed, alters by-reference
                         when array is passed.
    
  **/
  @:native("escape") public function escape(data:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>):String;
  /**
    
     Retrieve custom fields for post.
    
     @since 2.5.0
    
     @param int $post_id Post ID.
     @return array Custom fields, if exist.
    
  **/
  @:native("get_custom_fields") public function getCustomFields(post_id:Int):php.NativeArray;
  /**
    
     Set custom fields for post.
    
     @since 2.5.0
    
     @param int $post_id Post ID.
     @param array $fields Custom fields.
    
  **/
  @:native("set_custom_fields") public function setCustomFields(post_id:Int, fields:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Retrieve custom fields for a term.
    
     @since 4.9.0
    
     @param int $term_id Term ID.
     @return array Array of custom fields, if they exist.
    
  **/
  @:native("get_term_custom_fields") public function getTermCustomFields(term_id:Int):php.NativeArray;
  /**
    
     Set custom fields for a term.
    
     @since 4.9.0
    
     @param int $term_id Term ID.
     @param array $fields Custom fields.
    
  **/
  @:native("set_term_custom_fields") public function setTermCustomFields(term_id:Int, fields:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Set up blog options property.
    
     Passes property through {@see 'xmlrpc_blog_options'} filter.
    
     @since 2.6.0
    
  **/
  @:native("initialise_blog_option_info") public function initialiseBlogOptionInfo():Void;
  /**
    
     Retrieve the blogs of the user.
    
     @since 2.6.0
    
     @param array $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type string $username Username.
         @type string $password Password.
     }
     @return array|IXR_Error Array contains:
      - 'isAdmin'
      - 'isPrimary' - whether the blog is the user's primary blog
      - 'url'
      - 'blogid'
      - 'blogName'
      - 'xmlrpc' - url of xmlrpc endpoint
    
  **/
  @:native("wp_getUsersBlogs") public function wpGetUsersBlogs(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Create a new post for any registered post type.
    
     @since 3.4.0
    
     @link https://en.wikipedia.org/wiki/RSS_enclosure for information on RSS enclosures.
    
     @param array  $args {
         Method arguments. Note: top-level arguments must be ordered as documented.
    
         @type int    $blog_id        Blog ID (unused).
         @type string $username       Username.
         @type string $password       Password.
         @type array  $content_struct {
             Content struct for adding a new post. See wp_insert_post() for information on
             additional post fields
    
             @type string $post_type      Post type. Default 'post'.
             @type string $post_status    Post status. Default 'draft'
             @type string $post_title     Post title.
             @type int    $post_author    Post author ID.
             @type string $post_excerpt   Post excerpt.
             @type string $post_content   Post content.
             @type string $post_date_gmt  Post date in GMT.
             @type string $post_date      Post date.
             @type string $post_password  Post password (20-character limit).
             @type string $comment_status Post comment enabled status. Accepts 'open' or 'closed'.
             @type string $ping_status    Post ping status. Accepts 'open' or 'closed'.
             @type bool   $sticky         Whether the post should be sticky. Automatically false if
                                          `$post_status` is 'private'.
             @type int    $post_thumbnail ID of an image to use as the post thumbnail/featured image.
             @type array  $custom_fields  Array of meta key/value pairs to add to the post.
             @type array  $terms          Associative array with taxonomy names as keys and arrays
                                          of term IDs as values.
             @type array  $terms_names    Associative array with taxonomy names as keys and arrays
                                          of term names as values.
             @type array  $enclosure      {
                 Array of feed enclosure data to add to post meta.
    
                 @type string $url    URL for the feed enclosure.
                 @type int    $length Size in bytes of the enclosure.
                 @type string $type   Mime-type for the enclosure.
             }
         }
     }
     @return int|IXR_Error Post ID on success, IXR_Error instance otherwise.
    
  **/
  @:native("wp_newPost") public function wpNewPost(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Int, IXR_Error>;
  /**
    
     Edit a post for any registered post type.
    
     The $content_struct parameter only needs to contain fields that
     should be changed. All other fields will retain their existing values.
    
     @since 3.4.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id        Blog ID (unused).
         @type string $username       Username.
         @type string $password       Password.
         @type int    $post_id        Post ID.
         @type array  $content_struct Extra content arguments.
     }
     @return true|IXR_Error True on success, IXR_Error on failure.
    
  **/
  @:native("wp_editPost") public function wpEditPost(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Bool, IXR_Error>;
  /**
    
     Delete a post for any registered post type.
    
     @since 3.4.0
    
     @see wp_delete_post()
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id  Blog ID (unused).
         @type string $username Username.
         @type string $password Password.
         @type int    $post_id  Post ID.
     }
     @return true|IXR_Error True on success, IXR_Error instance on failure.
    
  **/
  @:native("wp_deletePost") public function wpDeletePost(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Bool, IXR_Error>;
  /**
    
     Retrieve a post.
    
     @since 3.4.0
    
     The optional $fields parameter specifies what fields will be included
     in the response array. This should be a list of field names. 'post_id' will
     always be included in the response regardless of the value of $fields.
    
     Instead of, or in addition to, individual field names, conceptual group
     names can be used to specify multiple fields. The available conceptual
     groups are 'post' (all basic fields), 'taxonomies', 'custom_fields',
     and 'enclosure'.
    
     @see get_post()
    
     @param array $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id  Blog ID (unused).
         @type string $username Username.
         @type string $password Password.
         @type int    $post_id  Post ID.
         @type array  $fields   The subset of post type fields to return.
     }
     @return array|IXR_Error Array contains (based on $fields parameter):
      - 'post_id'
      - 'post_title'
      - 'post_date'
      - 'post_date_gmt'
      - 'post_modified'
      - 'post_modified_gmt'
      - 'post_status'
      - 'post_type'
      - 'post_name'
      - 'post_author'
      - 'post_password'
      - 'post_excerpt'
      - 'post_content'
      - 'link'
      - 'comment_status'
      - 'ping_status'
      - 'sticky'
      - 'custom_fields'
      - 'terms'
      - 'categories'
      - 'tags'
      - 'enclosure'
    
  **/
  @:native("wp_getPost") public function wpGetPost(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Retrieve posts.
    
     @since 3.4.0
    
     @see wp_get_recent_posts()
     @see wp_getPost() for more on `$fields`
     @see get_posts() for more on `$filter` values
    
     @param array $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id  Blog ID (unused).
         @type string $username Username.
         @type string $password Password.
         @type array  $filter   Optional. Modifies the query used to retrieve posts. Accepts 'post_type',
                                'post_status', 'number', 'offset', 'orderby', 's', and 'order'.
                                Default empty array.
         @type array  $fields   Optional. The subset of post type fields to return in the response array.
     }
     @return array|IXR_Error Array contains a collection of posts.
    
  **/
  @:native("wp_getPosts") public function wpGetPosts(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Create a new term.
    
     @since 3.4.0
    
     @see wp_insert_term()
    
     @param array $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id        Blog ID (unused).
         @type string $username       Username.
         @type string $password       Password.
         @type array  $content_struct Content struct for adding a new term. The struct must contain
                                      the term 'name' and 'taxonomy'. Optional accepted values include
                                      'parent', 'description', and 'slug'.
     }
     @return int|IXR_Error The term ID on success, or an IXR_Error object on failure.
    
  **/
  @:native("wp_newTerm") public function wpNewTerm(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Int, IXR_Error>;
  /**
    
     Edit a term.
    
     @since 3.4.0
    
     @see wp_update_term()
    
     @param array $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id        Blog ID (unused).
         @type string $username       Username.
         @type string $password       Password.
         @type int    $term_id        Term ID.
         @type array  $content_struct Content struct for editing a term. The struct must contain the
                                      term ''taxonomy'. Optional accepted values include 'name', 'parent',
                                      'description', and 'slug'.
     }
     @return true|IXR_Error True on success, IXR_Error instance on failure.
    
  **/
  @:native("wp_editTerm") public function wpEditTerm(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Bool, IXR_Error>;
  /**
    
     Delete a term.
    
     @since 3.4.0
    
     @see wp_delete_term()
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id      Blog ID (unused).
         @type string $username     Username.
         @type string $password     Password.
         @type string $taxnomy_name Taxonomy name.
         @type int    $term_id      Term ID.
     }
     @return bool|IXR_Error True on success, IXR_Error instance on failure.
    
  **/
  @:native("wp_deleteTerm") public function wpDeleteTerm(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Bool, IXR_Error>;
  /**
    
     Retrieve a term.
    
     @since 3.4.0
    
     @see get_term()
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id  Blog ID (unused).
         @type string $username Username.
         @type string $password Password.
         @type string $taxnomy  Taxonomy name.
         @type string $term_id  Term ID.
     }
     @return array|IXR_Error IXR_Error on failure, array on success, containing:
      - 'term_id'
      - 'name'
      - 'slug'
      - 'term_group'
      - 'term_taxonomy_id'
      - 'taxonomy'
      - 'description'
      - 'parent'
      - 'count'
    
  **/
  @:native("wp_getTerm") public function wpGetTerm(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Retrieve all terms for a taxonomy.
    
     @since 3.4.0
    
     The optional $filter parameter modifies the query used to retrieve terms.
     Accepted keys are 'number', 'offset', 'orderby', 'order', 'hide_empty', and 'search'.
    
     @see get_terms()
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id  Blog ID (unused).
         @type string $username Username.
         @type string $password Password.
         @type string $taxnomy  Taxonomy name.
         @type array  $filter   Optional. Modifies the query used to retrieve posts. Accepts 'number',
                                'offset', 'orderby', 'order', 'hide_empty', and 'search'. Default empty array.
     }
     @return array|IXR_Error An associative array of terms data on success, IXR_Error instance otherwise.
    
  **/
  @:native("wp_getTerms") public function wpGetTerms(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Retrieve a taxonomy.
    
     @since 3.4.0
    
     @see get_taxonomy()
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id  Blog ID (unused).
         @type string $username Username.
         @type string $password Password.
         @type string $taxnomy  Taxonomy name.
         @type array  $fields   Optional. Array of taxonomy fields to limit to in the return.
                                Accepts 'labels', 'cap', 'menu', and 'object_type'.
                                Default empty array.
     }
     @return array|IXR_Error An array of taxonomy data on success, IXR_Error instance otherwise.
    
  **/
  @:native("wp_getTaxonomy") public function wpGetTaxonomy(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Retrieve all taxonomies.
    
     @since 3.4.0
    
     @see get_taxonomies()
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id  Blog ID (unused).
         @type string $username Username.
         @type string $password Password.
         @type array  $filter   Optional. An array of arguments for retrieving taxonomies.
         @type array  $fields   Optional. The subset of taxonomy fields to return.
     }
     @return array|IXR_Error An associative array of taxonomy data with returned fields determined
                             by `$fields`, or an IXR_Error instance on failure.
    
  **/
  @:native("wp_getTaxonomies") public function wpGetTaxonomies(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Retrieve a user.
    
     The optional $fields parameter specifies what fields will be included
     in the response array. This should be a list of field names. 'user_id' will
     always be included in the response regardless of the value of $fields.
    
     Instead of, or in addition to, individual field names, conceptual group
     names can be used to specify multiple fields. The available conceptual
     groups are 'basic' and 'all'.
    
     @uses get_userdata()
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
         @type int    $user_id
         @type array  $fields (optional)
     }
     @return array|IXR_Error Array contains (based on $fields parameter):
      - 'user_id'
      - 'username'
      - 'first_name'
      - 'last_name'
      - 'registered'
      - 'bio'
      - 'email'
      - 'nickname'
      - 'nicename'
      - 'url'
      - 'display_name'
      - 'roles'
    
  **/
  @:native("wp_getUser") public function wpGetUser(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Retrieve users.
    
     The optional $filter parameter modifies the query used to retrieve users.
     Accepted keys are 'number' (default: 50), 'offset' (default: 0), 'role',
     'who', 'orderby', and 'order'.
    
     The optional $fields parameter specifies what fields will be included
     in the response array.
    
     @uses get_users()
     @see wp_getUser() for more on $fields and return values
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
         @type array  $filter (optional)
         @type array  $fields (optional)
     }
     @return array|IXR_Error users data
    
  **/
  @:native("wp_getUsers") public function wpGetUsers(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Retrieve information about the requesting user.
    
     @uses get_userdata()
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
         @type array  $fields (optional)
     }
     @return array|IXR_Error (@see wp_getUser)
    
  **/
  @:native("wp_getProfile") public function wpGetProfile(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Edit user's profile.
    
     @uses wp_update_user()
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
         @type array  $content_struct It can optionally contain:
          - 'first_name'
          - 'last_name'
          - 'website'
          - 'display_name'
          - 'nickname'
          - 'nicename'
          - 'bio'
     }
     @return true|IXR_Error True, on success.
    
  **/
  @:native("wp_editProfile") public function wpEditProfile(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Bool, IXR_Error>;
  /**
    
     Retrieve page.
    
     @since 2.2.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type int    $page_id
         @type string $username
         @type string $password
     }
     @return array|IXR_Error
    
  **/
  @:native("wp_getPage") public function wpGetPage(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Retrieve Pages.
    
     @since 2.2.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
         @type int    $num_pages
     }
     @return array|IXR_Error
    
  **/
  @:native("wp_getPages") public function wpGetPages(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Create new page.
    
     @since 2.2.0
    
     @see wp_xmlrpc_server::mw_newPost()
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
         @type array  $content_struct
     }
     @return int|IXR_Error
    
  **/
  @:native("wp_newPage") public function wpNewPage(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Int, IXR_Error>;
  /**
    
     Delete page.
    
     @since 2.2.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
         @type int    $page_id
     }
     @return true|IXR_Error True, if success.
    
  **/
  @:native("wp_deletePage") public function wpDeletePage(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Bool, IXR_Error>;
  /**
    
     Edit page.
    
     @since 2.2.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type int    $page_id
         @type string $username
         @type string $password
         @type string $content
         @type string $publish
     }
     @return array|IXR_Error
    
  **/
  @:native("wp_editPage") public function wpEditPage(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Retrieve page list.
    
     @since 2.2.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
     }
     @return array|IXR_Error
    
  **/
  @:native("wp_getPageList") public function wpGetPageList(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Retrieve authors list.
    
     @since 2.2.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
     }
     @return array|IXR_Error
    
  **/
  @:native("wp_getAuthors") public function wpGetAuthors(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Get list of all tags
    
     @since 2.7.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
     }
     @return array|IXR_Error
    
  **/
  @:native("wp_getTags") public function wpGetTags(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Create new category.
    
     @since 2.2.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
         @type array  $category
     }
     @return int|IXR_Error Category ID.
    
  **/
  @:native("wp_newCategory") public function wpNewCategory(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Int, IXR_Error>;
  /**
    
     Remove category.
    
     @since 2.5.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
         @type int    $category_id
     }
     @return bool|IXR_Error See wp_delete_term() for return info.
    
  **/
  @:native("wp_deleteCategory") public function wpDeleteCategory(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Bool, IXR_Error>;
  /**
    
     Retrieve category list.
    
     @since 2.2.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
         @type array  $category
         @type int    $max_results
     }
     @return array|IXR_Error
    
  **/
  @:native("wp_suggestCategories") public function wpSuggestCategories(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Retrieve comment.
    
     @since 2.7.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
         @type int    $comment_id
     }
     @return array|IXR_Error
    
  **/
  @:native("wp_getComment") public function wpGetComment(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Retrieve comments.
    
     Besides the common blog_id (unused), username, and password arguments, it takes a filter
     array as last argument.
    
     Accepted 'filter' keys are 'status', 'post_id', 'offset', and 'number'.
    
     The defaults are as follows:
     - 'status' - Default is ''. Filter by status (e.g., 'approve', 'hold')
     - 'post_id' - Default is ''. The post where the comment is posted. Empty string shows all comments.
     - 'number' - Default is 10. Total number of media items to retrieve.
     - 'offset' - Default is 0. See WP_Query::query() for more.
    
     @since 2.7.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
         @type array  $struct
     }
     @return array|IXR_Error Contains a collection of comments. See wp_xmlrpc_server::wp_getComment() for a description of each item contents
    
  **/
  @:native("wp_getComments") public function wpGetComments(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Delete a comment.
    
     By default, the comment will be moved to the trash instead of deleted.
     See wp_delete_comment() for more information on this behavior.
    
     @since 2.7.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
         @type int    $comment_ID
     }
     @return bool|IXR_Error See wp_delete_comment().
    
  **/
  @:native("wp_deleteComment") public function wpDeleteComment(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Bool, IXR_Error>;
  /**
    
     Edit comment.
    
     Besides the common blog_id (unused), username, and password arguments, it takes a
     comment_id integer and a content_struct array as last argument.
    
     The allowed keys in the content_struct array are:
      - 'author'
      - 'author_url'
      - 'author_email'
      - 'content'
      - 'date_created_gmt'
      - 'status'. Common statuses are 'approve', 'hold', 'spam'. See get_comment_statuses() for more details
    
     @since 2.7.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
         @type int    $comment_ID
         @type array  $content_struct
     }
     @return true|IXR_Error True, on success.
    
  **/
  @:native("wp_editComment") public function wpEditComment(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Bool, IXR_Error>;
  /**
    
     Create new comment.
    
     @since 2.7.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int        $blog_id (unused)
         @type string     $username
         @type string     $password
         @type string|int $post
         @type array      $content_struct
     }
     @return int|IXR_Error See wp_new_comment().
    
  **/
  @:native("wp_newComment") public function wpNewComment(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Int, IXR_Error>;
  /**
    
     Retrieve all of the comment status.
    
     @since 2.7.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
     }
     @return array|IXR_Error
    
  **/
  @:native("wp_getCommentStatusList") public function wpGetCommentStatusList(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Retrieve comment count.
    
     @since 2.5.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
         @type int    $post_id
     }
     @return array|IXR_Error
    
  **/
  @:native("wp_getCommentCount") public function wpGetCommentCount(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Retrieve post statuses.
    
     @since 2.5.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
     }
     @return array|IXR_Error
    
  **/
  @:native("wp_getPostStatusList") public function wpGetPostStatusList(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Retrieve page statuses.
    
     @since 2.5.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
     }
     @return array|IXR_Error
    
  **/
  @:native("wp_getPageStatusList") public function wpGetPageStatusList(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Retrieve page templates.
    
     @since 2.6.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
     }
     @return array|IXR_Error
    
  **/
  @:native("wp_getPageTemplates") public function wpGetPageTemplates(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Retrieve blog options.
    
     @since 2.6.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
         @type array  $options
     }
     @return array|IXR_Error
    
  **/
  @:native("wp_getOptions") public function wpGetOptions(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Retrieve blog options value from list.
    
     @since 2.6.0
    
     @param array $options Options to retrieve.
     @return array
    
  **/
  @:native("_getOptions") public function _getOptions(options:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Update blog options.
    
     @since 2.6.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
         @type array  $options
     }
     @return array|IXR_Error
    
  **/
  @:native("wp_setOptions") public function wpSetOptions(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Retrieve a media item by ID
    
     @since 3.1.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
         @type int    $attachment_id
     }
     @return array|IXR_Error Associative array contains:
      - 'date_created_gmt'
      - 'parent'
      - 'link'
      - 'thumbnail'
      - 'title'
      - 'caption'
      - 'description'
      - 'metadata'
    
  **/
  @:native("wp_getMediaItem") public function wpGetMediaItem(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Retrieves a collection of media library items (or attachments)
    
     Besides the common blog_id (unused), username, and password arguments, it takes a filter
     array as last argument.
    
     Accepted 'filter' keys are 'parent_id', 'mime_type', 'offset', and 'number'.
    
     The defaults are as follows:
     - 'number' - Default is 5. Total number of media items to retrieve.
     - 'offset' - Default is 0. See WP_Query::query() for more.
     - 'parent_id' - Default is ''. The post where the media item is attached. Empty string shows all media items. 0 shows unattached media items.
     - 'mime_type' - Default is ''. Filter by mime type (e.g., 'image/jpeg', 'application/pdf')
    
     @since 3.1.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
         @type array  $struct
     }
     @return array|IXR_Error Contains a collection of media items. See wp_xmlrpc_server::wp_getMediaItem() for a description of each item contents
    
  **/
  @:native("wp_getMediaLibrary") public function wpGetMediaLibrary(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Retrieves a list of post formats used by the site.
    
     @since 3.1.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
     }
     @return array|IXR_Error List of post formats, otherwise IXR_Error object.
    
  **/
  @:native("wp_getPostFormats") public function wpGetPostFormats(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Retrieves a post type
    
     @since 3.4.0
    
     @see get_post_type_object()
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
         @type string $post_type_name
         @type array  $fields (optional)
     }
     @return array|IXR_Error Array contains:
      - 'labels'
      - 'description'
      - 'capability_type'
      - 'cap'
      - 'map_meta_cap'
      - 'hierarchical'
      - 'menu_position'
      - 'taxonomies'
      - 'supports'
    
  **/
  @:native("wp_getPostType") public function wpGetPostType(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Retrieves a post types
    
     @since 3.4.0
    
     @see get_post_types()
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
         @type array  $filter (optional)
         @type array  $fields (optional)
     }
     @return array|IXR_Error
    
  **/
  @:native("wp_getPostTypes") public function wpGetPostTypes(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Retrieve revisions for a specific post.
    
     @since 3.5.0
    
     The optional $fields parameter specifies what fields will be included
     in the response array.
    
     @uses wp_get_post_revisions()
     @see wp_getPost() for more on $fields
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
         @type int    $post_id
         @type array  $fields (optional)
     }
     @return array|IXR_Error contains a collection of posts.
    
  **/
  @:native("wp_getRevisions") public function wpGetRevisions(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Restore a post revision
    
     @since 3.5.0
    
     @uses wp_restore_post_revision()
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
         @type int    $revision_id
     }
     @return bool|IXR_Error false if there was an error restoring, true if success.
    
  **/
  @:native("wp_restoreRevision") public function wpRestoreRevision(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Bool, IXR_Error>;
  /**
    
     Retrieve blogs that user owns.
    
     Will make more sense once we support multiple blogs.
    
     @since 1.5.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
     }
     @return array|IXR_Error
    
  **/
  @:native("blogger_getUsersBlogs") public function bloggerGetUsersBlogs(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Retrieve user's data.
    
     Gives your client some info about you, so you don't have to.
    
     @since 1.5.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
     }
     @return array|IXR_Error
    
  **/
  @:native("blogger_getUserInfo") public function bloggerGetUserInfo(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Retrieve post.
    
     @since 1.5.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type int    $post_ID
         @type string $username
         @type string $password
     }
     @return array|IXR_Error
    
  **/
  @:native("blogger_getPost") public function bloggerGetPost(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Retrieve list of recent posts.
    
     @since 1.5.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type string $appkey (unused)
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
         @type int    $numberposts (optional)
     }
     @return array|IXR_Error
    
  **/
  @:native("blogger_getRecentPosts") public function bloggerGetRecentPosts(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Deprecated.
    
     @since 1.5.0
     @deprecated 3.5.0
    
     @param array $args Unused.
     @return IXR_Error Error object.
    
  **/
  @:native("blogger_getTemplate") public function bloggerGetTemplate(args:php.NativeStructArray<Dynamic>):IXR_Error;
  /**
    
     Deprecated.
    
     @since 1.5.0
     @deprecated 3.5.0
    
     @param array $args Unused.
     @return IXR_Error Error object.
    
  **/
  @:native("blogger_setTemplate") public function bloggerSetTemplate(args:php.NativeStructArray<Dynamic>):IXR_Error;
  /**
    
     Creates new post.
    
     @since 1.5.0
    
     @param array $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type string $appkey (unused)
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
         @type string $content
         @type string $publish
     }
     @return int|IXR_Error
    
  **/
  @:native("blogger_newPost") public function bloggerNewPost(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Int, IXR_Error>;
  /**
    
     Edit a post.
    
     @since 1.5.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type int    $post_ID
         @type string $username
         @type string $password
         @type string $content
         @type bool   $publish
     }
     @return true|IXR_Error true when done.
    
  **/
  @:native("blogger_editPost") public function bloggerEditPost(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Bool, IXR_Error>;
  /**
    
     Remove a post.
    
     @since 1.5.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type int    $post_ID
         @type string $username
         @type string $password
     }
     @return true|IXR_Error True when post is deleted.
    
  **/
  @:native("blogger_deletePost") public function bloggerDeletePost(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Bool, IXR_Error>;
  /**
    
     Create a new post.
    
     The 'content_struct' argument must contain:
      - title
      - description
      - mt_excerpt
      - mt_text_more
      - mt_keywords
      - mt_tb_ping_urls
      - categories
    
     Also, it can optionally contain:
      - wp_slug
      - wp_password
      - wp_page_parent_id
      - wp_page_order
      - wp_author_id
      - post_status | page_status - can be 'draft', 'private', 'publish', or 'pending'
      - mt_allow_comments - can be 'open' or 'closed'
      - mt_allow_pings - can be 'open' or 'closed'
      - date_created_gmt
      - dateCreated
      - wp_post_thumbnail
    
     @since 1.5.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
         @type array  $content_struct
         @type int    $publish
     }
     @return int|IXR_Error
    
  **/
  @:native("mw_newPost") public function mwNewPost(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Int, IXR_Error>;
  /**
    
     Adds an enclosure to a post if it's new.
    
     @since 2.8.0
    
     @param integer $post_ID   Post ID.
     @param array   $enclosure Enclosure data.
    
  **/
  @:native("add_enclosure_if_new") public function addEnclosureIfNew(post_ID:Int, enclosure:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Attach upload to a post.
    
     @since 2.1.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int $post_ID Post ID.
     @param string $post_content Post Content for attachment.
    
  **/
  @:native("attach_uploads") public function attachUploads(post_ID:Int, post_content:String):Void;
  /**
    
     Edit a post.
    
     @since 1.5.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
         @type array  $content_struct
         @type int    $publish
     }
     @return bool|IXR_Error True on success.
    
  **/
  @:native("mw_editPost") public function mwEditPost(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Bool, IXR_Error>;
  /**
    
     Retrieve post.
    
     @since 1.5.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type int    $post_ID
         @type string $username
         @type string $password
     }
     @return array|IXR_Error
    
  **/
  @:native("mw_getPost") public function mwGetPost(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Retrieve list of recent posts.
    
     @since 1.5.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
         @type int    $numberposts
     }
     @return array|IXR_Error
    
  **/
  @:native("mw_getRecentPosts") public function mwGetRecentPosts(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Retrieve the list of categories on a given blog.
    
     @since 1.5.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
     }
     @return array|IXR_Error
    
  **/
  @:native("mw_getCategories") public function mwGetCategories(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Uploads a file, following your settings.
    
     Adapted from a patch by Johann Richard.
    
     @link http://mycvs.org/archives/2004/06/30/file-upload-to-wordpress-in-ecto/
    
     @since 1.5.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
         @type array  $data
     }
     @return array|IXR_Error
    
  **/
  @:native("mw_newMediaObject") public function mwNewMediaObject(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Retrieve the post titles of recent posts.
    
     @since 1.5.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
         @type int    $numberposts
     }
     @return array|IXR_Error
    
  **/
  @:native("mt_getRecentPostTitles") public function mtGetRecentPostTitles(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Retrieve list of all categories on blog.
    
     @since 1.5.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $blog_id (unused)
         @type string $username
         @type string $password
     }
     @return array|IXR_Error
    
  **/
  @:native("mt_getCategoryList") public function mtGetCategoryList(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Retrieve post categories.
    
     @since 1.5.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $post_ID
         @type string $username
         @type string $password
     }
     @return array|IXR_Error
    
  **/
  @:native("mt_getPostCategories") public function mtGetPostCategories(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Sets categories for a post.
    
     @since 1.5.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $post_ID
         @type string $username
         @type string $password
         @type array  $categories
     }
     @return true|IXR_Error True on success.
    
  **/
  @:native("mt_setPostCategories") public function mtSetPostCategories(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Bool, IXR_Error>;
  /**
    
     Retrieve an array of methods supported by this server.
    
     @since 1.5.0
    
     @return array
    
  **/
  @:native("mt_supportedMethods") public function mtSupportedMethods():php.NativeArray;
  /**
    
     Retrieve an empty array because we don't support per-post text filters.
    
     @since 1.5.0
    
  **/
  @:native("mt_supportedTextFilters") public function mtSupportedTextFilters():Void;
  /**
    
     Retrieve trackbacks sent to a given post.
    
     @since 1.5.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int $post_ID
     @return array|IXR_Error
    
  **/
  @:native("mt_getTrackbackPings") public function mtGetTrackbackPings(post_ID:Int):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
  /**
    
     Sets a post's publish status to 'publish'.
    
     @since 1.5.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type int    $post_ID
         @type string $username
         @type string $password
     }
     @return int|IXR_Error
    
  **/
  @:native("mt_publishPost") public function mtPublishPost(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Int, IXR_Error>;
  /**
    
     Retrieves a pingback and registers it.
    
     @since 1.5.0
    
     @param array  $args {
         Method arguments. Note: arguments must be ordered as documented.
    
         @type string $pagelinkedfrom
         @type string $pagelinkedto
     }
     @return string|IXR_Error
    
  **/
  @:native("pingback_ping") public function pingbackPing(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<String, IXR_Error>;
  /**
    
     Retrieve array of URLs that pingbacked the given URL.
    
     Specs on http://www.aquarionics.com/misc/archives/blogite/0198.html
    
     @since 1.5.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string $url
     @return array|IXR_Error
    
  **/
  @:native("pingback_extensions_getPingbacks") public function pingbackExtensionsGetPingbacks(url:String):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, IXR_Error>;
}
