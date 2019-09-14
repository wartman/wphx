package wp.parser;

import sys.io.File;
import sys.FileSystem;

using haxe.io.Path;
using StringTools;
using wp.parser.NameTools;

class ApiBuilder {

  final root:String;
  final dest:String;

  public function new(root:String, dest:String) {
    this.root = root;
    this.dest = dest;
  }

  public function list() {
    var files = FileSystem.readDirectory(root);
    for (name in files) {
      var path = Path.join([ root, name ]);
      if (
        name.startsWith('class.') 
        || name.startsWith('functions.') 
        || path.extension() == 'php'
      ) {
        var content = File.getContent(path);
        var parser = new Parser(content);
        var ast = parser.parse();
        var generator = new Generator(ast, name);
        var output = generator.generate();
        for (item in output) {
          File.saveContent(
            Path.join([ dest, item.name ]).withExtension('hx'),
            item.content
          );
        }
      }
    }
  }

}