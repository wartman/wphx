package wp;

import haxe.extern.EitherType;

@:native('WP_Error')
extern class WpError {

  public var errors:ArrayAccess<String>;
  @:native('error_data') public var errorData:ArrayAccess<String>;

  public function new(code:EitherType<Int, String> = '', message:String = '', data:Dynamic = '');

  @:native('get_error_codes')
  public function getErrorCodes():Array<String>;

  @:native('get_error_code')
  public function getErrorCode():EitherType<String, Int>;

  @:native('get_error_messages')
  public function getErrorMessages():Array<String>;

  @:native('get_error_message')
  public function getErrorMessage(code:EitherType<String, Int> = ''):String;

  @:native('get_error_data')
  public function getErrorData(code:EitherType<String, Int> = ''):Dynamic;

  @:native('has_errors')
  public function hasErrors():Bool;

  public function add(code:EitherType<String, Int>, message:String, data:Dynamic):Void;

  @:native('add_data')
  public function addData(data:Dynamic, code:EitherType<String, Int> = ''):Void;

  public function remove(code:EitherType<String, Int>):Void;

}
