package wp;

#if php
  import wp.api.PostApi;
#end
import wp.core.ApiConnection;
import wp.core.Repository;

// Todo: need to set this up to handle post types.

// @endpoint('wp-json/v2/wp/posts')
class PostRepository extends Repository<Post> {

  public function new(connection:ApiConnection) {
    url = 'wp-json/v2/wp/posts/';
    super(connection);
  }

  #if php
    override private function getSync(id:Int):Post {
      return PostApi.getPost(id);
    }
  #end

  override public function filter(data:Dynamic):Post {
    return cast data;
  }

}
