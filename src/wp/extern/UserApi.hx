package wp.extern;

extern class UserApi implements wp.util.ApiFunctions {
  /**
    
     Authenticates and logs a user in with 'remember' capability.
    
     The credentials is an array that has 'user_login', 'user_password', and
     'remember' indices. If the credentials is not given, then the log in form
     will be assumed and used if set.
    
     The various authentication cookies will be set by this function and will be
     set for a longer period depending on if the 'remember' credential is set to
     true.
    
     Note: wp_signon() doesn't handle setting the current user. This means that if the
     function is called before the {@see 'init'} hook is fired, is_user_logged_in() will
     evaluate as false until that point. If is_user_logged_in() is needed in conjunction
     with wp_signon(), wp_set_current_user() should be called explicitly.
    
     @since 2.5.0
    
     @global string $auth_secure_cookie
    
     @param array       $credentials   Optional. User info in order to sign on.
     @param string|bool $secure_cookie Optional. Whether to use secure cookie.
     @return WP_User|WP_Error WP_User on success, WP_Error on failure.
    
  **/
  public function wp_signon(?credentials:php.NativeStructArray<Dynamic>, secure_cookie:haxe.extern.EitherType<String, Bool> = ''):haxe.extern.EitherType<wp.extern.User, wp.extern.Error>;
  /**
    
     Authenticate a user, confirming the username and password are valid.
    
     @since 2.8.0
    
     @param WP_User|WP_Error|null $user     WP_User or WP_Error object from a previous callback. Default null.
     @param string                $username Username for authentication.
     @param string                $password Password for authentication.
     @return WP_User|WP_Error WP_User on success, WP_Error on failure.
    
  **/
  public function wp_authenticate_username_password(user:haxe.extern.EitherType<wp.extern.User, wp.extern.Error>, username:String, password:String):haxe.extern.EitherType<wp.extern.User, wp.extern.Error>;
  /**
    
     Authenticates a user using the email and password.
    
     @since 4.5.0
    
     @param WP_User|WP_Error|null $user     WP_User or WP_Error object if a previous
                                            callback failed authentication.
     @param string                $email    Email address for authentication.
     @param string                $password Password for authentication.
     @return WP_User|WP_Error WP_User on success, WP_Error on failure.
    
  **/
  public function wp_authenticate_email_password(user:haxe.extern.EitherType<wp.extern.User, wp.extern.Error>, email:String, password:String):haxe.extern.EitherType<wp.extern.User, wp.extern.Error>;
  /**
    
     Authenticate the user using the WordPress auth cookie.
    
     @since 2.8.0
    
     @global string $auth_secure_cookie
    
     @param WP_User|WP_Error|null $user     WP_User or WP_Error object from a previous callback. Default null.
     @param string                $username Username. If not empty, cancels the cookie authentication.
     @param string                $password Password. If not empty, cancels the cookie authentication.
     @return WP_User|WP_Error WP_User on success, WP_Error on failure.
    
  **/
  public function wp_authenticate_cookie(user:haxe.extern.EitherType<wp.extern.User, wp.extern.Error>, username:String, password:String):haxe.extern.EitherType<wp.extern.User, wp.extern.Error>;
  /**
    
     For Multisite blogs, check if the authenticated user has been marked as a
     spammer, or if the user's primary blog has been marked as spam.
    
     @since 3.7.0
    
     @param WP_User|WP_Error|null $user WP_User or WP_Error object from a previous callback. Default null.
     @return WP_User|WP_Error WP_User on success, WP_Error if the user is considered a spammer.
    
  **/
  public function wp_authenticate_spam_check(user:haxe.extern.EitherType<wp.extern.User, wp.extern.Error>):haxe.extern.EitherType<wp.extern.User, wp.extern.Error>;
  /**
    
     Validates the logged-in cookie.
    
     Checks the logged-in cookie if the previous auth cookie could not be
     validated and parsed.
    
     This is a callback for the {@see 'determine_current_user'} filter, rather than API.
    
     @since 3.9.0
    
     @param int|bool $user_id The user ID (or false) as received from the
                           determine_current_user filter.
     @return int|false User ID if validated, false otherwise. If a user ID from
                       an earlier filter callback is received, that value is returned.
    
  **/
  public function wp_validate_logged_in_cookie(user_id:haxe.extern.EitherType<Int, Bool>):haxe.extern.EitherType<Int, Bool>;
  /**
    
     Number of posts user has written.
    
     @since 3.0.0
     @since 4.1.0 Added `$post_type` argument.
     @since 4.3.0 Added `$public_only` argument. Added the ability to pass an array
                  of post types to `$post_type`.
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int          $userid      User ID.
     @param array|string $post_type   Optional. Single post type or array of post types to count the number of posts for. Default 'post'.
     @param bool         $public_only Optional. Whether to only return counts for public posts. Default false.
     @return string Number of posts the user has written in this post type.
    
  **/
  public function count_user_posts(userid:Int, post_type:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String> = 'post', public_only:Bool = false):String;
  /**
    
     Number of posts written by a list of users.
    
     @since 3.0.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param array        $users       Array of user IDs.
     @param string|array $post_type   Optional. Single post type or array of post types to check. Defaults to 'post'.
     @param bool         $public_only Optional. Only return counts for public posts.  Defaults to false.
     @return array Amount of posts each user has written.
    
  **/
  public function count_many_users_posts(users:php.NativeStructArray<Dynamic>, post_type:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = 'post', public_only:Bool = false):php.NativeArray;
  /**
    
     Get the current user's ID
    
     @since MU (3.0.0)
    
     @return int The current user's ID, or 0 if no user is logged in.
    
  **/
  public function get_current_user_id():Int;
  /**
    
     Retrieve user option that can be either per Site or per Network.
    
     If the user ID is not given, then the current user will be used instead. If
     the user ID is given, then the user data will be retrieved. The filter for
     the result, will also pass the original option name and finally the user data
     object as the third parameter.
    
     The option will first check for the per site name and then the per Network name.
    
     @since 2.0.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string $option     User option name.
     @param int    $user       Optional. User ID.
     @param string $deprecated Use get_option() to check for an option in the options table.
     @return mixed User option value on success, false on failure.
    
  **/
  public function get_user_option(option:String, user:Int = 0, deprecated:String = ''):Dynamic;
  /**
    
     Update user option with global blog capability.
    
     User options are just like user metadata except that they have support for
     global blog options. If the 'global' parameter is false, which it is by default
     it will prepend the WordPress table prefix to the option name.
    
     Deletes the user option if $newvalue is empty.
    
     @since 2.0.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int    $user_id     User ID.
     @param string $option_name User option name.
     @param mixed  $newvalue    User option value.
     @param bool   $global      Optional. Whether option name is global or blog specific.
                                Default false (blog specific).
     @return int|bool User meta ID if the option didn't exist, true on successful update,
                      false on failure.
    
  **/
  public function update_user_option(user_id:Int, option_name:String, newvalue:Dynamic, global:Bool = false):haxe.extern.EitherType<Int, Bool>;
  /**
    
     Delete user option with global blog capability.
    
     User options are just like user metadata except that they have support for
     global blog options. If the 'global' parameter is false, which it is by default
     it will prepend the WordPress table prefix to the option name.
    
     @since 3.0.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int    $user_id     User ID
     @param string $option_name User option name.
     @param bool   $global      Optional. Whether option name is global or blog specific.
                                Default false (blog specific).
     @return bool True on success, false on failure.
    
  **/
  public function delete_user_option(user_id:Int, option_name:String, global:Bool = false):Bool;
  /**
    
     Retrieve list of users matching criteria.
    
     @since 3.1.0
    
     @see WP_User_Query
    
     @param array $args Optional. Arguments to retrieve users. See WP_User_Query::prepare_query().
                        for more information on accepted arguments.
     @return array List of users.
    
  **/
  public function get_users(?args:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Get the sites a user belongs to.
    
     @since 3.0.0
     @since 4.7.0 Converted to use `get_sites()`.
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int  $user_id User ID
     @param bool $all     Whether to retrieve all sites, or only sites that are not
                          marked as deleted, archived, or spam.
     @return array A list of the user's sites. An empty array if the user doesn't exist
                   or belongs to no sites.
    
  **/
  public function get_blogs_of_user(user_id:Int, all:Bool = false):php.NativeArray;
  /**
    
     Find out whether a user is a member of a given blog.
    
     @since MU (3.0.0)
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int $user_id Optional. The unique ID of the user. Defaults to the current user.
     @param int $blog_id Optional. ID of the blog to check. Defaults to the current site.
     @return bool
    
  **/
  public function is_user_member_of_blog(user_id:Int = 0, blog_id:Int = 0):Bool;
  /**
    
     Adds meta data to a user.
    
     @since 3.0.0
    
     @param int    $user_id    User ID.
     @param string $meta_key   Metadata name.
     @param mixed  $meta_value Metadata value.
     @param bool   $unique     Optional. Whether the same key should not be added. Default false.
     @return int|false Meta ID on success, false on failure.
    
  **/
  public function add_user_meta(user_id:Int, meta_key:String, meta_value:Dynamic, unique:Bool = false):haxe.extern.EitherType<Int, Bool>;
  /**
    
     Remove metadata matching criteria from a user.
    
     You can match based on the key, or key and value. Removing based on key and
     value, will keep from removing duplicate metadata with the same key. It also
     allows removing all metadata matching key, if needed.
    
     @since 3.0.0
     @link https://codex.wordpress.org/Function_Reference/delete_user_meta
    
     @param int    $user_id    User ID
     @param string $meta_key   Metadata name.
     @param mixed  $meta_value Optional. Metadata value.
     @return bool True on success, false on failure.
    
  **/
  public function delete_user_meta(user_id:Int, meta_key:String, meta_value:Dynamic = ''):Bool;
  /**
    
     Retrieve user meta field for a user.
    
     @since 3.0.0
     @link https://codex.wordpress.org/Function_Reference/get_user_meta
    
     @param int    $user_id User ID.
     @param string $key     Optional. The meta key to retrieve. By default, returns data for all keys.
     @param bool   $single  Whether to return a single value.
     @return mixed Will be an array if $single is false. Will be value of meta data field if $single is true.
    
  **/
  public function get_user_meta(user_id:Int, key:String = '', single:Bool = false):Dynamic;
  /**
    
     Update user meta field based on user ID.
    
     Use the $prev_value parameter to differentiate between meta fields with the
     same key and user ID.
    
     If the meta field for the user does not exist, it will be added.
    
     @since 3.0.0
     @link https://codex.wordpress.org/Function_Reference/update_user_meta
    
     @param int    $user_id    User ID.
     @param string $meta_key   Metadata key.
     @param mixed  $meta_value Metadata value.
     @param mixed  $prev_value Optional. Previous value to check before removing.
     @return int|bool Meta ID if the key didn't exist, true on successful update, false on failure.
    
  **/
  public function update_user_meta(user_id:Int, meta_key:String, meta_value:Dynamic, prev_value:Dynamic = ''):haxe.extern.EitherType<Int, Bool>;
  /**
    
     Count number of users who have each of the user roles.
    
     Assumes there are neither duplicated nor orphaned capabilities meta_values.
     Assumes role names are unique phrases. Same assumption made by WP_User_Query::prepare_query()
     Using $strategy = 'time' this is CPU-intensive and should handle around 10^7 users.
     Using $strategy = 'memory' this is memory-intensive and should handle around 10^5 users, but see WP Bug #12257.
    
     @since 3.0.0
     @since 4.4.0 The number of users with no role is now included in the `none` element.
     @since 4.9.0 The `$site_id` parameter was added to support multisite.
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string   $strategy Optional. The computational strategy to use when counting the users.
                               Accepts either 'time' or 'memory'. Default 'time'.
     @param int|null $site_id  Optional. The site ID to count users for. Defaults to the current site.
     @return array Includes a grand total and an array of counts indexed by role strings.
    
  **/
  public function count_users(strategy:String = 'time', site_id:Int = null):php.NativeArray;
  /**
    
     Set up global user vars.
    
     Used by wp_set_current_user() for back compat. Might be deprecated in the future.
    
     @since 2.0.4
    
     @global string  $user_login    The user username for logging in
     @global WP_User $userdata      User data.
     @global int     $user_level    The level of the user
     @global int     $user_ID       The ID of the user
     @global string  $user_email    The email address of the user
     @global string  $user_url      The url in the user's profile
     @global string  $user_identity The display name of the user
    
     @param int $for_user_id Optional. User ID to set up global data. Default 0.
    
  **/
  public function setup_userdata(for_user_id:Int = 0):Void;
  /**
    
     Create dropdown HTML content of users.
    
     The content can either be displayed, which it is by default or retrieved by
     setting the 'echo' argument. The 'include' and 'exclude' arguments do not
     need to be used; all users will be displayed in that case. Only one can be
     used, either 'include' or 'exclude', but not both.
    
     The available arguments are as follows:
    
     @since 2.3.0
     @since 4.5.0 Added the 'display_name_with_login' value for 'show'.
     @since 4.7.0 Added the `$role`, `$role__in`, and `$role__not_in` parameters.
    
     @param array|string $args {
         Optional. Array or string of arguments to generate a drop-down of users.
         See WP_User_Query::prepare_query() for additional available arguments.
    
         @type string       $show_option_all         Text to show as the drop-down default (all).
                                                     Default empty.
         @type string       $show_option_none        Text to show as the drop-down default when no
                                                     users were found. Default empty.
         @type int|string   $option_none_value       Value to use for $show_option_non when no users
                                                     were found. Default -1.
         @type string       $hide_if_only_one_author Whether to skip generating the drop-down
                                                     if only one user was found. Default empty.
         @type string       $orderby                 Field to order found users by. Accepts user fields.
                                                     Default 'display_name'.
         @type string       $order                   Whether to order users in ascending or descending
                                                     order. Accepts 'ASC' (ascending) or 'DESC' (descending).
                                                     Default 'ASC'.
         @type array|string $include                 Array or comma-separated list of user IDs to include.
                                                     Default empty.
         @type array|string $exclude                 Array or comma-separated list of user IDs to exclude.
                                                     Default empty.
         @type bool|int     $multi                   Whether to skip the ID attribute on the 'select' element.
                                                     Accepts 1|true or 0|false. Default 0|false.
         @type string       $show                    User data to display. If the selected item is empty
                                                     then the 'user_login' will be displayed in parentheses.
                                                     Accepts any user field, or 'display_name_with_login' to show
                                                     the display name with user_login in parentheses.
                                                     Default 'display_name'.
         @type int|bool     $echo                    Whether to echo or return the drop-down. Accepts 1|true (echo)
                                                     or 0|false (return). Default 1|true.
         @type int          $selected                Which user ID should be selected. Default 0.
         @type bool         $include_selected        Whether to always include the selected user ID in the drop-
                                                     down. Default false.
         @type string       $name                    Name attribute of select element. Default 'user'.
         @type string       $id                      ID attribute of the select element. Default is the value of $name.
         @type string       $class                   Class attribute of the select element. Default empty.
         @type int          $blog_id                 ID of blog (Multisite only). Default is ID of the current blog.
         @type string       $who                     Which type of users to query. Accepts only an empty string or
                                                     'authors'. Default empty.
         @type string|array $role                    An array or a comma-separated list of role names that users must
                                                     match to be included in results. Note that this is an inclusive
                                                     list: users must match *each* role. Default empty.
         @type array        $role__in                An array of role names. Matched users must have at least one of
                                                     these roles. Default empty array.
         @type array        $role__not_in            An array of role names to exclude. Users matching one or more of
                                                     these roles will not be included in results. Default empty array.
     }
     @return string String of HTML content.
    
  **/
  public function wp_dropdown_users(args:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String> = ''):String;
  /**
    
     Sanitize user field based on context.
    
     Possible context values are:  'raw', 'edit', 'db', 'display', 'attribute' and 'js'. The
     'display' context is used by default. 'attribute' and 'js' contexts are treated like 'display'
     when calling filters.
    
     @since 2.3.0
    
     @param string $field   The user Object field name.
     @param mixed  $value   The user Object value.
     @param int    $user_id User ID.
     @param string $context How to sanitize user fields. Looks for 'raw', 'edit', 'db', 'display',
                            'attribute' and 'js'.
     @return mixed Sanitized value.
    
  **/
  public function sanitize_user_field(field:String, value:Dynamic, user_id:Int, context:String):Dynamic;
  /**
    
     Update all user caches
    
     @since 3.0.0
    
     @param WP_User $user User object to be cached
     @return bool|null Returns false on failure.
    
  **/
  public function update_user_caches(user:wp.extern.User):Bool;
  /**
    
     Clean all user caches
    
     @since 3.0.0
     @since 4.4.0 'clean_user_cache' action was added.
    
     @param WP_User|int $user User object or ID to be cleaned from the cache
    
  **/
  public function clean_user_cache(user:haxe.extern.EitherType<wp.extern.User, Int>):Void;
  /**
    
     Determines whether the given username exists.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 2.0.0
    
     @param string $username Username.
     @return int|false The user's ID on success, and false on failure.
    
  **/
  public function username_exists(username:String):haxe.extern.EitherType<Int, Bool>;
  /**
    
     Determines whether the given email exists.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 2.1.0
    
     @param string $email Email.
     @return int|false The user's ID on success, and false on failure.
    
  **/
  public function email_exists(email:String):haxe.extern.EitherType<Int, Bool>;
  /**
    
     Checks whether a username is valid.
    
     @since 2.0.1
     @since 4.4.0 Empty sanitized usernames are now considered invalid
    
     @param string $username Username.
     @return bool Whether username given is valid
    
  **/
  public function validate_username(username:String):Bool;
  /**
    
     Insert a user into the database.
    
     Most of the `$userdata` array fields have filters associated with the values. Exceptions are
     'ID', 'rich_editing', 'syntax_highlighting', 'comment_shortcuts', 'admin_color', 'use_ssl',
     'user_registered', and 'role'. The filters have the prefix 'pre_user_' followed by the field
     name. An example using 'description' would have the filter called, 'pre_user_description' that
     can be hooked into.
    
     @since 2.0.0
     @since 3.6.0 The `aim`, `jabber`, and `yim` fields were removed as default user contact
                  methods for new installations. See wp_get_user_contact_methods().
     @since 4.7.0 The user's locale can be passed to `$userdata`.
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param array|object|WP_User $userdata {
         An array, object, or WP_User object of user data arguments.
    
         @type int         $ID                   User ID. If supplied, the user will be updated.
         @type string      $user_pass            The plain-text user password.
         @type string      $user_login           The user's login username.
         @type string      $user_nicename        The URL-friendly user name.
         @type string      $user_url             The user URL.
         @type string      $user_email           The user email address.
         @type string      $display_name         The user's display name.
                                                 Default is the user's username.
         @type string      $nickname             The user's nickname.
                                                 Default is the user's username.
         @type string      $first_name           The user's first name. For new users, will be used
                                                 to build the first part of the user's display name
                                                 if `$display_name` is not specified.
         @type string      $last_name            The user's last name. For new users, will be used
                                                 to build the second part of the user's display name
                                                 if `$display_name` is not specified.
         @type string      $description          The user's biographical description.
         @type string|bool $rich_editing         Whether to enable the rich-editor for the user.
                                                 False if not empty.
         @type string|bool $syntax_highlighting  Whether to enable the rich code editor for the user.
                                                 False if not empty.
         @type string|bool $comment_shortcuts    Whether to enable comment moderation keyboard
                                                 shortcuts for the user. Default false.
         @type string      $admin_color          Admin color scheme for the user. Default 'fresh'.
         @type bool        $use_ssl              Whether the user should always access the admin over
                                                 https. Default false.
         @type string      $user_registered      Date the user registered. Format is 'Y-m-d H:i:s'.
         @type string|bool $show_admin_bar_front Whether to display the Admin Bar for the user on the
                                                 site's front end. Default true.
         @type string      $role                 User's role.
         @type string      $locale               User's locale. Default empty.
     }
     @return int|WP_Error The newly created user's ID or a WP_Error object if the user could not
                          be created.
    
  **/
  public function wp_insert_user(userdata:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, haxe.extern.EitherType<Dynamic, wp.extern.User>>):haxe.extern.EitherType<Int, wp.extern.Error>;
  /**
    
     Update a user in the database.
    
     It is possible to update a user's password by specifying the 'user_pass'
     value in the $userdata parameter array.
    
     If current user's password is being updated, then the cookies will be
     cleared.
    
     @since 2.0.0
    
     @see wp_insert_user() For what fields can be set in $userdata.
    
     @param array|object|WP_User $userdata An array of user data or a user object of type stdClass or WP_User.
     @return int|WP_Error The updated user's ID or a WP_Error object if the user could not be updated.
    
  **/
  public function wp_update_user(userdata:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, haxe.extern.EitherType<Dynamic, wp.extern.User>>):haxe.extern.EitherType<Int, wp.extern.Error>;
  /**
    
     A simpler way of inserting a user into the database.
    
     Creates a new user with just the username, password, and email. For more
     complex user creation use wp_insert_user() to specify more information.
    
     @since 2.0.0
     @see wp_insert_user() More complete way to create a new user
    
     @param string $username The user's username.
     @param string $password The user's password.
     @param string $email    Optional. The user's email. Default empty.
     @return int|WP_Error The newly created user's ID or a WP_Error object if the user could not
                          be created.
    
  **/
  public function wp_create_user(username:String, password:String, email:String = ''):haxe.extern.EitherType<Int, wp.extern.Error>;
  /**
    
     Returns a list of meta keys to be (maybe) populated in wp_update_user().
    
     The list of keys returned via this function are dependent on the presence
     of those keys in the user meta data to be set.
    
     @since 3.3.0
     @access private
    
     @param WP_User $user WP_User instance.
     @return array List of user keys to be populated in wp_update_user().
    
  **/
  public function _get_additional_user_keys(user:wp.extern.User):php.NativeArray;
  /**
    
     Set up the user contact methods.
    
     Default contact methods were removed in 3.6. A filter dictates contact methods.
    
     @since 3.7.0
    
     @param WP_User $user Optional. WP_User object.
     @return array Array of contact methods and their labels.
    
  **/
  public function wp_get_user_contact_methods(user:wp.extern.User = null):php.NativeArray;
  /**
    
     The old private function for setting up user contact methods.
    
     Use wp_get_user_contact_methods() instead.
    
     @since 2.9.0
     @access private
    
     @param WP_User $user Optional. WP_User object. Default null.
     @return array Array of contact methods and their labels.
    
  **/
  public function _wp_get_user_contactmethods(user:wp.extern.User = null):php.NativeArray;
  /**
    
     Gets the text suggesting how to create strong passwords.
    
     @since 4.1.0
    
     @return string The password hint text.
    
  **/
  public function wp_get_password_hint():String;
  /**
    
     Creates, stores, then returns a password reset key for user.
    
     @since 4.4.0
    
     @global wpdb         $wpdb      WordPress database abstraction object.
     @global PasswordHash $wp_hasher Portable PHP password hashing framework.
    
     @param WP_User $user User to retrieve password reset key for.
    
     @return string|WP_Error Password reset key on success. WP_Error on error.
    
  **/
  public function get_password_reset_key(user:wp.extern.User):haxe.extern.EitherType<String, wp.extern.Error>;
  /**
    
     Retrieves a user row based on password reset key and login
    
     A key is considered 'expired' if it exactly matches the value of the
     user_activation_key field, rather than being matched after going through the
     hashing process. This field is now hashed; old values are no longer accepted
     but have a different WP_Error code so good user feedback can be provided.
    
     @since 3.1.0
    
     @global wpdb         $wpdb      WordPress database object for queries.
     @global PasswordHash $wp_hasher Portable PHP password hashing framework instance.
    
     @param string $key       Hash to validate sending user's password.
     @param string $login     The user login.
     @return WP_User|WP_Error WP_User object on success, WP_Error object for invalid or expired keys.
    
  **/
  public function check_password_reset_key(key:String, login:String):haxe.extern.EitherType<wp.extern.User, wp.extern.Error>;
  /**
    
     Handles resetting the user's password.
    
     @since 2.5.0
    
     @param WP_User $user     The user
     @param string $new_pass New password for the user in plaintext
    
  **/
  public function reset_password(user:wp.extern.User, new_pass:String):Void;
  /**
    
     Handles registering a new user.
    
     @since 2.5.0
    
     @param string $user_login User's username for logging in
     @param string $user_email User's email address to send password and add
     @return int|WP_Error Either user's ID or error on failure.
    
  **/
  public function register_new_user(user_login:String, user_email:String):haxe.extern.EitherType<Int, wp.extern.Error>;
  /**
    
     Initiates email notifications related to the creation of new users.
    
     Notifications are sent both to the site admin and to the newly created user.
    
     @since 4.4.0
     @since 4.6.0 Converted the `$notify` parameter to accept 'user' for sending
                  notifications only to the user created.
    
     @param int    $user_id ID of the newly created user.
     @param string $notify  Optional. Type of notification that should happen. Accepts 'admin'
                            or an empty string (admin only), 'user', or 'both' (admin and user).
                            Default 'both'.
    
  **/
  public function wp_send_new_user_notifications(user_id:Int, notify:String = 'both'):Void;
  /**
    
     Retrieve the current session token from the logged_in cookie.
    
     @since 4.0.0
    
     @return string Token.
    
  **/
  public function wp_get_session_token():String;
  /**
    
     Retrieve a list of sessions for the current user.
    
     @since 4.0.0
     @return array Array of sessions.
    
  **/
  public function wp_get_all_sessions():php.NativeArray;
  /**
    
     Remove the current session token from the database.
    
     @since 4.0.0
    
  **/
  public function wp_destroy_current_session():Void;
  /**
    
     Remove all but the current session token for the current user for the database.
    
     @since 4.0.0
    
  **/
  public function wp_destroy_other_sessions():Void;
  /**
    
     Remove all session tokens for the current user from the database.
    
     @since 4.0.0
    
  **/
  public function wp_destroy_all_sessions():Void;
  /**
    
     Get the user IDs of all users with no role on this site.
    
     @since 4.4.0
     @since 4.9.0 The `$site_id` parameter was added to support multisite.
    
     @param int|null $site_id Optional. The site ID to get users with no role for. Defaults to the current site.
     @return array Array of user IDs.
    
  **/
  public function wp_get_users_with_no_role(site_id:Int = null):php.NativeArray;
  /**
    
     Retrieves the current user object.
    
     Will set the current user, if the current user is not set. The current user
     will be set to the logged-in person. If no user is logged-in, then it will
     set the current user to 0, which is invalid and won't have any permissions.
    
     This function is used by the pluggable functions wp_get_current_user() and
     get_currentuserinfo(), the latter of which is deprecated but used for backward
     compatibility.
    
     @since 4.5.0
     @access private
    
     @see wp_get_current_user()
     @global WP_User $current_user Checks if the current user is set.
    
     @return WP_User Current WP_User instance.
    
  **/
  public function _wp_get_current_user():wp.extern.User;
  /**
    
     Send a confirmation request email when a change of user email address is attempted.
    
     @since 3.0.0
     @since 4.9.0 This function was moved from wp-admin/includes/ms.php so it's no longer Multisite specific.
    
     @global WP_Error $errors WP_Error object.
    
  **/
  public function send_confirmation_on_profile_email():Void;
  /**
    
     Adds an admin notice alerting the user to check for confirmation request email
     after email address change.
    
     @since 3.0.0
     @since 4.9.0 This function was moved from wp-admin/includes/ms.php so it's no longer Multisite specific.
    
     @global string $pagenow
    
  **/
  public function new_user_email_admin_notice():Void;
  /**
    
     Get all user privacy request types.
    
     @since 4.9.6
     @access private
    
     @return array List of core privacy action types.
    
  **/
  public function _wp_privacy_action_request_types():php.NativeArray;
  /**
    
     Registers the personal data exporter for users.
    
     @since 4.9.6
    
     @param array $exporters  An array of personal data exporters.
     @return array An array of personal data exporters.
    
  **/
  public function wp_register_user_personal_data_exporter(exporters:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Finds and exports personal data associated with an email address from the user and user_meta table.
    
     @since 4.9.6
    
     @param string $email_address  The users email address.
     @return array An array of personal data.
    
  **/
  public function wp_user_personal_data_exporter(email_address:String):php.NativeArray;
  /**
    
     Update log when privacy request is confirmed.
    
     @since 4.9.6
     @access private
    
     @param int $request_id ID of the request.
    
  **/
  public function _wp_privacy_account_request_confirmed(request_id:Int):Void;
  /**
    
     Notify the site administrator via email when a request is confirmed.
    
     Without this, the admin would have to manually check the site to see if any
     action was needed on their part yet.
    
     @since 4.9.6
    
     @param int $request_id The ID of the request.
    
  **/
  public function _wp_privacy_send_request_confirmation_notification(request_id:Int):Void;
  /**
    
     Notify the user when their erasure request is fulfilled.
    
     Without this, the user would never know if their data was actually erased.
    
     @since 4.9.6
    
     @param int $request_id The privacy request post ID associated with this request.
    
  **/
  public function _wp_privacy_send_erasure_fulfillment_notification(request_id:Int):Void;
  /**
    
     Return request confirmation message HTML.
    
     @since 4.9.6
     @access private
    
     @param int $request_id The request ID being confirmed.
     @return string $message The confirmation message.
    
  **/
  public function _wp_privacy_account_request_confirmed_message(request_id:Int):String;
  /**
    
     Create and log a user request to perform a specific action.
    
     Requests are stored inside a post type named `user_request` since they can apply to both
     users on the site, or guests without a user account.
    
     @since 4.9.6
    
     @param string $email_address User email address. This can be the address of a registered or non-registered user.
     @param string $action_name   Name of the action that is being confirmed. Required.
     @param array  $request_data  Misc data you want to send with the verification request and pass to the actions once the request is confirmed.
     @return int|WP_Error Returns the request ID if successful, or a WP_Error object on failure.
    
  **/
  public function wp_create_user_request(email_address:String = '', action_name:String = '', ?request_data:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Int, wp.extern.Error>;
  /**
    
     Get action description from the name and return a string.
    
     @since 4.9.6
    
     @param string $action_name Action name of the request.
     @return string Human readable action name.
    
  **/
  public function wp_user_request_action_description(action_name:String):String;
  /**
    
     Send a confirmation request email to confirm an action.
    
     If the request is not already pending, it will be updated.
    
     @since 4.9.6
    
     @param string $request_id ID of the request created via wp_create_user_request().
     @return bool|WP_Error True on success, `WP_Error` on failure.
    
  **/
  public function wp_send_user_request(request_id:String):haxe.extern.EitherType<Bool, wp.extern.Error>;
  /**
    
     Returns a confirmation key for a user action and stores the hashed version for future comparison.
    
     @since 4.9.6
    
     @param int $request_id Request ID.
     @return string Confirmation key.
    
  **/
  public function wp_generate_user_request_key(request_id:Int):String;
  /**
    
     Validate a user request by comparing the key with the request's key.
    
     @since 4.9.6
    
     @param string $request_id ID of the request being confirmed.
     @param string $key        Provided key to validate.
     @return bool|WP_Error WP_Error on failure, true on success.
    
  **/
  public function wp_validate_user_request_key(request_id:String, key:String):haxe.extern.EitherType<Bool, wp.extern.Error>;
  /**
    
     Return data about a user request.
    
     @since 4.9.6
    
     @param int $request_id Request ID to get data about.
     @return WP_User_Request|false
    
  **/
  public function wp_get_user_request_data(request_id:Int):haxe.extern.EitherType<wp.extern.UserRequest, Bool>;
}
