import wp.parser.*;
import haxe.Resource;
import haxe.io.Path;

class WpParser {
  
  public static function main() {
    var builder = new ApiBuilder(
      'C:\\MAMP\\htdocs\\comic\\wp-includes', // todo: rethink
      Path.join([ Sys.getCwd(), 'src/wp/extern' ])
    );
    builder.list();
  }

}