package wp.extern;

extern class PluggableApi implements wp.util.ApiFunctions {
  /**
    
     Changes the current user by ID or name.
    
     Set $id to null and specify a name if you do not know a user's ID.
    
     Some WordPress functionality is based on the current user and not based on
     the signed in user. Therefore, it opens the ability to edit and perform
     actions on users who aren't signed in.
    
     @since 2.0.3
     @global WP_User $current_user The current user object which holds the user data.
    
     @param int    $id   User ID
     @param string $name User's username
     @return WP_User Current user User object
    
  **/
  public function wp_set_current_user(id:Int, name:String = ''):wp.extern.User;
  /**
    
     Retrieve the current user object.
    
     Will set the current user, if the current user is not set. The current user
     will be set to the logged-in person. If no user is logged-in, then it will
     set the current user to 0, which is invalid and won't have any permissions.
    
     @since 2.0.3
    
     @see _wp_get_current_user()
     @global WP_User $current_user Checks if the current user is set.
    
     @return WP_User Current WP_User instance.
    
  **/
  public function wp_get_current_user():wp.extern.User;
  /**
    
     Retrieve user info by user ID.
    
     @since 0.71
    
     @param int $user_id User ID
     @return WP_User|false WP_User object on success, false on failure.
    
  **/
  public function get_userdata(user_id:Int):haxe.extern.EitherType<wp.extern.User, Bool>;
  /**
    
     Retrieve user info by a given field
    
     @since 2.8.0
     @since 4.4.0 Added 'ID' as an alias of 'id' for the `$field` parameter.
    
     @param string     $field The field to retrieve the user with. id | ID | slug | email | login.
     @param int|string $value A value for $field. A user ID, slug, email address, or login name.
     @return WP_User|false WP_User object on success, false on failure.
    
  **/
  public function get_user_by(field:String, value:haxe.extern.EitherType<Int, String>):haxe.extern.EitherType<wp.extern.User, Bool>;
  /**
    
     Retrieve info for user lists to prevent multiple queries by get_userdata()
    
     @since 3.0.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param array $user_ids User ID numbers list
    
  **/
  public function cache_users(user_ids:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Send mail, similar to PHP's mail
    
     A true return value does not automatically mean that the user received the
     email successfully. It just only means that the method used was able to
     process the request without any errors.
    
     Using the two 'wp_mail_from' and 'wp_mail_from_name' hooks allow from
     creating a from address like 'Name <email@address.com>' when both are set. If
     just 'wp_mail_from' is set, then just the email address will be used with no
     name.
    
     The default content type is 'text/plain' which does not allow using HTML.
     However, you can set the content type of the email by using the
     {@see 'wp_mail_content_type'} filter.
    
     The default charset is based on the charset used on the blog. The charset can
     be set using the {@see 'wp_mail_charset'} filter.
    
     @since 1.2.1
    
     @global PHPMailer $phpmailer
    
     @param string|array $to          Array or comma-separated list of email addresses to send message.
     @param string       $subject     Email subject
     @param string       $message     Message contents
     @param string|array $headers     Optional. Additional headers.
     @param string|array $attachments Optional. Files to attach.
     @return bool Whether the email contents were sent successfully.
    
  **/
  public function wp_mail(to:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>, subject:String, message:String, headers:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = '', ?attachments:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>):Bool;
  /**
    
     Authenticate a user, confirming the login credentials are valid.
    
     @since 2.5.0
     @since 4.5.0 `$username` now accepts an email address.
    
     @param string $username User's username or email address.
     @param string $password User's password.
     @return WP_User|WP_Error WP_User object if the credentials are valid,
                              otherwise WP_Error.
    
  **/
  public function wp_authenticate(username:String, password:String):haxe.extern.EitherType<wp.extern.User, wp.extern.Error>;
  /**
    
     Log the current user out.
    
     @since 2.5.0
    
  **/
  public function wp_logout():Void;
  /**
    
     Validates authentication cookie.
    
     The checks include making sure that the authentication cookie is set and
     pulling in the contents (if $cookie is not used).
    
     Makes sure the cookie is not expired. Verifies the hash in cookie is what is
     should be and compares the two.
    
     @since 2.5.0
    
     @global int $login_grace_period
    
     @param string $cookie Optional. If used, will validate contents instead of cookie's
     @param string $scheme Optional. The cookie scheme to use: auth, secure_auth, or logged_in
     @return false|int False if invalid cookie, User ID if valid.
    
  **/
  public function wp_validate_auth_cookie(cookie:String = '', scheme:String = ''):haxe.extern.EitherType<Bool, Int>;
  /**
    
     Generate authentication cookie contents.
    
     @since 2.5.0
     @since 4.0.0 The `$token` parameter was added.
    
     @param int    $user_id    User ID
     @param int    $expiration The time the cookie expires as a UNIX timestamp.
     @param string $scheme     Optional. The cookie scheme to use: auth, secure_auth, or logged_in
     @param string $token      User's session token to use for this cookie
     @return string Authentication cookie contents. Empty string if user does not exist.
    
  **/
  public function wp_generate_auth_cookie(user_id:Int, expiration:Int, scheme:String = 'auth', token:String = ''):String;
  /**
    
     Parse a cookie into its components
    
     @since 2.7.0
    
     @param string $cookie
     @param string $scheme Optional. The cookie scheme to use: auth, secure_auth, or logged_in
     @return array|false Authentication cookie components
    
  **/
  public function wp_parse_auth_cookie(cookie:String = '', scheme:String = ''):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Bool>;
  /**
    
     Log in a user by setting authentication cookies.
    
     The $remember parameter increases the time that the cookie will be kept. The
     default the cookie is kept without remembering is two days. When $remember is
     set, the cookies will be kept for 14 days or two weeks.
    
     @since 2.5.0
     @since 4.3.0 Added the `$token` parameter.
    
     @param int    $user_id  User ID
     @param bool   $remember Whether to remember the user
     @param mixed  $secure   Whether the admin cookies should only be sent over HTTPS.
                             Default is_ssl().
     @param string $token    Optional. User's session token to use for this cookie.
    
  **/
  public function wp_set_auth_cookie(user_id:Int, remember:Bool = false, secure:Dynamic = '', token:String = ''):Void;
  /**
    
     Removes all of the cookies associated with authentication.
    
     @since 2.5.0
    
  **/
  public function wp_clear_auth_cookie():Void;
  /**
    
     Determines whether the current visitor is a logged in user.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 2.0.0
    
     @return bool True if user is logged in, false if not logged in.
    
  **/
  public function is_user_logged_in():Bool;
  /**
    
     Checks if a user is logged in, if not it redirects them to the login page.
    
     @since 1.5.0
    
  **/
  public function auth_redirect():Void;
  /**
    
     Makes sure that a user was referred from another admin page.
    
     To avoid security exploits.
    
     @since 1.2.0
    
     @param int|string $action    Action nonce.
     @param string     $query_arg Optional. Key to check for nonce in `$_REQUEST` (since 2.5).
                                  Default '_wpnonce'.
     @return false|int False if the nonce is invalid, 1 if the nonce is valid and generated between
                       0-12 hours ago, 2 if the nonce is valid and generated between 12-24 hours ago.
    
  **/
  public function check_admin_referer(action:haxe.extern.EitherType<Int, String> = '', query_arg:String):haxe.extern.EitherType<Bool, Int>;
  /**
    
     Verifies the Ajax request to prevent processing requests external of the blog.
    
     @since 2.0.3
    
     @param int|string   $action    Action nonce.
     @param false|string $query_arg Optional. Key to check for the nonce in `$_REQUEST` (since 2.5). If false,
                                    `$_REQUEST` values will be evaluated for '_ajax_nonce', and '_wpnonce'
                                    (in that order). Default false.
     @param bool         $die       Optional. Whether to die early when the nonce cannot be verified.
                                    Default true.
     @return false|int False if the nonce is invalid, 1 if the nonce is valid and generated between
                       0-12 hours ago, 2 if the nonce is valid and generated between 12-24 hours ago.
    
  **/
  public function check_ajax_referer(action:haxe.extern.EitherType<Int, String> = '', query_arg:haxe.extern.EitherType<Bool, String>, die:Bool):haxe.extern.EitherType<Bool, Int>;
  /**
    
     Redirects to another page.
    
     Note: wp_redirect() does not exit automatically, and should almost always be
     followed by a call to `exit;`:
    
         wp_redirect( $url );
         exit;
    
     Exiting can also be selectively manipulated by using wp_redirect() as a conditional
     in conjunction with the {@see 'wp_redirect'} and {@see 'wp_redirect_location'} filters:
    
         if ( wp_redirect( $url ) ) {
             exit;
         }
    
     @since 1.5.1
     @since 5.1.0 The `$x_redirect_by` parameter was added.
    
     @global bool $is_IIS
    
     @param string $location      The path or URL to redirect to.
     @param int    $status        Optional. HTTP response status code to use. Default '302' (Moved Temporarily).
     @param string $x_redirect_by Optional. The application doing the redirect. Default 'WordPress'.
     @return bool False if the redirect was cancelled, true otherwise.
    
  **/
  public function wp_redirect(location:String, status:Int = 302, ?x_redirect_by:String):Bool;
  /**
    
     Sanitizes a URL for use in a redirect.
    
     @since 2.3.0
    
     @param string $location The path to redirect to.
     @return string Redirect-sanitized URL.
    
  **/
  public function wp_sanitize_redirect(location:String):String;
  /**
    
     URL encode UTF-8 characters in a URL.
    
     @ignore
     @since 4.2.0
     @access private
    
     @see wp_sanitize_redirect()
    
     @param array $matches RegEx matches against the redirect location.
     @return string URL-encoded version of the first RegEx match.
    
  **/
  public function _wp_sanitize_utf8_in_redirect(matches:php.NativeStructArray<Dynamic>):String;
  /**
    
     Performs a safe (local) redirect, using wp_redirect().
    
     Checks whether the $location is using an allowed host, if it has an absolute
     path. A plugin can therefore set or remove allowed host(s) to or from the
     list.
    
     If the host is not allowed, then the redirect defaults to wp-admin on the siteurl
     instead. This prevents malicious redirects which redirect to another host,
     but only used in a few places.
    
     Note: wp_safe_redirect() does not exit automatically, and should almost always be
     followed by a call to `exit;`:
    
         wp_safe_redirect( $url );
         exit;
    
     Exiting can also be selectively manipulated by using wp_safe_redirect() as a conditional
     in conjunction with the {@see 'wp_redirect'} and {@see 'wp_redirect_location'} filters:
    
         if ( wp_safe_redirect( $url ) ) {
             exit;
         }
    
     @since 2.3.0
     @since 5.1.0 The return value from wp_redirect() is now passed on, and the `$x_redirect_by` parameter was added.
    
     @param string $location      The path or URL to redirect to.
     @param int    $status        Optional. HTTP response status code to use. Default '302' (Moved Temporarily).
     @param string $x_redirect_by Optional. The application doing the redirect. Default 'WordPress'.
     @return bool  $redirect False if the redirect was cancelled, true otherwise.
    
  **/
  public function wp_safe_redirect(location:String, status:Int = 302, ?x_redirect_by:String):Bool;
  /**
    
     Validates a URL for use in a redirect.
    
     Checks whether the $location is using an allowed host, if it has an absolute
     path. A plugin can therefore set or remove allowed host(s) to or from the
     list.
    
     If the host is not allowed, then the redirect is to $default supplied
    
     @since 2.8.1
    
     @param string $location The redirect to validate
     @param string $default  The value to return if $location is not allowed
     @return string redirect-sanitized URL
    
  **/
  public function wp_validate_redirect(location:String, default_:String = ''):String;
  /**
    
     Notify an author (and/or others) of a comment/trackback/pingback on a post.
    
     @since 1.0.0
    
     @param int|WP_Comment  $comment_id Comment ID or WP_Comment object.
     @param string          $deprecated Not used
     @return bool True on completion. False if no email addresses were specified.
    
  **/
  public function wp_notify_postauthor(comment_id:haxe.extern.EitherType<Int, wp.extern.Comment>, deprecated:String = null):Bool;
  /**
    
     Notifies the moderator of the site about a new comment that is awaiting approval.
    
     @since 1.0.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     Uses the {@see 'notify_moderator'} filter to determine whether the site moderator
     should be notified, overriding the site setting.
    
     @param int $comment_id Comment ID.
     @return true Always returns true.
    
  **/
  public function wp_notify_moderator(comment_id:Int):Bool;
  /**
    
     Notify the blog admin of a user changing password, normally via email.
    
     @since 2.7.0
    
     @param WP_User $user User object.
    
  **/
  public function wp_password_change_notification(user:wp.extern.User):Void;
  /**
    
     Email login credentials to a newly-registered user.
    
     A new user registration notification is also sent to admin email.
    
     @since 2.0.0
     @since 4.3.0 The `$plaintext_pass` parameter was changed to `$notify`.
     @since 4.3.1 The `$plaintext_pass` parameter was deprecated. `$notify` added as a third parameter.
     @since 4.6.0 The `$notify` parameter accepts 'user' for sending notification only to the user created.
    
     @global wpdb         $wpdb      WordPress database object for queries.
     @global PasswordHash $wp_hasher Portable PHP password hashing framework instance.
    
     @param int    $user_id    User ID.
     @param null   $deprecated Not used (argument deprecated).
     @param string $notify     Optional. Type of notification that should happen. Accepts 'admin' or an empty
                               string (admin only), 'user', or 'both' (admin and user). Default empty.
    
  **/
  public function wp_new_user_notification(user_id:Int, deprecated:Dynamic = null, notify:String = ''):Void;
  /**
    
     Get the time-dependent variable for nonce creation.
    
     A nonce has a lifespan of two ticks. Nonces in their second tick may be
     updated, e.g. by autosave.
    
     @since 2.5.0
    
     @return float Float value rounded up to the next highest integer.
    
  **/
  public function wp_nonce_tick():Int;
  /**
    
     Verify that correct nonce was used with time limit.
    
     The user is given an amount of time to use the token, so therefore, since the
     UID and $action remain the same, the independent variable is the time.
    
     @since 2.0.3
    
     @param string     $nonce  Nonce that was used in the form to verify
     @param string|int $action Should give context to what is taking place and be the same when nonce was created.
     @return false|int False if the nonce is invalid, 1 if the nonce is valid and generated between
                       0-12 hours ago, 2 if the nonce is valid and generated between 12-24 hours ago.
    
  **/
  public function wp_verify_nonce(nonce:String, action:haxe.extern.EitherType<String, Int> = ''):haxe.extern.EitherType<Bool, Int>;
  /**
    
     Creates a cryptographic token tied to a specific action, user, user session,
     and window of time.
    
     @since 2.0.3
     @since 4.0.0 Session tokens were integrated with nonce creation
    
     @param string|int $action Scalar value to add context to the nonce.
     @return string The token.
    
  **/
  public function wp_create_nonce(action:haxe.extern.EitherType<String, Int> = ''):String;
  /**
    
     Get salt to add to hashes.
    
     Salts are created using secret keys. Secret keys are located in two places:
     in the database and in the wp-config.php file. The secret key in the database
     is randomly generated and will be appended to the secret keys in wp-config.php.
    
     The secret keys in wp-config.php should be updated to strong, random keys to maximize
     security. Below is an example of how the secret key constants are defined.
     Do not paste this example directly into wp-config.php. Instead, have a
     {@link https://api.wordpress.org/secret-key/1.1/salt/ secret key created} just
     for you.
    
         define('AUTH_KEY',         ' Xakm<o xQy rw4EMsLKM-?!T+,PFF})H4lzcW57AF0U@N@< >M%G4Yt>f`z]MON');
         define('SECURE_AUTH_KEY',  'LzJ}op]mr|6+![P}Ak:uNdJCJZd>(Hx.-Mh#Tz)pCIU#uGEnfFz|f ;;eU%/U^O~');
         define('LOGGED_IN_KEY',    '|i|Ux`9<p-h$aFf(qnT:sDO:D1P^wZ$$/Ra@miTJi9G;ddp_<q}6H1)o|a +&JCM');
         define('NONCE_KEY',        '%:R{[P|,s.KuMltH5}cI;/k<Gx~j!f0I)m_sIyu+&NJZ)-iO>z7X>QYR0Z_XnZ@|');
         define('AUTH_SALT',        'eZyT)-Naw]F8CwA*VaW#q*|.)g@o}||wf~@C-YSt}(dh_r6EbI#A,y|nU2{B#JBW');
         define('SECURE_AUTH_SALT', '!=oLUTXh,QW=H `}`L|9/^4-3 STz},T(w}W<I`.JjPi)<Bmf1v,HpGe}T1:Xt7n');
         define('LOGGED_IN_SALT',   '+XSqHc;@Q*K_b|Z?NC[3H!!EONbh.n<+=uKR:>*c(u`g~EJBf#8u#R{mUEZrozmm');
         define('NONCE_SALT',       'h`GXHhD>SLWVfg1(1(N{;.V!MoE(SfbA_ksP@&`+AycHcAV$+?@3q+rxV{%^VyKT');
    
     Salting passwords helps against tools which has stored hashed values of
     common dictionary strings. The added values makes it harder to crack.
    
     @since 2.5.0
    
     @link https://api.wordpress.org/secret-key/1.1/salt/ Create secrets for wp-config.php
    
     @staticvar array $cached_salts
     @staticvar array $duplicated_keys
    
     @param string $scheme Authentication scheme (auth, secure_auth, logged_in, nonce)
     @return string Salt value
    
  **/
  public function wp_salt(scheme:String = 'auth'):String;
  /**
    
     Get hash of given string.
    
     @since 2.0.3
    
     @param string $data   Plain text to hash
     @param string $scheme Authentication scheme (auth, secure_auth, logged_in, nonce)
     @return string Hash of $data
    
  **/
  public function wp_hash(data:String, scheme:String = 'auth'):String;
  /**
    
     Create a hash (encrypt) of a plain text password.
    
     For integration with other applications, this function can be overwritten to
     instead use the other package password checking algorithm.
    
     @since 2.5.0
    
     @global PasswordHash $wp_hasher PHPass object
    
     @param string $password Plain text user password to hash
     @return string The hash string of the password
    
  **/
  public function wp_hash_password(password:String):String;
  /**
    
     Checks the plaintext password against the encrypted Password.
    
     Maintains compatibility between old version and the new cookie authentication
     protocol using PHPass library. The $hash parameter is the encrypted password
     and the function compares the plain text password when encrypted similarly
     against the already encrypted password to see if they match.
    
     For integration with other applications, this function can be overwritten to
     instead use the other package password checking algorithm.
    
     @since 2.5.0
    
     @global PasswordHash $wp_hasher PHPass object used for checking the password
      against the $hash + $password
     @uses PasswordHash::CheckPassword
    
     @param string     $password Plaintext user's password
     @param string     $hash     Hash of the user's password to check against.
     @param string|int $user_id  Optional. User ID.
     @return bool False, if the $password does not match the hashed password
    
  **/
  public function wp_check_password(password:String, hash:String, user_id:haxe.extern.EitherType<String, Int> = ''):Bool;
  /**
    
     Generates a random password drawn from the defined set of characters.
    
     Uses wp_rand() is used to create passwords with far less predictability
     than similar native PHP functions like `rand()` or `mt_rand()`.
    
     @since 2.5.0
    
     @param int  $length              Optional. The length of password to generate. Default 12.
     @param bool $special_chars       Optional. Whether to include standard special characters.
                                      Default true.
     @param bool $extra_special_chars Optional. Whether to include other special characters.
                                      Used when generating secret keys and salts. Default false.
     @return string The random password.
    
  **/
  public function wp_generate_password(length:Int = 12, special_chars:Bool = true, extra_special_chars:Bool = false):String;
  /**
    
     Generates a random number.
    
     @since 2.6.2
     @since 4.4.0 Uses PHP7 random_int() or the random_compat library if available.
    
     @global string $rnd_value
     @staticvar string $seed
     @staticvar bool $use_random_int_functionality
    
     @param int $min Lower limit for the generated number
     @param int $max Upper limit for the generated number
     @return int A random number between min and max
    
  **/
  public function wp_rand(min:Int = 0, max:Int = 0):Int;
  /**
    
     Updates the user's password with a new encrypted one.
    
     For integration with other applications, this function can be overwritten to
     instead use the other package password checking algorithm.
    
     Please note: This function should be used sparingly and is really only meant for single-time
     application. Leveraging this improperly in a plugin or theme could result in an endless loop
     of password resets if precautions are not taken to ensure it does not execute on every page load.
    
     @since 2.5.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string $password The plaintext new user password
     @param int    $user_id  User ID
    
  **/
  public function wp_set_password(password:String, user_id:Int):Void;
  /**
    
     Retrieve the avatar `<img>` tag for a user, email address, MD5 hash, comment, or post.
    
     @since 2.5.0
     @since 4.2.0 Optional `$args` parameter added.
    
     @param mixed $id_or_email The Gravatar to retrieve. Accepts a user_id, gravatar md5 hash,
                               user email, WP_User object, WP_Post object, or WP_Comment object.
     @param int    $size       Optional. Height and width of the avatar image file in pixels. Default 96.
     @param string $default    Optional. URL for the default image or a default type. Accepts '404'
                               (return a 404 instead of a default image), 'retro' (8bit), 'monsterid'
                               (monster), 'wavatar' (cartoon face), 'indenticon' (the "quilt"),
                               'mystery', 'mm', or 'mysteryman' (The Oyster Man), 'blank' (transparent GIF),
                               or 'gravatar_default' (the Gravatar logo). Default is the value of the
                               'avatar_default' option, with a fallback of 'mystery'.
     @param string $alt        Optional. Alternative text to use in &lt;img&gt; tag. Default empty.
     @param array  $args       {
         Optional. Extra arguments to retrieve the avatar.
    
         @type int          $height        Display height of the avatar in pixels. Defaults to $size.
         @type int          $width         Display width of the avatar in pixels. Defaults to $size.
         @type bool         $force_default Whether to always show the default image, never the Gravatar. Default false.
         @type string       $rating        What rating to display avatars up to. Accepts 'G', 'PG', 'R', 'X', and are
                                           judged in that order. Default is the value of the 'avatar_rating' option.
         @type string       $scheme        URL scheme to use. See set_url_scheme() for accepted values.
                                           Default null.
         @type array|string $class         Array or string of additional classes to add to the &lt;img&gt; element.
                                           Default null.
         @type bool         $force_display Whether to always show the avatar - ignores the show_avatars option.
                                           Default false.
         @type string       $extra_attr    HTML attributes to insert in the IMG element. Is not sanitized. Default empty.
     }
     @return false|string `<img>` tag for the user's avatar. False on failure.
    
  **/
  public function get_avatar(id_or_email:Dynamic, size:Int = 96, default_:String = '', alt:String = '', args:php.NativeStructArray<Dynamic> = null):haxe.extern.EitherType<Bool, String>;
  /**
    
     Displays a human readable HTML representation of the difference between two strings.
    
     The Diff is available for getting the changes between versions. The output is
     HTML, so the primary use is for displaying the changes. If the two strings
     are equivalent, then an empty string will be returned.
    
     The arguments supported and can be changed are listed below.
    
     'title' : Default is an empty string. Titles the diff in a manner compatible
          with the output.
     'title_left' : Default is an empty string. Change the HTML to the left of the
          title.
     'title_right' : Default is an empty string. Change the HTML to the right of
          the title.
    
     @since 2.6.0
    
     @see wp_parse_args() Used to change defaults to user defined settings.
     @uses Text_Diff
     @uses WP_Text_Diff_Renderer_Table
    
     @param string       $left_string  "old" (left) version of string
     @param string       $right_string "new" (right) version of string
     @param string|array $args         Optional. Change 'title', 'title_left', and 'title_right' defaults.
     @return string Empty string if strings are equivalent or HTML with differences.
    
  **/
  public function wp_text_diff(left_string:String, right_string:String, args:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = null):String;
}
