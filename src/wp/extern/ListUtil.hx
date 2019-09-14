package wp.extern;

@:native("WP_List_Util")
extern class ListUtil {
  /**
    
     Constructor.
    
     Sets the input array.
    
     @since 4.7.0
    
     @param array $input Array to perform operations on.
    
  **/
  public function new(input:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Returns the original input array.
    
     @since 4.7.0
    
     @return array The input array.
    
  **/
  @:native("get_input") public function getInput():php.NativeArray;
  /**
    
     Returns the output array.
    
     @since 4.7.0
    
     @return array The output array.
    
  **/
  @:native("get_output") public function getOutput():php.NativeArray;
  /**
    
     Filters the list, based on a set of key => value arguments.
    
     @since 4.7.0
    
     @param array  $args     Optional. An array of key => value arguments to match
                             against each object. Default empty array.
     @param string $operator Optional. The logical operation to perform. 'AND' means
                             all elements from the array must match. 'OR' means only
                             one element needs to match. 'NOT' means no elements may
                             match. Default 'AND'.
     @return array Array of found values.
    
  **/
  @:native("filter") public function filter(?args:php.NativeStructArray<Dynamic>, ?operator_:String):php.NativeArray;
  /**
    
     Plucks a certain field out of each object in the list.
    
     This has the same functionality and prototype of
     array_column() (PHP 5.5) but also supports objects.
    
     @since 4.7.0
    
     @param int|string $field     Field from the object to place instead of the entire object
     @param int|string $index_key Optional. Field from the object to use as keys for the new array.
                                  Default null.
     @return array Array of found values. If `$index_key` is set, an array of found values with keys
                   corresponding to `$index_key`. If `$index_key` is null, array keys from the original
                   `$list` will be preserved in the results.
    
  **/
  @:native("pluck") public function pluck(field:haxe.extern.EitherType<Int, String>, index_key:haxe.extern.EitherType<Int, String> = null):php.NativeArray;
  /**
    
     Sorts the list, based on one or more orderby arguments.
    
     @since 4.7.0
    
     @param string|array $orderby       Optional. Either the field name to order by or an array
                                        of multiple orderby fields as $orderby => $order.
     @param string       $order         Optional. Either 'ASC' or 'DESC'. Only used if $orderby
                                        is a string.
     @param bool         $preserve_keys Optional. Whether to preserve keys. Default false.
     @return array The sorted array.
    
  **/
  @:native("sort") public function sort(?orderby:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>, ?order:String, preserve_keys:Bool = false):php.NativeArray;
}
