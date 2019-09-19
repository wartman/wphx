package wp;

import php.NativeArray;
import wp.extern.Comment as WpComment;

@:forward
abstract Comment(WpComment) from WpComment to WpComment {
  
  public function getFilteredContent() {
    var getText = new Filter('get_comment_text');
    var finalFilter = new Filter('comment_text');
    return finalFilter.dispatch(getText.dispatch(this.content));
  }

}
