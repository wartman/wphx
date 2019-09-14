package wp.extern;

extern class PluggableDeprecatedApi implements wp.util.ApiFunctions {
  /**
    
     Changes the current user by ID or name.
    
     Set $id to null and specify a name if you do not know a user's ID.
    
     @since 2.0.1
     @deprecated 3.0.0 Use wp_set_current_user()
     @see wp_set_current_user()
    
     @param int|null $id User ID.
     @param string $name Optional. The user's username
     @return WP_User returns wp_set_current_user()
    
  **/
  public function set_current_user(id:Int, name:String = ''):wp.extern.User;
  /**
    
     Populate global variables with information about the currently logged in user.
    
     @since 0.71
     @deprecated 4.5.0 Use wp_get_current_user()
     @see wp_get_current_user()
    
     @return bool|WP_User False on XMLRPC Request and invalid auth cookie, WP_User instance otherwise.
    
  **/
  public function get_currentuserinfo():haxe.extern.EitherType<Bool, wp.extern.User>;
  /**
    
     Retrieve user info by login name.
    
     @since 0.71
     @deprecated 3.3.0 Use get_user_by()
     @see get_user_by()
    
     @param string $user_login User's username
     @return bool|object False on failure, User DB row object
    
  **/
  public function get_userdatabylogin(user_login:String):haxe.extern.EitherType<Bool, Dynamic>;
  /**
    
     Retrieve user info by email.
    
     @since 2.5.0
     @deprecated 3.3.0 Use get_user_by()
     @see get_user_by()
    
     @param string $email User's email address
     @return bool|object False on failure, User DB row object
    
  **/
  public function get_user_by_email(email:String):haxe.extern.EitherType<Bool, Dynamic>;
  /**
    
     Sets a cookie for a user who just logged in. This function is deprecated.
    
     @since 1.5.0
     @deprecated 2.5.0 Use wp_set_auth_cookie()
     @see wp_set_auth_cookie()
    
     @param string $username The user's username
     @param string $password Optional. The user's password
     @param bool $already_md5 Optional. Whether the password has already been through MD5
     @param string $home Optional. Will be used instead of COOKIEPATH if set
     @param string $siteurl Optional. Will be used instead of SITECOOKIEPATH if set
     @param bool $remember Optional. Remember that the user is logged in
    
  **/
  public function wp_setcookie(username:String, password:String = '', already_md5:Bool = false, home:String = '', siteurl:String = '', remember:Bool = false):Void;
  /**
    
     Clears the authentication cookie, logging the user out. This function is deprecated.
    
     @since 1.5.0
     @deprecated 2.5.0 Use wp_clear_auth_cookie()
     @see wp_clear_auth_cookie()
    
  **/
  public function wp_clearcookie():Void;
  /**
    
     Gets the user cookie login. This function is deprecated.
    
     This function is deprecated and should no longer be extended as it won't be
     used anywhere in WordPress. Also, plugins shouldn't use it either.
    
     @since 2.0.3
     @deprecated 2.5.0
    
     @return bool Always returns false
    
  **/
  public function wp_get_cookie_login():Bool;
  /**
    
     Checks a users login information and logs them in if it checks out. This function is deprecated.
    
     Use the global $error to get the reason why the login failed. If the username
     is blank, no error will be set, so assume blank username on that case.
    
     Plugins extending this function should also provide the global $error and set
     what the error is, so that those checking the global for why there was a
     failure can utilize it later.
    
     @since 1.2.2
     @deprecated 2.5.0 Use wp_signon()
     @see wp_signon()
    
     @global string $error Error when false is returned
    
     @param string $username   User's username
     @param string $password   User's password
     @param string $deprecated Not used
     @return bool False on login failure, true on successful check
    
  **/
  public function wp_login(username:String, password:String, deprecated:String = ''):Bool;
}
