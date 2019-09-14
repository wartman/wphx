package wp.extern;

extern class RevisionApi implements wp.util.ApiFunctions {
  /**
    
     Determines which fields of posts are to be saved in revisions.
    
     @since 2.6.0
     @since 4.5.0 A `WP_Post` object can now be passed to the `$post` parameter.
     @since 4.5.0 The optional `$autosave` parameter was deprecated and renamed to `$deprecated`.
     @access private
    
     @staticvar array $fields
    
     @param array|WP_Post $post       Optional. A post array or a WP_Post object being processed
                                      for insertion as a post revision. Default empty array.
     @param bool          $deprecated Not used.
     @return array Array of fields that can be versioned.
    
  **/
  public function _wp_post_revision_fields(?post:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, wp.extern.Post>, deprecated:Bool = false):php.NativeArray;
  /**
    
     Returns a post array ready to be inserted into the posts table as a post revision.
    
     @since 4.5.0
     @access private
    
     @param array|WP_Post $post     Optional. A post array or a WP_Post object to be processed
                                    for insertion as a post revision. Default empty array.
     @param bool          $autosave Optional. Is the revision an autosave? Default false.
     @return array Post array ready to be inserted as a post revision.
    
  **/
  public function _wp_post_revision_data(?post:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, wp.extern.Post>, autosave:Bool = false):php.NativeArray;
  /**
    
     Creates a revision for the current version of a post.
    
     Typically used immediately after a post update, as every update is a revision,
     and the most recent revision always matches the current post.
    
     @since 2.6.0
    
     @param int $post_id The ID of the post to save as a revision.
     @return int|WP_Error|void Void or 0 if error, new revision ID, if success.
    
  **/
  public function wp_save_post_revision(post_id:Int):haxe.extern.EitherType<Int, wp.extern.Error>;
  /**
    
     Retrieve the autosaved data of the specified post.
    
     Returns a post object containing the information that was autosaved for the
     specified post. If the optional $user_id is passed, returns the autosave for that user
     otherwise returns the latest autosave.
    
     @since 2.6.0
    
     @param int $post_id The post ID.
     @param int $user_id Optional The post author ID.
     @return WP_Post|false The autosaved data or false on failure or when no autosave exists.
    
  **/
  public function wp_get_post_autosave(post_id:Int, user_id:Int = 0):haxe.extern.EitherType<wp.extern.Post, Bool>;
  /**
    
     Determines if the specified post is a revision.
    
     @since 2.6.0
    
     @param int|WP_Post $post Post ID or post object.
     @return false|int False if not a revision, ID of revision's parent otherwise.
    
  **/
  public function wp_is_post_revision(post:haxe.extern.EitherType<Int, wp.extern.Post>):haxe.extern.EitherType<Bool, Int>;
  /**
    
     Determines if the specified post is an autosave.
    
     @since 2.6.0
    
     @param int|WP_Post $post Post ID or post object.
     @return false|int False if not a revision, ID of autosave's parent otherwise
    
  **/
  public function wp_is_post_autosave(post:haxe.extern.EitherType<Int, wp.extern.Post>):haxe.extern.EitherType<Bool, Int>;
  /**
    
     Inserts post data into the posts table as a post revision.
    
     @since 2.6.0
     @access private
    
     @param int|WP_Post|array|null $post     Post ID, post object OR post array.
     @param bool                   $autosave Optional. Is the revision an autosave?
     @return int|WP_Error WP_Error or 0 if error, new revision ID if success.
    
  **/
  public function _wp_put_post_revision(post:haxe.extern.EitherType<Int, haxe.extern.EitherType<wp.extern.Post, php.NativeArray>> = null, autosave:Bool = false):haxe.extern.EitherType<Int, wp.extern.Error>;
  /**
    
     Gets a post revision.
    
     @since 2.6.0
    
     @param int|WP_Post $post   The post ID or object.
     @param string      $output Optional. The required return type. One of OBJECT, ARRAY_A, or ARRAY_N, which correspond to
                                a WP_Post object, an associative array, or a numeric array, respectively. Default OBJECT.
     @param string      $filter Optional sanitation filter. See sanitize_post().
     @return WP_Post|array|null WP_Post (or array) on success, or null on failure.
    
  **/
  public function wp_get_post_revision(post:haxe.extern.EitherType<Int, wp.extern.Post>, output:String, filter:String):haxe.extern.EitherType<wp.extern.Post, php.NativeArray>;
  /**
    
     Restores a post to the specified revision.
    
     Can restore a past revision using all fields of the post revision, or only selected fields.
    
     @since 2.6.0
    
     @param int|WP_Post $revision_id Revision ID or revision object.
     @param array       $fields      Optional. What fields to restore from. Defaults to all.
     @return int|false|null Null if error, false if no fields to restore, (int) post ID if success.
    
  **/
  public function wp_restore_post_revision(revision_id:haxe.extern.EitherType<Int, wp.extern.Post>, fields:php.NativeStructArray<Dynamic> = null):haxe.extern.EitherType<Int, Bool>;
  /**
    
     Deletes a revision.
    
     Deletes the row from the posts table corresponding to the specified revision.
    
     @since 2.6.0
    
     @param int|WP_Post $revision_id Revision ID or revision object.
     @return array|false|WP_Post|WP_Error|null Null or WP_Error if error, deleted post if success.
    
  **/
  public function wp_delete_post_revision(revision_id:haxe.extern.EitherType<Int, wp.extern.Post>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, haxe.extern.EitherType<Bool, haxe.extern.EitherType<wp.extern.Post, wp.extern.Error>>>;
  /**
    
     Returns all revisions of specified post.
    
     @since 2.6.0
    
     @see get_children()
    
     @param int|WP_Post $post_id Optional. Post ID or WP_Post object. Default is global `$post`.
     @param array|null  $args    Optional. Arguments for retrieving post revisions. Default null.
     @return array An array of revisions, or an empty array if none.
    
  **/
  public function wp_get_post_revisions(post_id:haxe.extern.EitherType<Int, wp.extern.Post> = 0, args:php.NativeArray = null):php.NativeArray;
  /**
    
     Determine if revisions are enabled for a given post.
    
     @since 3.6.0
    
     @param WP_Post $post The post object.
     @return bool True if number of revisions to keep isn't zero, false otherwise.
    
  **/
  public function wp_revisions_enabled(post:wp.extern.Post):Bool;
  /**
    
     Determine how many revisions to retain for a given post.
    
     By default, an infinite number of revisions are kept.
    
     The constant WP_POST_REVISIONS can be set in wp-config to specify the limit
     of revisions to keep.
    
     @since 3.6.0
    
     @param WP_Post $post The post object.
     @return int The number of revisions to keep.
    
  **/
  public function wp_revisions_to_keep(post:wp.extern.Post):Int;
  /**
    
     Sets up the post object for preview based on the post autosave.
    
     @since 2.7.0
     @access private
    
     @param WP_Post $post
     @return WP_Post|false
    
  **/
  public function _set_preview(post:wp.extern.Post):haxe.extern.EitherType<wp.extern.Post, Bool>;
  /**
    
     Filters the latest content for preview from the post autosave.
    
     @since 2.7.0
     @access private
    
  **/
  public function _show_post_preview():Void;
  /**
    
     Filters terms lookup to set the post format.
    
     @since 3.6.0
     @access private
    
     @param array  $terms
     @param int    $post_id
     @param string $taxonomy
     @return array
    
  **/
  public function _wp_preview_terms_filter(terms:php.NativeStructArray<Dynamic>, post_id:Int, taxonomy:String):php.NativeArray;
  /**
    
     Filters post thumbnail lookup to set the post thumbnail.
    
     @since 4.6.0
     @access private
    
     @param null|array|string $value    The value to return - a single metadata value, or an array of values.
     @param int               $post_id  Post ID.
     @param string            $meta_key Meta key.
     @return null|array The default return value or the post thumbnail meta array.
    
  **/
  public function _wp_preview_post_thumbnail_filter(value:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String>, post_id:Int, meta_key:String):php.NativeArray;
  /**
    
     Gets the post revision version.
    
     @since 3.6.0
     @access private
    
     @param WP_Post $revision
     @return int|false
    
  **/
  public function _wp_get_post_revision_version(revision:wp.extern.Post):haxe.extern.EitherType<Int, Bool>;
  /**
    
     Upgrade the revisions author, add the current post as a revision and set the revisions version to 1
    
     @since 3.6.0
     @access private
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param WP_Post $post      Post object
     @param array   $revisions Current revisions of the post
     @return bool true if the revisions were upgraded, false if problems
    
  **/
  public function _wp_upgrade_revisions_of_post(post:wp.extern.Post, revisions:php.NativeStructArray<Dynamic>):Bool;
}
