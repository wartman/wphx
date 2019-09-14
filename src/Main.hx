import wp.Action;
import wp.Post;
import wp.PostType;
import wp.Query;
import wp.Theme;

using Lambda;
using wp.util.OutcomeTools;

class Main {

  public static function main() {
    Theme.init.add(_ -> {
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
        }).markPublished();
        p.addMeta('foo', 'bar');
        var foo = p.getMeta('foo');
      }

    });

    var q = new Query({
      posts_per_page: 12
    });
    for (post in q) {
      trace(post);
    }
  }

}
