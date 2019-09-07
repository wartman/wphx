package wp.api;

import php.NativeStructArray;
import php.NativeArray;
import haxe.extern.EitherType;
import wp.Styles;

// For: wp-includes/functions.wp-styles.php
extern class StylesApi implements Api {
  function wp_styles():Styles;
  function wp_print_styles(handles:EitherType<String, EitherType<Bool, NativeArray>> = false):NativeArray;
  function wp_add_inline_style(handle:String, data:String):Bool;
  function wp_register_style(handle:String, src:EitherType<String, Bool>, ?deps:NativeArray, ?ver:EitherType<Bool, String>, ?media:String):Bool;
  function wp_deregister_style(handle:String):Void;
  function wp_enqueue_style(handle:String, src:String = '', deps:NativeArray, ?ver:EitherType<Bool, String> = false, media:String = 'all'):Void;
  function wp_dequeue_style(handle:String):Void;
  function wp_style_is(handle:String, list:String = 'enqueued'):Bool;
  function wp_style_add_data(handle:String, key:String, value:Dynamic):Bool;
}
