package wp.extern;

@:native("WP_MatchesMapRegex")
extern class MatchesMapRegex {
  /**
    
     store for mapping result
    
     @var string
    
  **/
  @:native("output") public var output:String;
  /**
    
     regexp pattern to match $matches[] references
    
     @var string
    
  **/
  @:native("_pattern") public var _pattern:String;
  /**
    
     constructor
    
     @param string $subject subject if regex
     @param array  $matches data to use in map
    
  **/
  public function new(subject:String, matches:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Substitute substring matches in subject.
    
     static helper function to ease use
    
     @param string $subject subject
     @param array  $matches data used for substitution
     @return string
    
  **/
  @:native("apply") public static function apply(subject:String, matches:php.NativeStructArray<Dynamic>):String;
  /**
    
     preg_replace_callback hook
    
     @param  array $matches preg_replace regexp matches
     @return string
    
  **/
  @:native("callback") public function callback(matches:php.NativeStructArray<Dynamic>):String;
}
