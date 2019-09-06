package wp;

class PostIterator {
  
  final query:Query;

  public function new(query:Query) {
    this.query = query;
  }

  public function hasNext():Bool {
    if (!query.havePosts()) {
      query.rewindPosts();
      return false;
    }
    query.thePost();
    return true;
  }

  public function next():Post {
    return query.post;
  }

}
