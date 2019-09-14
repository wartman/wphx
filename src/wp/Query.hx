package wp;

import php.SuperGlobal;
import wp.extern.Query as WpQuery;

@:forward
abstract Query(WpQuery) from WpQuery to WpQuery {
  
  public inline static function instance():Query {
    return (SuperGlobal.GLOBALS['wp_query']:WpQuery);
  }

  public inline function new(query) {
    this = new WpQuery(query);
  }

  public inline function iterator():Iterator<Post> {
    return new PostIterator(this);
  }

}
