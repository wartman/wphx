package wp.extern;

@:native("WP_Comment")
extern class Comment {
  /**
    
     Comment ID.
    
     @since 4.4.0
     @var int
    
  **/
  @:native("comment_ID") public var ID:Int;
  /**
    
     ID of the post the comment is associated with.
    
     @since 4.4.0
     @var int
    
  **/
  @:native("comment_post_ID") public var postID:Int;
  /**
    
     Comment author name.
    
     @since 4.4.0
     @var string
    
  **/
  @:native("comment_author") public var author:String;
  /**
    
     Comment author email address.
    
     @since 4.4.0
     @var string
    
  **/
  @:native("comment_author_email") public var authorEmail:String;
  /**
    
     Comment author URL.
    
     @since 4.4.0
     @var string
    
  **/
  @:native("comment_author_url") public var authorUrl:String;
  /**
    
     Comment author IP address (IPv4 format).
    
     @since 4.4.0
     @var string
    
  **/
  @:native("comment_author_IP") public var authorIP:String;
  /**
    
     Comment date in YYYY-MM-DD HH:MM:SS format.
    
     @since 4.4.0
     @var string
    
  **/
  @:native("comment_date") public var date:String;
  /**
    
     Comment GMT date in YYYY-MM-DD HH::MM:SS format.
    
     @since 4.4.0
     @var string
    
  **/
  @:native("comment_date_gmt") public var dateGmt:String;
  /**
    
     Comment content.
    
     @since 4.4.0
     @var string
    
  **/
  @:native("comment_content") public var content:String;
  /**
    
     Comment karma count.
    
     @since 4.4.0
     @var int
    
  **/
  @:native("comment_karma") public var karma:Int;
  /**
    
     Comment approval status.
    
     @since 4.4.0
     @var string
    
  **/
  @:native("comment_approved") public var approved:String;
  /**
    
     Comment author HTTP user agent.
    
     @since 4.4.0
     @var string
    
  **/
  @:native("comment_agent") public var agent:String;
  /**
    
     Comment type.
    
     @since 4.4.0
     @var string
    
  **/
  @:native("comment_type") public var type:String;
  /**
    
     Parent comment ID.
    
     @since 4.4.0
     @var int
    
  **/
  @:native("comment_parent") public var parent:Int;
  /**
    
     Comment author ID.
    
     @since 4.4.0
     @var int
    
  **/
  @:native("user_id") public var userId:Int;
  /**
    
     Retrieves a WP_Comment instance.
    
     @since 4.4.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int $id Comment ID.
     @return WP_Comment|false Comment object, otherwise false.
    
  **/
  @:native("get_instance") public static function getInstance(id:Int):haxe.extern.EitherType<wp.extern.Comment, Bool>;
  /**
    
     Constructor.
    
     Populates properties with object vars.
    
     @since 4.4.0
    
     @param WP_Comment $comment Comment object.
    
  **/
  public function new(comment:wp.extern.Comment):Void;
  /**
    
     Convert object to array.
    
     @since 4.4.0
    
     @return array Object as array.
    
  **/
  @:native("to_array") public function toArray():php.NativeArray;
  /**
    
     Get the children of a comment.
    
     @since 4.4.0
    
     @param array $args {
         Array of arguments used to pass to get_comments() and determine format.
    
         @type string $format        Return value format. 'tree' for a hierarchical tree, 'flat' for a flattened array.
                                     Default 'tree'.
         @type string $status        Comment status to limit results by. Accepts 'hold' (`comment_status=0`),
                                     'approve' (`comment_status=1`), 'all', or a custom comment status.
                                     Default 'all'.
         @type string $hierarchical  Whether to include comment descendants in the results.
                                     'threaded' returns a tree, with each comment's children
                                     stored in a `children` property on the `WP_Comment` object.
                                     'flat' returns a flat array of found comments plus their children.
                                     Pass `false` to leave out descendants.
                                     The parameter is ignored (forced to `false`) when `$fields` is 'ids' or 'counts'.
                                     Accepts 'threaded', 'flat', or false. Default: 'threaded'.
         @type string|array $orderby Comment status or array of statuses. To use 'meta_value'
                                     or 'meta_value_num', `$meta_key` must also be defined.
                                     To sort by a specific `$meta_query` clause, use that
                                     clause's array key. Accepts 'comment_agent',
                                     'comment_approved', 'comment_author',
                                     'comment_author_email', 'comment_author_IP',
                                     'comment_author_url', 'comment_content', 'comment_date',
                                     'comment_date_gmt', 'comment_ID', 'comment_karma',
                                     'comment_parent', 'comment_post_ID', 'comment_type',
                                     'user_id', 'comment__in', 'meta_value', 'meta_value_num',
                                     the value of $meta_key, and the array keys of
                                     `$meta_query`. Also accepts false, an empty array, or
                                     'none' to disable `ORDER BY` clause.
     }
     @return array Array of `WP_Comment` objects.
    
  **/
  @:native("get_children") public function getChildren(?args:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Add a child to the comment.
    
     Used by `WP_Comment_Query` when bulk-filling descendants.
    
     @since 4.4.0
    
     @param WP_Comment $child Child comment.
    
  **/
  @:native("add_child") public function addChild(child:wp.extern.Comment):Void;
  /**
    
     Get a child comment by ID.
    
     @since 4.4.0
    
     @param int $child_id ID of the child.
     @return WP_Comment|bool Returns the comment object if found, otherwise false.
    
  **/
  @:native("get_child") public function getChild(child_id:Int):haxe.extern.EitherType<wp.extern.Comment, Bool>;
  /**
    
     Set the 'populated_children' flag.
    
     This flag is important for ensuring that calling `get_children()` on a childless comment will not trigger
     unneeded database queries.
    
     @since 4.4.0
    
     @param bool $set Whether the comment's children have already been populated.
    
  **/
  @:native("populated_children") public function populatedChildren(set:Bool):Void;
  /**
    
     Check whether a non-public property is set.
    
     If `$name` matches a post field, the comment post will be loaded and the post's value checked.
    
     @since 4.4.0
    
     @param string $name Property name.
     @return bool
    
  **/
  @:native("__isset") public function __isset(name:String):Bool;
  /**
    
     Magic getter.
    
     If `$name` matches a post field, the comment post will be loaded and the post's value returned.
    
     @since 4.4.0
    
     @param string $name
     @return mixed
    
  **/
  @:native("__get") public function __get(name:String):Dynamic;
}
