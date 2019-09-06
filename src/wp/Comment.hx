package wp;

import php.NativeArray;
import php.NativeStructArray;
import haxe.extern.EitherType;

@:native('Wp_Comment')
extern class Comment {
  @:native('comment_ID') public var id:Int;
  @:native('comment_post_ID') public var postId:Int;
  @:native('comment_author') public var author:String;
  @:native('comment_author_email') public var authorEmail:String;
  @:native('comment_author_url') public var authorUrl:String;
  @:native('comment_author_IP') public var authorIp:String;
  @:native('comment_date') public var date:String;
  @:native('comment_date_gmt') public var dateGmt:String;
  @:native('comment_content') public var content:String;
  @:native('comment_karma') public var karma:Int;
  @:native('comment_approved') public var approved:String;
  @:native('comment_agent') public var agent:String;
  @:native('comment_type') public var type:String;
  @:native('comment_parent') public var parent:Int;
  @:native('user_id') public var userId:Int;
  @:native('get_instance') public static function getInstance(id:Int):EitherType<Comment, Bool>;
  public function new(comment:Dynamic);
  @:native('to_array') public function toArray():NativeArray;
  @:native('get_children') public function getChildren(args:NativeStructArray<Dynamic>):Array<Comment>;
  @:native('add_child') public function addChild(child:Comment):Void;
  @:native('get_child') public function getChild(childId:Int):EitherType<Comment, Bool>;
  @:native('populated_children') public function populatedChildren(set:Bool):Void;
}
