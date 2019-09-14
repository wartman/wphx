package wp.extern;

@:native("WP_Text_Diff_Renderer_inline")
extern class TextDiffRendererinline {
  /**
    
     @ignore
     @since 2.6.0
    
     @param string $string
     @param string $newlineEscape
     @return string
    
  **/
  @:native("_splitOnWords") public function _splitOnWords(string:String, newlineEscape:String = "\n"):String;
}
