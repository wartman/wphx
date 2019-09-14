package wp.extern;

extern class MsFunctionsApi implements wp.util.ApiFunctions {
  /**
    
     Gets the network's site and user counts.
    
     @since MU (3.0.0)
    
     @return array Site and user count for the network.
    
  **/
  public function get_sitestats():php.NativeArray;
  /**
    
     Get one of a user's active blogs
    
     Returns the user's primary blog, if they have one and
     it is active. If it's inactive, function returns another
     active blog of the user. If none are found, the user
     is added as a Subscriber to the Dashboard Blog and that blog
     is returned.
    
     @since MU (3.0.0)
    
     @param int $user_id The unique ID of the user
     @return WP_Site|void The blog object
    
  **/
  public function get_active_blog_for_user(user_id:Int):wp.extern.Site;
  /**
    
     The number of active users in your installation.
    
     The count is cached and updated twice daily. This is not a live count.
    
     @since MU (3.0.0)
     @since 4.8.0 The `$network_id` parameter has been added.
    
     @param int|null $network_id ID of the network. Default is the current network.
     @return int Number of active users on the network.
    
  **/
  public function get_user_count(network_id:Int = null):Int;
  /**
    
     The number of active sites on your installation.
    
     The count is cached and updated twice daily. This is not a live count.
    
     @since MU (3.0.0)
     @since 3.7.0 The `$network_id` parameter has been deprecated.
     @since 4.8.0 The `$network_id` parameter is now being used.
    
     @param int|null $network_id ID of the network. Default is the current network.
     @return int Number of active sites on the network.
    
  **/
  public function get_blog_count(network_id:Int = null):Int;
  /**
    
     Get a blog post from any site on the network.
    
     @since MU (3.0.0)
    
     @param int $blog_id ID of the blog.
     @param int $post_id ID of the post you're looking for.
     @return WP_Post|null WP_Post on success or null on failure
    
  **/
  public function get_blog_post(blog_id:Int, post_id:Int):wp.extern.Post;
  /**
    
     Adds a user to a blog.
    
     Use the {@see 'add_user_to_blog'} action to fire an event when users are added to a blog.
    
     @since MU (3.0.0)
    
     @param int    $blog_id ID of the blog you're adding the user to.
     @param int    $user_id ID of the user you're adding.
     @param string $role    The role you want the user to have
     @return true|WP_Error
    
  **/
  public function add_user_to_blog(blog_id:Int, user_id:Int, role:String):haxe.extern.EitherType<Bool, wp.extern.Error>;
  /**
    
     Remove a user from a blog.
    
     Use the {@see 'remove_user_from_blog'} action to fire an event when
     users are removed from a blog.
    
     Accepts an optional `$reassign` parameter, if you want to
     reassign the user's blog posts to another user upon removal.
    
     @since MU (3.0.0)
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int    $user_id  ID of the user you're removing.
     @param int    $blog_id  ID of the blog you're removing the user from.
     @param string $reassign Optional. A user to whom to reassign posts.
     @return true|WP_Error
    
  **/
  public function remove_user_from_blog(user_id:Int, blog_id:Int = '', reassign:String = ''):haxe.extern.EitherType<Bool, wp.extern.Error>;
  /**
    
     Get the permalink for a post on another blog.
    
     @since MU (3.0.0) 1.0
    
     @param int $blog_id ID of the source blog.
     @param int $post_id ID of the desired post.
     @return string The post's permalink
    
  **/
  public function get_blog_permalink(blog_id:Int, post_id:Int):String;
  /**
    
     Get a blog's numeric ID from its URL.
    
     On a subdirectory installation like example.com/blog1/,
     $domain will be the root 'example.com' and $path the
     subdirectory '/blog1/'. With subdomains like blog1.example.com,
     $domain is 'blog1.example.com' and $path is '/'.
    
     @since MU (3.0.0)
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string $domain
     @param string $path   Optional. Not required for subdomain installations.
     @return int 0 if no blog found, otherwise the ID of the matching blog
    
  **/
  public function get_blog_id_from_url(domain:String, path:String = '/'):Int;
  /**
    
     Checks an email address against a list of banned domains.
    
     This function checks against the Banned Email Domains list
     at wp-admin/network/settings.php. The check is only run on
     self-registrations; user creation at wp-admin/network/users.php
     bypasses this check.
    
     @since MU (3.0.0)
    
     @param string $user_email The email provided by the user at registration.
     @return bool Returns true when the email address is banned.
    
  **/
  public function is_email_address_unsafe(user_email:String):Bool;
  /**
    
     Sanitize and validate data required for a user sign-up.
    
     Verifies the validity and uniqueness of user names and user email addresses,
     and checks email addresses against admin-provided domain whitelists and blacklists.
    
     The {@see 'wpmu_validate_user_signup'} hook provides an easy way to modify the sign-up
     process. The value $result, which is passed to the hook, contains both the user-provided
     info and the error messages created by the function. {@see 'wpmu_validate_user_signup'}
     allows you to process the data in any way you'd like, and unset the relevant errors if
     necessary.
    
     @since MU (3.0.0)
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string $user_name  The login name provided by the user.
     @param string $user_email The email provided by the user.
     @return array Contains username, email, and error messages.
    
  **/
  public function wpmu_validate_user_signup(user_name:String, user_email:String):php.NativeArray;
  /**
    
     Processes new site registrations.
    
     Checks the data provided by the user during blog signup. Verifies
     the validity and uniqueness of blog paths and domains.
    
     This function prevents the current user from registering a new site
     with a blogname equivalent to another user's login name. Passing the
     $user parameter to the function, where $user is the other user, is
     effectively an override of this limitation.
    
     Filter {@see 'wpmu_validate_blog_signup'} if you want to modify
     the way that WordPress validates new site signups.
    
     @since MU (3.0.0)
    
     @global wpdb   $wpdb
     @global string $domain
    
     @param string         $blogname   The blog name provided by the user. Must be unique.
     @param string         $blog_title The blog title provided by the user.
     @param WP_User|string $user       Optional. The user object to check against the new site name.
     @return array Contains the new site data and error messages.
    
  **/
  public function wpmu_validate_blog_signup(blogname:String, blog_title:String, user:haxe.extern.EitherType<wp.extern.User, String> = ''):php.NativeArray;
  /**
    
     Record site signup information for future activation.
    
     @since MU (3.0.0)
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string $domain     The requested domain.
     @param string $path       The requested path.
     @param string $title      The requested site title.
     @param string $user       The user's requested login name.
     @param string $user_email The user's email address.
     @param array  $meta       Optional. Signup meta data. By default, contains the requested privacy setting and lang_id.
    
  **/
  public function wpmu_signup_blog(domain:String, path:String, title:String, user:String, user_email:String, ?meta:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Record user signup information for future activation.
    
     This function is used when user registration is open but
     new site registration is not.
    
     @since MU (3.0.0)
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string $user       The user's requested login name.
     @param string $user_email The user's email address.
     @param array  $meta       Optional. Signup meta data. Default empty array.
    
  **/
  public function wpmu_signup_user(user:String, user_email:String, ?meta:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Send a confirmation request email to a user when they sign up for a new site. The new site will not become active
     until the confirmation link is clicked.
    
     This is the notification function used when site registration
     is enabled.
    
     Filter {@see 'wpmu_signup_blog_notification'} to bypass this function or
     replace it with your own notification behavior.
    
     Filter {@see 'wpmu_signup_blog_notification_email'} and
     {@see 'wpmu_signup_blog_notification_subject'} to change the content
     and subject line of the email sent to newly registered users.
    
     @since MU (3.0.0)
    
     @param string $domain     The new blog domain.
     @param string $path       The new blog path.
     @param string $title      The site title.
     @param string $user_login The user's login name.
     @param string $user_email The user's email address.
     @param string $key        The activation key created in wpmu_signup_blog()
     @param array  $meta       Optional. Signup meta data. By default, contains the requested privacy setting and lang_id.
     @return bool
    
  **/
  public function wpmu_signup_blog_notification(domain:String, path:String, title:String, user_login:String, user_email:String, key:String, ?meta:php.NativeStructArray<Dynamic>):Bool;
  /**
    
     Send a confirmation request email to a user when they sign up for a new user account (without signing up for a site
     at the same time). The user account will not become active until the confirmation link is clicked.
    
     This is the notification function used when no new site has
     been requested.
    
     Filter {@see 'wpmu_signup_user_notification'} to bypass this function or
     replace it with your own notification behavior.
    
     Filter {@see 'wpmu_signup_user_notification_email'} and
     {@see 'wpmu_signup_user_notification_subject'} to change the content
     and subject line of the email sent to newly registered users.
    
     @since MU (3.0.0)
    
     @param string $user_login The user's login name.
     @param string $user_email The user's email address.
     @param string $key        The activation key created in wpmu_signup_user()
     @param array  $meta       Optional. Signup meta data. Default empty array.
     @return bool
    
  **/
  public function wpmu_signup_user_notification(user_login:String, user_email:String, key:String, ?meta:php.NativeStructArray<Dynamic>):Bool;
  /**
    
     Activate a signup.
    
     Hook to {@see 'wpmu_activate_user'} or {@see 'wpmu_activate_blog'} for events
     that should happen only when users or sites are self-created (since
     those actions are not called when users and sites are created
     by a Super Admin).
    
     @since MU (3.0.0)
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string $key The activation key provided to the user.
     @return array|WP_Error An array containing information about the activated user and/or blog
    
  **/
  public function wpmu_activate_signup(key:String):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, wp.extern.Error>;
  /**
    
     Create a user.
    
     This function runs when a user self-registers as well as when
     a Super Admin creates a new user. Hook to {@see 'wpmu_new_user'} for events
     that should affect all new users, but only on Multisite (otherwise
     use {@see'user_register'}).
    
     @since MU (3.0.0)
    
     @param string $user_name The new user's login name.
     @param string $password  The new user's password.
     @param string $email     The new user's email address.
     @return int|false Returns false on failure, or int $user_id on success
    
  **/
  public function wpmu_create_user(user_name:String, password:String, email:String):haxe.extern.EitherType<Int, Bool>;
  /**
    
     Create a site.
    
     This function runs when a user self-registers a new site as well
     as when a Super Admin creates a new site. Hook to {@see 'wpmu_new_blog'}
     for events that should affect all new sites.
    
     On subdirectory installations, $domain is the same as the main site's
     domain, and the path is the subdirectory name (eg 'example.com'
     and '/blog1/'). On subdomain installations, $domain is the new subdomain +
     root domain (eg 'blog1.example.com'), and $path is '/'.
    
     @since MU (3.0.0)
    
     @param string $domain     The new site's domain.
     @param string $path       The new site's path.
     @param string $title      The new site's title.
     @param int    $user_id    The user ID of the new site's admin.
     @param array  $options    Optional. Array of key=>value pairs used to set initial site options.
                               If valid status keys are included ('public', 'archived', 'mature',
                               'spam', 'deleted', or 'lang_id') the given site status(es) will be
                               updated. Otherwise, keys and values will be used to set options for
                               the new site. Default empty array.
     @param int    $network_id Optional. Network ID. Only relevant on multi-network installations.
     @return int|WP_Error Returns WP_Error object on failure, the new site ID on success.
    
  **/
  public function wpmu_create_blog(domain:String, path:String, title:String, user_id:Int, ?options:php.NativeStructArray<Dynamic>, network_id:Int = 1):haxe.extern.EitherType<Int, wp.extern.Error>;
  /**
    
     Notifies the network admin that a new site has been activated.
    
     Filter {@see 'newblog_notify_siteadmin'} to change the content of
     the notification email.
    
     @since MU (3.0.0)
     @since 5.1.0 $blog_id now supports input from the {@see 'wp_initialize_site'} action.
    
     @param WP_Site|int $blog_id    The new site's object or ID.
     @param string      $deprecated Not used.
     @return bool
    
  **/
  public function newblog_notify_siteadmin(blog_id:haxe.extern.EitherType<wp.extern.Site, Int>, deprecated:String = ''):Bool;
  /**
    
     Notifies the network admin that a new user has been activated.
    
     Filter {@see 'newuser_notify_siteadmin'} to change the content of
     the notification email.
    
     @since MU (3.0.0)
    
     @param int $user_id The new user's ID.
     @return bool
    
  **/
  public function newuser_notify_siteadmin(user_id:Int):Bool;
  /**
    
     Checks whether a site name is already taken.
    
     The name is the site's subdomain or the site's subdirectory
     path depending on the network settings.
    
     Used during the new site registration process to ensure
     that each site name is unique.
    
     @since MU (3.0.0)
    
     @param string $domain     The domain to be checked.
     @param string $path       The path to be checked.
     @param int    $network_id Optional. Network ID. Relevant only on multi-network installations.
     @return int|null The site ID if the site name exists, null otherwise.
    
  **/
  public function domain_exists(domain:String, path:String, network_id:Int = 1):Int;
  /**
    
     Notify a user that their blog activation has been successful.
    
     Filter {@see 'wpmu_welcome_notification'} to disable or bypass.
    
     Filter {@see 'update_welcome_email'} and {@see 'update_welcome_subject'} to
     modify the content and subject line of the notification email.
    
     @since MU (3.0.0)
    
     @param int    $blog_id  Blog ID.
     @param int    $user_id  User ID.
     @param string $password User password.
     @param string $title    Site title.
     @param array  $meta     Optional. Signup meta data. By default, contains the requested privacy setting and lang_id.
     @return bool
    
  **/
  public function wpmu_welcome_notification(blog_id:Int, user_id:Int, password:String, title:String, ?meta:php.NativeStructArray<Dynamic>):Bool;
  /**
    
     Notify a user that their account activation has been successful.
    
     Filter {@see 'wpmu_welcome_user_notification'} to disable or bypass.
    
     Filter {@see 'update_welcome_user_email'} and {@see 'update_welcome_user_subject'} to
     modify the content and subject line of the notification email.
    
     @since MU (3.0.0)
    
     @param int    $user_id  User ID.
     @param string $password User password.
     @param array  $meta     Optional. Signup meta data. Default empty array.
     @return bool
    
  **/
  public function wpmu_welcome_user_notification(user_id:Int, password:String, ?meta:php.NativeStructArray<Dynamic>):Bool;
  /**
    
     Get the current network.
    
     Returns an object containing the 'id', 'domain', 'path', and 'site_name'
     properties of the network being viewed.
    
     @see wpmu_current_site()
    
     @since MU (3.0.0)
    
     @global WP_Network $current_site
    
     @return WP_Network
    
  **/
  public function get_current_site():wp.extern.Network;
  /**
    
     Get a user's most recent post.
    
     Walks through each of a user's blogs to find the post with
     the most recent post_date_gmt.
    
     @since MU (3.0.0)
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int $user_id
     @return array Contains the blog_id, post_id, post_date_gmt, and post_gmt_ts
    
  **/
  public function get_most_recent_post_of_user(user_id:Int):php.NativeArray;
  /**
    
     Get the size of a directory.
    
     A helper function that is used primarily to check whether
     a blog has exceeded its allowed upload space.
    
     @since MU (3.0.0)
    
     @param string $directory Full path of a directory.
     @return int Size of the directory in MB.
    
  **/
  public function get_dirsize(directory:String):Int;
  /**
    
     Get the size of a directory recursively.
    
     Used by get_dirsize() to get a directory's size when it contains
     other directories.
    
     @since MU (3.0.0)
     @since 4.3.0 $exclude parameter added.
    
     @param string $directory Full path of a directory.
     @param string $exclude   Optional. Full path of a subdirectory to exclude from the total.
     @return int|false Size in MB if a valid directory. False if not.
    
  **/
  public function recurse_dirsize(directory:String, exclude:String = null):haxe.extern.EitherType<Int, Bool>;
  /**
    
     Check an array of MIME types against a whitelist.
    
     WordPress ships with a set of allowed upload filetypes,
     which is defined in wp-includes/functions.php in
     get_allowed_mime_types(). This function is used to filter
     that list against the filetype whitelist provided by Multisite
     Super Admins at wp-admin/network/settings.php.
    
     @since MU (3.0.0)
    
     @param array $mimes
     @return array
    
  **/
  public function check_upload_mimes(mimes:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Update a blog's post count.
    
     WordPress MS stores a blog's post count as an option so as
     to avoid extraneous COUNTs when a blog's details are fetched
     with get_site(). This function is called when posts are published
     or unpublished to make sure the count stays current.
    
     @since MU (3.0.0)
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string $deprecated Not used.
    
  **/
  public function update_posts_count(deprecated:String = ''):Void;
  /**
    
     Logs the user email, IP, and registration date of a new site.
    
     @since MU (3.0.0)
     @since 5.1.0 Parameters now support input from the {@see 'wp_initialize_site'} action.
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param WP_Site|int $blog_id The new site's object or ID.
     @param int|array   $user_id User ID, or array of arguments including 'user_id'.
    
  **/
  public function wpmu_log_new_registrations(blog_id:haxe.extern.EitherType<wp.extern.Site, Int>, user_id:haxe.extern.EitherType<Int, php.NativeStructArray<Dynamic>>):Void;
  /**
    
     Maintains a canonical list of terms by syncing terms created for each blog with the global terms table.
    
     @since 3.0.0
    
     @see term_id_filter
    
     @global wpdb $wpdb WordPress database abstraction object.
     @staticvar int $global_terms_recurse
    
     @param int    $term_id    An ID for a term on the current blog.
     @param string $deprecated Not used.
     @return int An ID from the global terms table mapped from $term_id.
    
  **/
  public function global_terms(term_id:Int, deprecated:String = ''):Int;
  /**
    
     Ensure that the current site's domain is listed in the allowed redirect host list.
    
     @see wp_validate_redirect()
     @since MU (3.0.0)
    
     @param array|string $deprecated Not used.
     @return array The current site's domain
    
  **/
  public function redirect_this_site(deprecated:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String> = ''):php.NativeArray;
  /**
    
     Check whether an upload is too big.
    
     @since MU (3.0.0)
    
     @blessed
    
     @param array $upload
     @return string|array If the upload is under the size limit, $upload is returned. Otherwise returns an error message.
    
  **/
  public function upload_is_file_too_big(upload:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>;
  /**
    
     Add a nonce field to the signup page.
    
     @since MU (3.0.0)
    
  **/
  public function signup_nonce_fields():Void;
  /**
    
     Process the signup nonce created in signup_nonce_fields().
    
     @since MU (3.0.0)
    
     @param array $result
     @return array
    
  **/
  public function signup_nonce_check(result:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Correct 404 redirects when NOBLOGREDIRECT is defined.
    
     @since MU (3.0.0)
    
  **/
  public function maybe_redirect_404():Void;
  /**
    
     Add a new user to a blog by visiting /newbloguser/{key}/.
    
     This will only work when the user's details are saved as an option
     keyed as 'new_user_{key}', where '{key}' is a hash generated for the user to be
     added, as when a user is invited through the regular WP Add User interface.
    
     @since MU (3.0.0)
    
  **/
  public function maybe_add_existing_user_to_blog():Void;
  /**
    
     Add a user to a blog based on details from maybe_add_existing_user_to_blog().
    
     @since MU (3.0.0)
    
     @param array $details
     @return true|WP_Error|void
    
  **/
  public function add_existing_user_to_blog(details:php.NativeStructArray<Dynamic> = false):haxe.extern.EitherType<Bool, wp.extern.Error>;
  /**
    
     Adds a newly created user to the appropriate blog
    
     To add a user in general, use add_user_to_blog(). This function
     is specifically hooked into the {@see 'wpmu_activate_user'} action.
    
     @since MU (3.0.0)
     @see add_user_to_blog()
    
     @param int   $user_id
     @param mixed $password Ignored.
     @param array $meta
    
  **/
  public function add_new_user_to_blog(user_id:Int, password:Dynamic, meta:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Correct From host on outgoing mail to match the site domain
    
     @since MU (3.0.0)
    
     @param PHPMailer $phpmailer The PHPMailer instance (passed by reference).
    
  **/
  public function fix_phpmailer_messageid(phpmailer:PHPMailer):Void;
  /**
    
     Check to see whether a user is marked as a spammer, based on user login.
    
     @since MU (3.0.0)
    
     @param string|WP_User $user Optional. Defaults to current user. WP_User object,
                                 or user login name as a string.
     @return bool
    
  **/
  public function is_user_spammy(user:haxe.extern.EitherType<String, wp.extern.User> = null):Bool;
  /**
    
     Update this blog's 'public' setting in the global blogs table.
    
     Public blogs have a setting of 1, private blogs are 0.
    
     @since MU (3.0.0)
    
     @param int $old_value
     @param int $value     The new public value
    
  **/
  public function update_blog_public(old_value:Int, value:Int):Void;
  /**
    
     Check whether users can self-register, based on Network settings.
    
     @since MU (3.0.0)
    
     @return bool
    
  **/
  public function users_can_register_signup_filter():Bool;
  /**
    
     Ensure that the welcome message is not empty. Currently unused.
    
     @since MU (3.0.0)
    
     @param string $text
     @return string
    
  **/
  public function welcome_user_msg_filter(text:String):String;
  /**
    
     Whether to force SSL on content.
    
     @since 2.8.5
    
     @staticvar bool $forced_content
    
     @param bool $force
     @return bool True if forced, false if not forced.
    
  **/
  public function force_ssl_content(force:Bool = ''):Bool;
  /**
    
     Formats a URL to use https.
    
     Useful as a filter.
    
     @since 2.8.5
    
     @param string $url URL
     @return string URL with https as the scheme
    
  **/
  public function filter_SSL(url:String):String;
  /**
    
     Schedule update of the network-wide counts for the current network.
    
     @since 3.1.0
    
  **/
  public function wp_schedule_update_network_counts():Void;
  /**
    
     Update the network-wide counts for the current network.
    
     @since 3.1.0
     @since 4.8.0 The `$network_id` parameter has been added.
    
     @param int|null $network_id ID of the network. Default is the current network.
    
  **/
  public function wp_update_network_counts(network_id:Int = null):Void;
  /**
    
     Update the count of sites for the current network.
    
     If enabled through the {@see 'enable_live_network_counts'} filter, update the sites count
     on a network when a site is created or its status is updated.
    
     @since 3.7.0
     @since 4.8.0 The `$network_id` parameter has been added.
    
     @param int|null $network_id ID of the network. Default is the current network.
    
  **/
  public function wp_maybe_update_network_site_counts(network_id:Int = null):Void;
  /**
    
     Update the network-wide users count.
    
     If enabled through the {@see 'enable_live_network_counts'} filter, update the users count
     on a network when a user is created or its status is updated.
    
     @since 3.7.0
     @since 4.8.0 The `$network_id` parameter has been added.
    
     @param int|null $network_id ID of the network. Default is the current network.
    
  **/
  public function wp_maybe_update_network_user_counts(network_id:Int = null):Void;
  /**
    
     Update the network-wide site count.
    
     @since 3.7.0
     @since 4.8.0 The `$network_id` parameter has been added.
    
     @param int|null $network_id ID of the network. Default is the current network.
    
  **/
  public function wp_update_network_site_counts(network_id:Int = null):Void;
  /**
    
     Update the network-wide user count.
    
     @since 3.7.0
     @since 4.8.0 The `$network_id` parameter has been added.
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int|null $network_id ID of the network. Default is the current network.
    
  **/
  public function wp_update_network_user_counts(network_id:Int = null):Void;
  /**
    
     Returns the space used by the current blog.
    
     @since 3.5.0
    
     @return int Used space in megabytes
    
  **/
  public function get_space_used():Int;
  /**
    
     Returns the upload quota for the current blog.
    
     @since MU (3.0.0)
    
     @return int Quota in megabytes
    
  **/
  public function get_space_allowed():Int;
  /**
    
     Determines if there is any upload space left in the current blog's quota.
    
     @since 3.0.0
    
     @return int of upload space available in bytes
    
  **/
  public function get_upload_space_available():Int;
  /**
    
     Determines if there is any upload space left in the current blog's quota.
    
     @since 3.0.0
     @return bool True if space is available, false otherwise.
    
  **/
  public function is_upload_space_available():Bool;
  /**
    
     Filters the maximum upload file size allowed, in bytes.
    
     @since 3.0.0
    
     @param  int $size Upload size limit in bytes.
     @return int       Upload size limit in bytes.
    
  **/
  public function upload_size_limit_filter(size:Int):Int;
  /**
    
     Whether or not we have a large network.
    
     The default criteria for a large network is either more than 10,000 users or more than 10,000 sites.
     Plugins can alter this criteria using the {@see 'wp_is_large_network'} filter.
    
     @since 3.3.0
     @since 4.8.0 The `$network_id` parameter has been added.
    
     @param string   $using      'sites or 'users'. Default is 'sites'.
     @param int|null $network_id ID of the network. Default is the current network.
     @return bool True if the network meets the criteria for large. False otherwise.
    
  **/
  public function wp_is_large_network(using:String = 'sites', network_id:Int = null):Bool;
  /**
    
     Retrieves a list of reserved site on a sub-directory Multisite installation.
    
     @since 4.4.0
    
     @return array $names Array of reserved subdirectory names.
    
  **/
  public function get_subdirectory_reserved_names():php.NativeArray;
  /**
    
     Send a confirmation request email when a change of network admin email address is attempted.
    
     The new network admin address will not become active until confirmed.
    
     @since 4.9.0
    
     @param string $old_value The old network admin email address.
     @param string $value     The proposed new network admin email address.
    
  **/
  public function update_network_option_new_admin_email(old_value:String, value:String):Void;
  /**
    
     Send an email to the old network admin email address when the network admin email address changes.
    
     @since 4.9.0
    
     @param string $option_name The relevant database option name.
     @param string $new_email   The new network admin email address.
     @param string $old_email   The old network admin email address.
     @param int    $network_id  ID of the network.
    
  **/
  public function wp_network_admin_email_change_notification(option_name:String, new_email:String, old_email:String, network_id:Int):Void;
}
