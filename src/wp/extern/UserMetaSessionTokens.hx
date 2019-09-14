package wp.extern;

@:native("WP_User_Meta_Session_Tokens")
extern class UserMetaSessionTokens {
  /**
    
     Destroys all sessions for all users.
    
     @since 4.0.0
    
  **/
  @:native("drop_sessions") public static function dropSessions():Void;
}
