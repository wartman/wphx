package wp.extern;

@:native("AtomParser")
extern class AtomParser {
  /**
    
     PHP5 constructor.
    
  **/
  public function new():Void;
  /**
    
     PHP4 constructor.
    
  **/
  @:native("AtomParser") public function AtomParser():Void;
  /**
    
     Map attributes to key="val"
    
     @param string $k Key
     @param string $v Value
     @return string
    
  **/
  @:native("map_attrs") public static function mapAttrs(k:String, v:String):String;
  /**
    
     Map XML namespace to string.
    
     @param indexish $p XML Namespace element index
     @param array $n Two-element array pair. [ 0 => {namespace}, 1 => {url} ]
     @return string 'xmlns="{url}"' or 'xmlns:{namespace}="{url}"'
    
  **/
  @:native("map_xmlns") public static function mapXmlns(p:indexish, n:php.NativeStructArray<Dynamic>):String;
}
