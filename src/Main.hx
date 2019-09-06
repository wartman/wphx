using Wp;
using Lambda;

import wp.api.GeneralTemplateApi;

class Main {

  public static function main() {
    var init = new Action('init');
    init.add(_ -> {
      PostType.add('foo', {
        'public': true,
        'labels': {
          'name': 'Foos',
          'singular_name': 'Foo'
        },
        'supports': [
          'author',
          'title',
          'editor'
        ]
      }).registerMetaKey('foo', {
        type: 'string',
        show_in_rest: true
      });

      var posts = Post.find({
        'post_type': PostType.get('foo').name,
        'post_status': 'publish'
      });
      if (!posts.exists(p -> p.title == 'bar')) {
        var p:Post = Post.add({
          'post_title': 'bar',
          'post_content': '<p>Yay!</p>'
        }).markPublished();
        p.addMeta('foo', 'bar');
        var foo = p.getMeta('foo');
      }

    });
  }

}
