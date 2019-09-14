package wp.extern;

@:native("WP_Text_Diff_Renderer_Table")
extern class TextDiffRendererTable {
  /**
    
     @see Text_Diff_Renderer::_leading_context_lines
     @var int
     @since 2.6.0
    
  **/
  @:native("_leading_context_lines") public var _leadingContextLines:Int;
  /**
    
     @see Text_Diff_Renderer::_trailing_context_lines
     @var int
     @since 2.6.0
    
  **/
  @:native("_trailing_context_lines") public var _trailingContextLines:Int;
  /**
    
     Constructor - Call parent constructor with params array.
    
     This will set class properties based on the key value pairs in the array.
    
     @since 2.6.0
    
     @param array $params
    
  **/
  public function new(?params:php.NativeStructArray<Dynamic>):Void;
  /**
    
     @ignore
    
     @param string $header
     @return string
    
  **/
  @:native("_startBlock") public function _startBlock(header:String):String;
  /**
    
     @ignore
    
     @param array $lines
     @param string $prefix
    
  **/
  @:native("_lines") public function _lines(lines:php.NativeStructArray<Dynamic>, prefix:String = ' '):Void;
  /**
    
     @ignore
    
     @param string $line HTML-escape the value.
     @return string
    
  **/
  @:native("addedLine") public function addedLine(line:String):String;
  /**
    
     @ignore
    
     @param string $line HTML-escape the value.
     @return string
    
  **/
  @:native("deletedLine") public function deletedLine(line:String):String;
  /**
    
     @ignore
    
     @param string $line HTML-escape the value.
     @return string
    
  **/
  @:native("contextLine") public function contextLine(line:String):String;
  /**
    
     @ignore
    
     @return string
    
  **/
  @:native("emptyLine") public function emptyLine():String;
  /**
    
     @ignore
    
     @param array $lines
     @param bool $encode
     @return string
    
  **/
  @:native("_added") public function _added(lines:php.NativeStructArray<Dynamic>, encode:Bool = true):String;
  /**
    
     @ignore
    
     @param array $lines
     @param bool $encode
     @return string
    
  **/
  @:native("_deleted") public function _deleted(lines:php.NativeStructArray<Dynamic>, encode:Bool = true):String;
  /**
    
     @ignore
    
     @param array $lines
     @param bool $encode
     @return string
    
  **/
  @:native("_context") public function _context(lines:php.NativeStructArray<Dynamic>, encode:Bool = true):String;
  /**
    
     Process changed lines to do word-by-word diffs for extra highlighting.
    
     (TRAC style) sometimes these lines can actually be deleted or added rows.
     We do additional processing to figure that out
    
     @since 2.6.0
    
     @param array $orig
     @param array $final
     @return string
    
  **/
  @:native("_changed") public function _changed(orig:php.NativeStructArray<Dynamic>, final:php.NativeStructArray<Dynamic>):String;
  /**
    
     Takes changed blocks and matches which rows in orig turned into which rows in final.
    
     @since 2.6.0
    
     @param array $orig  Lines of the original version of the text.
     @param array $final Lines of the final version of the text.
     @return array {
        Array containing results of comparing the original text to the final text.
    
        @type array $orig_matches  Associative array of original matches. Index == row
                                   number of `$orig`, value == corresponding row number
                                   of that same line in `$final` or 'x' if there is no
                                   corresponding row (indicating it is a deleted line).
        @type array $final_matches Associative array of final matches. Index == row
                                   number of `$final`, value == corresponding row number
                                   of that same line in `$orig` or 'x' if there is no
                                   corresponding row (indicating it is a new line).
        @type array $orig_rows     Associative array of interleaved rows of `$orig` with
                                   blanks to keep matches aligned with side-by-side diff
                                   of `$final`. A value >= 0 corresponds to index of `$orig`.
                                   Value < 0 indicates a blank row.
        @type array $final_rows    Associative array of interleaved rows of `$final` with
                                   blanks to keep matches aligned with side-by-side diff
                                   of `$orig`. A value >= 0 corresponds to index of `$final`.
                                   Value < 0 indicates a blank row.
     }
    
  **/
  @:native("interleave_changed_lines") public function interleaveChangedLines(orig:php.NativeStructArray<Dynamic>, final:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Computes a number that is intended to reflect the "distance" between two strings.
    
     @since 2.6.0
    
     @param string $string1
     @param string $string2
     @return int
    
  **/
  @:native("compute_string_distance") public function computeStringDistance(string1:String, string2:String):Int;
  /**
    
     @ignore
     @since 2.6.0
    
     @param int $a
     @param int $b
     @return int
    
  **/
  @:native("difference") public function difference(a:Int, b:Int):Int;
  /**
    
     Make private properties readable for backward compatibility.
    
     @since 4.0.0
    
     @param string $name Property to get.
     @return mixed Property.
    
  **/
  @:native("__get") public function __get(name:String):Dynamic;
  /**
    
     Make private properties settable for backward compatibility.
    
     @since 4.0.0
    
     @param string $name  Property to check if set.
     @param mixed  $value Property value.
     @return mixed Newly-set property.
    
  **/
  @:native("__set") public function __set(name:String, value:Dynamic):Dynamic;
  /**
    
     Make private properties checkable for backward compatibility.
    
     @since 4.0.0
    
     @param string $name Property to check if set.
     @return bool Whether the property is set.
    
  **/
  @:native("__isset") public function __isset(name:String):Bool;
  /**
    
     Make private properties un-settable for backward compatibility.
    
     @since 4.0.0
    
     @param string $name Property to unset.
    
  **/
  @:native("__unset") public function __unset(name:String):Void;
}
