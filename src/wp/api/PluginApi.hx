package wp.api;

import php.NativeArray;
import haxe.extern.EitherType;
import haxe.extern.Rest;

// For wp-includes/plugin.php
extern class PluginApi implements Api {
  function add_filter(tag:String, cb:Dynamic, priority:Int = 10, acceptedArgs:Int=1):Bool;
  function has_filter(tag:String, ?cb:Dynamic):Bool;
  function apply_filters(tag:String, value:Rest<Dynamic>):Dynamic;
  function apply_filters_ref_array(tag:String, args:NativeArray):Dynamic;
  function remove_filter(tag:String, cb:Dynamic, priority:Int = 10):Bool;
  function remove_all_filters(tag:String, priority:EitherType<Int, Bool> = false):Bool;
  function current_filter():String;
  function current_action():String;
  function doing_filter(?filter:String):Bool;
  function doing_atcion(?action:String):Bool;
  function add_action(tag:String, cb:Dynamic, priority:Int=10, acceptedArgs:Int=1):Bool;
  function do_action(tag:String, arg:Rest<Dynamic>):Void;
  function do_action_ref_array(tag:String, args:NativeArray):Void;
  function did_action(tag:String):Int;
  function has_action(tag:String, cb:Dynamic = false):EitherType<Bool, Int>;
  function remove_action(tag:String, cb:Dynamic, priority:Int=10):Bool;
  function remove_all_actions(tag:String, priority:EitherType<Int, Bool>):Bool;
  function plugin_basename(file:String):String;
  function wp_register_plugin_realpath(file:String):Bool;
  function plugin_dir_path(file:String):String;
  function plugin_dir_url(file:String):String;
  function register_activation_hook(file:String, cb:Dynamic):Void;
  function register_deactivation_hook(file:String, cb:Dynamic):Void;
  function register_uninstall_hook(file:String, cb:Dynamic):Void;
}
