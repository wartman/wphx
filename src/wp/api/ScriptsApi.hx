package wp.api;

import php.NativeStructArray;
import php.NativeArray;
import haxe.extern.EitherType;
import wp.Scripts;

// For: wp-includes/functions.wp-scripts.php
extern class ScriptsApi implements Api {
  function wp_scripts():Scripts;
  function wp_print_scripts(handles:EitherType<Bool, EitherType<String, NativeArray>> = false):NativeArray;
  function wp_add_inline_script(handle:String, data:String, position:String = 'after'):Bool;
  function wp_register_script(handle:String, src:String, deps:NativeArray, ver:Null<EitherType<String, Bool>> = false, inFooter:Bool = false):Bool;
  function wp_localize_script(handle:String, name:String, data:NativeStructArray<Dynamic>):Bool;
  function wp_deregister_script(handle:String):Void;
  function wp_enqueue_script(handle:String, src:String = '', deps:NativeArray, ver:Null<EitherType<String, Bool>> = false, inFooter:Bool = false):Void;
  function wp_dequeue_script(handle:String):Void;
  function wp_script_is(handle:String, list:String = 'enqueued'):Bool;
  function wp_script_add_data(handle:String, key:String, value:Dynamic):Bool;
}
