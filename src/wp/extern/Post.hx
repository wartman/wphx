package wp.extern;

@:native("WP_Post")
extern class Post {
  /**
    
     Post ID.
    
     @since 3.5.0
     @var int
    
  **/
  @:native("ID") public var id:Int;
  /**
    
     ID of post author.
    
     A numeric string, for compatibility reasons.
    
     @since 3.5.0
     @var string
    
  **/
  @:native("post_author") public var author:String;
  /**
    
     The post's local publication time.
    
     @since 3.5.0
     @var string
    
  **/
  @:native("post_date") public var date:String;
  /**
    
     The post's GMT publication time.
    
     @since 3.5.0
     @var string
    
  **/
  @:native("post_date_gmt") public var dateGmt:String;
  /**
    
     The post's content.
    
     @since 3.5.0
     @var string
    
  **/
  @:native("post_content") public var content:String;
  /**
    
     The post's title.
    
     @since 3.5.0
     @var string
    
  **/
  @:native("post_title") public var title:String;
  /**
    
     The post's excerpt.
    
     @since 3.5.0
     @var string
    
  **/
  @:native("post_excerpt") public var excerpt:String;
  /**
    
     The post's status.
    
     @since 3.5.0
     @var string
    
  **/
  @:native("post_status") public var status:String;
  /**
    
     Whether comments are allowed.
    
     @since 3.5.0
     @var string
    
  **/
  @:native("comment_status") public var commentStatus:String;
  /**
    
     Whether pings are allowed.
    
     @since 3.5.0
     @var string
    
  **/
  @:native("ping_status") public var pingStatus:String;
  /**
    
     The post's password in plain text.
    
     @since 3.5.0
     @var string
    
  **/
  @:native("post_password") public var password:String;
  /**
    
     The post's slug.
    
     @since 3.5.0
     @var string
    
  **/
  @:native("post_name") public var name:String;
  /**
    
     URLs queued to be pinged.
    
     @since 3.5.0
     @var string
    
  **/
  @:native("to_ping") public var toPing:String;
  /**
    
     URLs that have been pinged.
    
     @since 3.5.0
     @var string
    
  **/
  @:native("pinged") public var pinged:String;
  /**
    
     The post's local modified time.
    
     @since 3.5.0
     @var string
    
  **/
  @:native("post_modified") public var modified:String;
  /**
    
     The post's GMT modified time.
    
     @since 3.5.0
     @var string
    
  **/
  @:native("post_modified_gmt") public var modifiedGmt:String;
  /**
    
     A utility DB field for post content.
    
     @since 3.5.0
     @var string
    
  **/
  @:native("post_content_filtered") public var contentFiltered:String;
  /**
    
     ID of a post's parent post.
    
     @since 3.5.0
     @var int
    
  **/
  @:native("post_parent") public var parent:Int;
  /**
    
     The unique identifier for a post, not necessarily a URL, used as the feed GUID.
    
     @since 3.5.0
     @var string
    
  **/
  @:native("guid") public var guid:String;
  /**
    
     A field used for ordering posts.
    
     @since 3.5.0
     @var int
    
  **/
  @:native("menu_order") public var menuOrder:Int;
  /**
    
     The post's type, like post or page.
    
     @since 3.5.0
     @var string
    
  **/
  @:native("post_type") public var type:String;
  /**
    
     An attachment's mime type.
    
     @since 3.5.0
     @var string
    
  **/
  @:native("post_mime_type") public var mimeType:String;
  /**
    
     Cached comment count.
    
     A numeric string, for compatibility reasons.
    
     @since 3.5.0
     @var string
    
  **/
  @:native("comment_count") public var commentCount:String;
  /**
    
     Stores the post object's sanitization level.
    
     Does not correspond to a DB field.
    
     @since 3.5.0
     @var string
    
  **/
  @:native("filter") public var filter:String;
  /**
    
     Retrieve WP_Post instance.
    
     @since 3.5.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int $post_id Post ID.
     @return WP_Post|false Post object, false otherwise.
    
  **/
  @:native("get_instance") public static function getInstance(post_id:Int):haxe.extern.EitherType<wp.extern.Post, Bool>;
  /**
    
     Constructor.
    
     @since 3.5.0
    
     @param WP_Post|object $post Post object.
    
  **/
  public function new(post:haxe.extern.EitherType<wp.extern.Post, Dynamic>):Void;
  /**
    
     Isset-er.
    
     @since 3.5.0
    
     @param string $key Property to check if set.
     @return bool
    
  **/
  @:native("__isset") public function __isset(key:String):Bool;
  /**
    
     Getter.
    
     @since 3.5.0
    
     @param string $key Key to get.
     @return mixed
    
  **/
  @:native("__get") public function __get(key:String):Dynamic;
  /**
    
     {@Missing Summary}
    
     @since 3.5.0
    
     @param string $filter Filter.
     @return array|bool|object|WP_Post
    
  **/
  @:native("filter") public function getFilter(filter:String):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, haxe.extern.EitherType<Bool, haxe.extern.EitherType<Dynamic, wp.extern.Post>>>;
  /**
    
     Convert object to array.
    
     @since 3.5.0
    
     @return array Object as array.
    
  **/
  @:native("to_array") public function toArray():php.NativeArray;
}
