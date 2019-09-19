import wp.parser.*;
import haxe.io.Path;

class WpParser {
  
  public static function main() {
    var args = Sys.args();
    
    if (args.length != 1) {
      trace('Usage: [source]');
      return;
    }

    var src = args[0];
    var builder = new ApiBuilder(
      src,
      Path.join([ Sys.getCwd(), 'src/wp/extern' ])
    );
    builder.list();
  }

}