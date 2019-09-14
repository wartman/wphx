package wp.extern;

extern class WpSessionTokens implements wp.util.ApiFunctions {
  /**
    
     Retrieves a session manager instance for a user.
    
     This method contains a {@see 'session_token_manager'} filter, allowing a plugin to swap out
     the session manager for a subclass of `WP_Session_Tokens`.
    
     @since 4.0.0
    
     @param int $user_id User whose session to manage.
     @return WP_Session_Tokens The session object, which is by default an instance of
                               the `WP_User_Meta_Session_Tokens` class.
    
  **/
  public static function get_instance(user_id:Int):wp.extern.SessionTokens;
  /**
    
     Retrieves a user's session for the given token.
    
     @since 4.0.0
    
     @param string $token Session token.
     @return array|null The session, or null if it does not exist.
    
  **/
  public function get(token:String):php.NativeArray;
  /**
    
     Validates the given session token for authenticity and validity.
    
     Checks that the given token is present and hasn't expired.
    
     @since 4.0.0
    
     @param string $token Token to verify.
     @return bool Whether the token is valid for the user.
    
  **/
  public function verify(token:String):Bool;
  /**
    
     Generates a session token and attaches session information to it.
    
     A session token is a long, random string. It is used in a cookie
     to link that cookie to an expiration time and to ensure the cookie
     becomes invalidated when the user logs out.
    
     This function generates a token and stores it with the associated
     expiration time (and potentially other session information via the
     {@see 'attach_session_information'} filter).
    
     @since 4.0.0
    
     @param int $expiration Session expiration timestamp.
     @return string Session token.
    
  **/
  public function create(expiration:Int):String;
  /**
    
     Updates the data for the session with the given token.
    
     @since 4.0.0
    
     @param string $token Session token to update.
     @param array  $session Session information.
    
  **/
  public function update(token:String, session:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Destroys the session with the given token.
    
     @since 4.0.0
    
     @param string $token Session token to destroy.
    
  **/
  public function destroy(token:String):Void;
  /**
    
     Destroys all sessions for this user except the one with the given token (presumably the one in use).
    
     @since 4.0.0
    
     @param string $token_to_keep Session token to keep.
    
  **/
  public function destroy_others(token_to_keep:String):Void;
  /**
    
     Destroys all sessions for a user.
    
     @since 4.0.0
    
  **/
  public function destroy_all():Void;
  /**
    
     Destroys all sessions for all users.
    
     @since 4.0.0
    
  **/
  public static function destroy_all_for_all_users():Void;
  /**
    
     Retrieves all sessions for a user.
    
     @since 4.0.0
    
     @return array Sessions for a user.
    
  **/
  public function get_all():php.NativeArray;
  /**
    
     Destroys all sessions for all users.
    
     @since 4.0.0
    
  **/
  public static function drop_sessions():Void;
}
