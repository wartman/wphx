using Wp;
using Lambda;

import wp.api.GeneralTemplateApi;

using tink.CoreApi;

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
      }).sure().registerMetaKey('foo', {
        type: 'string',
        show_in_rest: true
      });

      Post.add({
        post_title: 'foo',
        post_content: '<p>bar</p>',
        post_type: PostType.get('foo').name
      });

      var posts = Post.find({
        'post_type': PostType.get('foo').name,
        'post_status': 'publish'
      });
      if (!posts.exists(p -> p.title == 'bar')) {
        var p:Post = Post.add({
          'post_title': 'bar',
          'post_content': '<p>Yay!</p>'
        }).sure().markPublished();
        p.addMeta('foo', 'bar');
        var foo = p.getMeta('foo');
      }

    });
  }

}
