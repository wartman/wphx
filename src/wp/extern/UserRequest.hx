package wp.extern;

@:native("WP_User_Request")
extern class UserRequest {
  /**
    
     Request ID.
    
     @var int
    
  **/
  @:native("ID") public var id:Int;
  /**
    
     User ID.
    
     @var int
    
  **/
  @:native("user_id") public var userId:Int;
  /**
    
     User email.
    
     @var int
    
  **/
  @:native("email") public var email:Int;
  /**
    
     Action name.
    
     @var string
    
  **/
  @:native("action_name") public var actionName:String;
  /**
    
     Current status.
    
     @var string
    
  **/
  @:native("status") public var status:String;
  /**
    
     Timestamp this request was created.
    
     @var int|null
    
  **/
  @:native("created_timestamp") public var createdTimestamp:Int;
  /**
    
     Timestamp this request was last modified.
    
     @var int|null
    
  **/
  @:native("modified_timestamp") public var modifiedTimestamp:Int;
  /**
    
     Timestamp this request was confirmed.
    
     @var int
    
  **/
  @:native("confirmed_timestamp") public var confirmedTimestamp:Int;
  /**
    
     Timestamp this request was completed.
    
     @var int
    
  **/
  @:native("completed_timestamp") public var completedTimestamp:Int;
  /**
    
     Misc data assigned to this request.
    
     @var array
    
  **/
  @:native("request_data") public var requestData:php.NativeStructArray<Dynamic>;
  /**
    
     Key used to confirm this request.
    
     @var string
    
  **/
  @:native("confirm_key") public var confirmKey:String;
  /**
    
     Constructor.
    
     @since 4.9.6
    
     @param WP_Post|object $post Post object.
    
  **/
  public function new(post:haxe.extern.EitherType<wp.extern.Post, Dynamic>):Void;
}
