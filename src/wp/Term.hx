package wp;

import php.NativeArray;
import haxe.extern.EitherType;

@:native('WP_Term')
extern class Term {
  @:native('term_id') public var id:Int;
  public var name:String;
  public var slug:String;
  @:native('term_group') public var termGroup:String;
  @:native('term_taxonomy_id') public var termTaxonomyId:Int;
  public var taxonomy:String;
  public var description:String;
  public var parent:Int;
  public var count:Int;
  public var filter:String;
  @:native('get_instance')
  public static function getInstance(term_id:Int, taxonomy:String = ''):EitherType<WpError, Term>;
  public function new(term:Dynamic):Void;
  @:native('filter') public function getFilter(filter:String):Void;
  @:native('to_array') public function toArray():NativeArray;
}
