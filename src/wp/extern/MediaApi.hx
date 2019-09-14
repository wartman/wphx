package wp.extern;

extern class MediaApi implements wp.util.ApiFunctions {
  /**
    
     Retrieve additional image sizes.
    
     @since 4.7.0
    
     @global array $_wp_additional_image_sizes
    
     @return array Additional images size data.
    
  **/
  public function wp_get_additional_image_sizes():php.NativeArray;
  /**
    
     Scale down the default size of an image.
    
     This is so that the image is a better fit for the editor and theme.
    
     The `$size` parameter accepts either an array or a string. The supported string
     values are 'thumb' or 'thumbnail' for the given thumbnail size or defaults at
     128 width and 96 height in pixels. Also supported for the string value is
     'medium', 'medium_large' and 'full'. The 'full' isn't actually supported, but any value other
     than the supported will result in the content_width size or 500 if that is
     not set.
    
     Finally, there is a filter named {@see 'editor_max_image_size'}, that will be
     called on the calculated array for width and height, respectively. The second
     parameter will be the value that was in the $size parameter. The returned
     type for the hook is an array with the width as the first element and the
     height as the second element.
    
     @since 2.5.0
    
     @global int   $content_width
    
     @param int          $width   Width of the image in pixels.
     @param int          $height  Height of the image in pixels.
     @param string|array $size    Optional. Image size. Accepts any valid image size, or an array
                                  of width and height values in pixels (in that order).
                                  Default 'medium'.
     @param string       $context Optional. Could be 'display' (like in a theme) or 'edit'
                                  (like inserting into an editor). Default null.
     @return array Width and height of what the result image should resize to.
    
  **/
  public function image_constrain_size_for_editor(width:Int, height:Int, size:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = 'medium', context:String = null):php.NativeArray;
  /**
    
     Retrieve width and height attributes using given width and height values.
    
     Both attributes are required in the sense that both parameters must have a
     value, but are optional in that if you set them to false or null, then they
     will not be added to the returned string.
    
     You can set the value using a string, but it will only take numeric values.
     If you wish to put 'px' after the numbers, then it will be stripped out of
     the return.
    
     @since 2.5.0
    
     @param int|string $width  Image width in pixels.
     @param int|string $height Image height in pixels.
     @return string HTML attributes for width and, or height.
    
  **/
  public function image_hwstring(width:haxe.extern.EitherType<Int, String>, height:haxe.extern.EitherType<Int, String>):String;
  /**
    
     Scale an image to fit a particular size (such as 'thumb' or 'medium').
    
     Array with image url, width, height, and whether is intermediate size, in
     that order is returned on success is returned. $is_intermediate is true if
     $url is a resized image, false if it is the original.
    
     The URL might be the original image, or it might be a resized version. This
     function won't create a new resized copy, it will just return an already
     resized one if it exists.
    
     A plugin may use the {@see 'image_downsize'} filter to hook into and offer image
     resizing services for images. The hook must return an array with the same
     elements that are returned in the function. The first element being the URL
     to the new image that was resized.
    
     @since 2.5.0
    
     @param int          $id   Attachment ID for image.
     @param array|string $size Optional. Image size to scale to. Accepts any valid image size,
                               or an array of width and height values in pixels (in that order).
                               Default 'medium'.
     @return false|array Array containing the image URL, width, height, and boolean for whether
                         the image is an intermediate size. False on failure.
    
  **/
  public function image_downsize(id:Int, size:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String> = 'medium'):haxe.extern.EitherType<Bool, php.NativeStructArray<Dynamic>>;
  /**
    
     Register a new image size.
    
     Cropping behavior for the image size is dependent on the value of $crop:
     1. If false (default), images will be scaled, not cropped.
     2. If an array in the form of array( x_crop_position, y_crop_position ):
        - x_crop_position accepts 'left' 'center', or 'right'.
        - y_crop_position accepts 'top', 'center', or 'bottom'.
        Images will be cropped to the specified dimensions within the defined crop area.
     3. If true, images will be cropped to the specified dimensions using center positions.
    
     @since 2.9.0
    
     @global array $_wp_additional_image_sizes Associative array of additional image sizes.
    
     @param string     $name   Image size identifier.
     @param int        $width  Optional. Image width in pixels. Default 0.
     @param int        $height Optional. Image height in pixels. Default 0.
     @param bool|array $crop   Optional. Whether to crop images to specified width and height or resize.
                               An array can specify positioning of the crop area. Default false.
    
  **/
  public function add_image_size(name:String, width:Int = 0, height:Int = 0, crop:haxe.extern.EitherType<Bool, php.NativeStructArray<Dynamic>> = false):Void;
  /**
    
     Check if an image size exists.
    
     @since 3.9.0
    
     @param string $name The image size to check.
     @return bool True if the image size exists, false if not.
    
  **/
  public function has_image_size(name:String):Bool;
  /**
    
     Remove a new image size.
    
     @since 3.9.0
    
     @global array $_wp_additional_image_sizes
    
     @param string $name The image size to remove.
     @return bool True if the image size was successfully removed, false on failure.
    
  **/
  public function remove_image_size(name:String):Bool;
  /**
    
     Registers an image size for the post thumbnail.
    
     @since 2.9.0
    
     @see add_image_size() for details on cropping behavior.
    
     @param int        $width  Image width in pixels.
     @param int        $height Image height in pixels.
     @param bool|array $crop   Optional. Whether to crop images to specified width and height or resize.
                               An array can specify positioning of the crop area. Default false.
    
  **/
  public function set_post_thumbnail_size(width:Int = 0, height:Int = 0, crop:haxe.extern.EitherType<Bool, php.NativeStructArray<Dynamic>> = false):Void;
  /**
    
     Gets an img tag for an image attachment, scaling it down if requested.
    
     The {@see 'get_image_tag_class'} filter allows for changing the class name for the
     image without having to use regular expressions on the HTML content. The
     parameters are: what WordPress will use for the class, the Attachment ID,
     image align value, and the size the image should be.
    
     The second filter, {@see 'get_image_tag'}, has the HTML content, which can then be
     further manipulated by a plugin to change all attribute values and even HTML
     content.
    
     @since 2.5.0
    
     @param int          $id    Attachment ID.
     @param string       $alt   Image Description for the alt attribute.
     @param string       $title Image Description for the title attribute.
     @param string       $align Part of the class name for aligning the image.
     @param string|array $size  Optional. Registered image size to retrieve a tag for. Accepts any
                                valid image size, or an array of width and height values in pixels
                                (in that order). Default 'medium'.
     @return string HTML IMG element for given image attachment
    
  **/
  public function get_image_tag(id:Int, alt:String, title:String, align:String, size:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = 'medium'):String;
  /**
    
     Calculates the new dimensions for a down-sampled image.
    
     If either width or height are empty, no constraint is applied on
     that dimension.
    
     @since 2.5.0
    
     @param int $current_width  Current width of the image.
     @param int $current_height Current height of the image.
     @param int $max_width      Optional. Max width in pixels to constrain to. Default 0.
     @param int $max_height     Optional. Max height in pixels to constrain to. Default 0.
     @return array First item is the width, the second item is the height.
    
  **/
  public function wp_constrain_dimensions(current_width:Int, current_height:Int, max_width:Int = 0, max_height:Int = 0):php.NativeArray;
  /**
    
     Retrieves calculated resize dimensions for use in WP_Image_Editor.
    
     Calculates dimensions and coordinates for a resized image that fits
     within a specified width and height.
    
     Cropping behavior is dependent on the value of $crop:
     1. If false (default), images will not be cropped.
     2. If an array in the form of array( x_crop_position, y_crop_position ):
        - x_crop_position accepts 'left' 'center', or 'right'.
        - y_crop_position accepts 'top', 'center', or 'bottom'.
        Images will be cropped to the specified dimensions within the defined crop area.
     3. If true, images will be cropped to the specified dimensions using center positions.
    
     @since 2.5.0
    
     @param int        $orig_w Original width in pixels.
     @param int        $orig_h Original height in pixels.
     @param int        $dest_w New width in pixels.
     @param int        $dest_h New height in pixels.
     @param bool|array $crop   Optional. Whether to crop image to specified width and height or resize.
                               An array can specify positioning of the crop area. Default false.
     @return false|array False on failure. Returned array matches parameters for `imagecopyresampled()`.
    
  **/
  public function image_resize_dimensions(orig_w:Int, orig_h:Int, dest_w:Int, dest_h:Int, crop:haxe.extern.EitherType<Bool, php.NativeStructArray<Dynamic>> = false):haxe.extern.EitherType<Bool, php.NativeStructArray<Dynamic>>;
  /**
    
     Resizes an image to make a thumbnail or intermediate size.
    
     The returned array has the file size, the image width, and image height. The
     {@see 'image_make_intermediate_size'} filter can be used to hook in and change the
     values of the returned array. The only parameter is the resized file path.
    
     @since 2.5.0
    
     @param string $file   File path.
     @param int    $width  Image width.
     @param int    $height Image height.
     @param bool   $crop   Optional. Whether to crop image to specified width and height or resize.
                           Default false.
     @return false|array False, if no image was created. Metadata array on success.
    
  **/
  public function image_make_intermediate_size(file:String, width:Int, height:Int, crop:Bool = false):haxe.extern.EitherType<Bool, php.NativeStructArray<Dynamic>>;
  /**
    
     Helper function to test if aspect ratios for two images match.
    
     @since 4.6.0
    
     @param int $source_width  Width of the first image in pixels.
     @param int $source_height Height of the first image in pixels.
     @param int $target_width  Width of the second image in pixels.
     @param int $target_height Height of the second image in pixels.
     @return bool True if aspect ratios match within 1px. False if not.
    
  **/
  public function wp_image_matches_ratio(source_width:Int, source_height:Int, target_width:Int, target_height:Int):Bool;
  /**
    
     Retrieves the image's intermediate size (resized) path, width, and height.
    
     The $size parameter can be an array with the width and height respectively.
     If the size matches the 'sizes' metadata array for width and height, then it
     will be used. If there is no direct match, then the nearest image size larger
     than the specified size will be used. If nothing is found, then the function
     will break out and return false.
    
     The metadata 'sizes' is used for compatible sizes that can be used for the
     parameter $size value.
    
     The url path will be given, when the $size parameter is a string.
    
     If you are passing an array for the $size, you should consider using
     add_image_size() so that a cropped version is generated. It's much more
     efficient than having to find the closest-sized image and then having the
     browser scale down the image.
    
     @since 2.5.0
    
     @param int          $post_id Attachment ID.
     @param array|string $size    Optional. Image size. Accepts any valid image size, or an array
                                  of width and height values in pixels (in that order).
                                  Default 'thumbnail'.
     @return false|array $data {
         Array of file relative path, width, and height on success. Additionally includes absolute
         path and URL if registered size is passed to $size parameter. False on failure.
    
         @type string $file   Image's path relative to uploads directory
         @type int    $width  Width of image
         @type int    $height Height of image
         @type string $path   Image's absolute filesystem path.
         @type string $url    Image's URL.
     }
    
  **/
  public function image_get_intermediate_size(post_id:Int, size:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String> = 'thumbnail'):haxe.extern.EitherType<Bool, php.NativeStructArray<Dynamic>>;
  /**
    
     Gets the available intermediate image sizes.
    
     @since 3.0.0
    
     @return array Returns a filtered array of image size strings.
    
  **/
  public function get_intermediate_image_sizes():php.NativeArray;
  /**
    
     Retrieve an image to represent an attachment.
    
     A mime icon for files, thumbnail or intermediate size for images.
    
     The returned array contains four values: the URL of the attachment image src,
     the width of the image file, the height of the image file, and a boolean
     representing whether the returned array describes an intermediate (generated)
     image size or the original, full-sized upload.
    
     @since 2.5.0
    
     @param int          $attachment_id Image attachment ID.
     @param string|array $size          Optional. Image size. Accepts any valid image size, or an array of width
                                        and height values in pixels (in that order). Default 'thumbnail'.
     @param bool         $icon          Optional. Whether the image should be treated as an icon. Default false.
     @return false|array Returns an array (url, width, height, is_intermediate), or false, if no image is available.
    
  **/
  public function wp_get_attachment_image_src(attachment_id:Int, size:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = 'thumbnail', icon:Bool = false):haxe.extern.EitherType<Bool, php.NativeStructArray<Dynamic>>;
  /**
    
     Get an HTML img element representing an image attachment
    
     While `$size` will accept an array, it is better to register a size with
     add_image_size() so that a cropped version is generated. It's much more
     efficient than having to find the closest-sized image and then having the
     browser scale down the image.
    
     @since 2.5.0
    
     @param int          $attachment_id Image attachment ID.
     @param string|array $size          Optional. Image size. Accepts any valid image size, or an array of width
                                        and height values in pixels (in that order). Default 'thumbnail'.
     @param bool         $icon          Optional. Whether the image should be treated as an icon. Default false.
     @param string|array $attr          Optional. Attributes for the image markup. Default empty.
     @return string HTML img element or empty string on failure.
    
  **/
  public function wp_get_attachment_image(attachment_id:Int, size:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = 'thumbnail', icon:Bool = false, attr:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = ''):String;
  /**
    
     Get the URL of an image attachment.
    
     @since 4.4.0
    
     @param int          $attachment_id Image attachment ID.
     @param string|array $size          Optional. Image size to retrieve. Accepts any valid image size, or an array
                                        of width and height values in pixels (in that order). Default 'thumbnail'.
     @param bool         $icon          Optional. Whether the image should be treated as an icon. Default false.
     @return string|false Attachment URL or false if no image is available.
    
  **/
  public function wp_get_attachment_image_url(attachment_id:Int, size:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = 'thumbnail', icon:Bool = false):haxe.extern.EitherType<String, Bool>;
  /**
    
     Get the attachment path relative to the upload directory.
    
     @since 4.4.1
     @access private
    
     @param string $file Attachment file name.
     @return string Attachment path relative to the upload directory.
    
  **/
  public function _wp_get_attachment_relative_path(file:String):String;
  /**
    
     Get the image size as array from its meta data.
    
     Used for responsive images.
    
     @since 4.4.0
     @access private
    
     @param string $size_name  Image size. Accepts any valid image size name ('thumbnail', 'medium', etc.).
     @param array  $image_meta The image meta data.
     @return array|bool Array of width and height values in pixels (in that order)
                        or false if the size doesn't exist.
    
  **/
  public function _wp_get_image_size_from_meta(size_name:String, image_meta:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Bool>;
  /**
    
     Retrieves the value for an image attachment's 'srcset' attribute.
    
     @since 4.4.0
    
     @see wp_calculate_image_srcset()
    
     @param int          $attachment_id Image attachment ID.
     @param array|string $size          Optional. Image size. Accepts any valid image size, or an array of
                                        width and height values in pixels (in that order). Default 'medium'.
     @param array        $image_meta    Optional. The image meta data as returned by 'wp_get_attachment_metadata()'.
                                        Default null.
     @return string|bool A 'srcset' value string or false.
    
  **/
  public function wp_get_attachment_image_srcset(attachment_id:Int, size:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String> = 'medium', image_meta:php.NativeStructArray<Dynamic> = null):haxe.extern.EitherType<String, Bool>;
  /**
    
     A helper function to calculate the image sources to include in a 'srcset' attribute.
    
     @since 4.4.0
    
     @param array  $size_array    Array of width and height values in pixels (in that order).
     @param string $image_src     The 'src' of the image.
     @param array  $image_meta    The image meta data as returned by 'wp_get_attachment_metadata()'.
     @param int    $attachment_id Optional. The image attachment ID to pass to the filter. Default 0.
     @return string|bool          The 'srcset' attribute value. False on error or when only one source exists.
    
  **/
  public function wp_calculate_image_srcset(size_array:php.NativeStructArray<Dynamic>, image_src:String, image_meta:php.NativeStructArray<Dynamic>, attachment_id:Int = 0):haxe.extern.EitherType<String, Bool>;
  /**
    
     Retrieves the value for an image attachment's 'sizes' attribute.
    
     @since 4.4.0
    
     @see wp_calculate_image_sizes()
    
     @param int          $attachment_id Image attachment ID.
     @param array|string $size          Optional. Image size. Accepts any valid image size, or an array of width
                                        and height values in pixels (in that order). Default 'medium'.
     @param array        $image_meta    Optional. The image meta data as returned by 'wp_get_attachment_metadata()'.
                                        Default null.
     @return string|bool A valid source size value for use in a 'sizes' attribute or false.
    
  **/
  public function wp_get_attachment_image_sizes(attachment_id:Int, size:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String> = 'medium', image_meta:php.NativeStructArray<Dynamic> = null):haxe.extern.EitherType<String, Bool>;
  /**
    
     Creates a 'sizes' attribute value for an image.
    
     @since 4.4.0
    
     @param array|string $size          Image size to retrieve. Accepts any valid image size, or an array
                                        of width and height values in pixels (in that order). Default 'medium'.
     @param string       $image_src     Optional. The URL to the image file. Default null.
     @param array        $image_meta    Optional. The image meta data as returned by 'wp_get_attachment_metadata()'.
                                        Default null.
     @param int          $attachment_id Optional. Image attachment ID. Either `$image_meta` or `$attachment_id`
                                        is needed when using the image size name as argument for `$size`. Default 0.
     @return string|bool A valid source size value for use in a 'sizes' attribute or false.
    
  **/
  public function wp_calculate_image_sizes(size:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String>, image_src:String = null, image_meta:php.NativeStructArray<Dynamic> = null, attachment_id:Int = 0):haxe.extern.EitherType<String, Bool>;
  /**
    
     Filters 'img' elements in post content to add 'srcset' and 'sizes' attributes.
    
     @since 4.4.0
    
     @see wp_image_add_srcset_and_sizes()
    
     @param string $content The raw post content to be filtered.
     @return string Converted content with 'srcset' and 'sizes' attributes added to images.
    
  **/
  public function wp_make_content_images_responsive(content:String):String;
  /**
    
     Adds 'srcset' and 'sizes' attributes to an existing 'img' element.
    
     @since 4.4.0
    
     @see wp_calculate_image_srcset()
     @see wp_calculate_image_sizes()
    
     @param string $image         An HTML 'img' element to be filtered.
     @param array  $image_meta    The image meta data as returned by 'wp_get_attachment_metadata()'.
     @param int    $attachment_id Image attachment ID.
     @return string Converted 'img' element with 'srcset' and 'sizes' attributes added.
    
  **/
  public function wp_image_add_srcset_and_sizes(image:String, image_meta:php.NativeStructArray<Dynamic>, attachment_id:Int):String;
  /**
    
     Adds a 'wp-post-image' class to post thumbnails. Internal use only.
    
     Uses the {@see 'begin_fetch_post_thumbnail_html'} and {@see 'end_fetch_post_thumbnail_html'}
     action hooks to dynamically add/remove itself so as to only filter post thumbnails.
    
     @ignore
     @since 2.9.0
    
     @param array $attr Thumbnail attributes including src, class, alt, title.
     @return array Modified array of attributes including the new 'wp-post-image' class.
    
  **/
  public function _wp_post_thumbnail_class_filter(attr:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Adds '_wp_post_thumbnail_class_filter' callback to the 'wp_get_attachment_image_attributes'
     filter hook. Internal use only.
    
     @ignore
     @since 2.9.0
    
     @param array $attr Thumbnail attributes including src, class, alt, title.
    
  **/
  public function _wp_post_thumbnail_class_filter_add(attr:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Removes the '_wp_post_thumbnail_class_filter' callback from the 'wp_get_attachment_image_attributes'
     filter hook. Internal use only.
    
     @ignore
     @since 2.9.0
    
     @param array $attr Thumbnail attributes including src, class, alt, title.
    
  **/
  public function _wp_post_thumbnail_class_filter_remove(attr:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Builds the Caption shortcode output.
    
     Allows a plugin to replace the content that would otherwise be returned. The
     filter is {@see 'img_caption_shortcode'} and passes an empty string, the attr
     parameter and the content parameter values.
    
     The supported attributes for the shortcode are 'id', 'caption_id', 'align',
     'width', 'caption', and 'class'.
    
     @since 2.6.0
     @since 3.9.0 The `class` attribute was added.
     @since 5.1.0 The `caption_id` attribute was added.
    
     @param array  $attr {
         Attributes of the caption shortcode.
    
         @type string $id         ID of the image and caption container element, i.e. `<figure>` or `<div>`.
         @type string $caption_id ID of the caption element, i.e. `<figcaption>` or `<p>`.
         @type string $align      Class name that aligns the caption. Default 'alignnone'. Accepts 'alignleft',
                                  'aligncenter', alignright', 'alignnone'.
         @type int    $width      The width of the caption, in pixels.
         @type string $caption    The caption text.
         @type string $class      Additional class name(s) added to the caption container.
     }
     @param string $content Shortcode content.
     @return string HTML content to display the caption.
    
  **/
  public function img_caption_shortcode(attr:php.NativeStructArray<Dynamic>, content:String = null):String;
  /**
    
     Builds the Gallery shortcode output.
    
     This implements the functionality of the Gallery Shortcode for displaying
     WordPress images on a post.
    
     @since 2.5.0
    
     @staticvar int $instance
    
     @param array $attr {
         Attributes of the gallery shortcode.
    
         @type string       $order      Order of the images in the gallery. Default 'ASC'. Accepts 'ASC', 'DESC'.
         @type string       $orderby    The field to use when ordering the images. Default 'menu_order ID'.
                                        Accepts any valid SQL ORDERBY statement.
         @type int          $id         Post ID.
         @type string       $itemtag    HTML tag to use for each image in the gallery.
                                        Default 'dl', or 'figure' when the theme registers HTML5 gallery support.
         @type string       $icontag    HTML tag to use for each image's icon.
                                        Default 'dt', or 'div' when the theme registers HTML5 gallery support.
         @type string       $captiontag HTML tag to use for each image's caption.
                                        Default 'dd', or 'figcaption' when the theme registers HTML5 gallery support.
         @type int          $columns    Number of columns of images to display. Default 3.
         @type string|array $size       Size of the images to display. Accepts any valid image size, or an array of width
                                        and height values in pixels (in that order). Default 'thumbnail'.
         @type string       $ids        A comma-separated list of IDs of attachments to display. Default empty.
         @type string       $include    A comma-separated list of IDs of attachments to include. Default empty.
         @type string       $exclude    A comma-separated list of IDs of attachments to exclude. Default empty.
         @type string       $link       What to link each image to. Default empty (links to the attachment page).
                                        Accepts 'file', 'none'.
     }
     @return string HTML content to display gallery.
    
  **/
  public function gallery_shortcode(attr:php.NativeStructArray<Dynamic>):String;
  /**
    
     Outputs the templates used by playlists.
    
     @since 3.9.0
    
  **/
  public function wp_underscore_playlist_templates():Void;
  /**
    
     Outputs and enqueue default scripts and styles for playlists.
    
     @since 3.9.0
    
     @param string $type Type of playlist. Accepts 'audio' or 'video'.
    
  **/
  public function wp_playlist_scripts(type:String):Void;
  /**
    
     Builds the Playlist shortcode output.
    
     This implements the functionality of the playlist shortcode for displaying
     a collection of WordPress audio or video files in a post.
    
     @since 3.9.0
    
     @global int $content_width
     @staticvar int $instance
    
     @param array $attr {
         Array of default playlist attributes.
    
         @type string  $type         Type of playlist to display. Accepts 'audio' or 'video'. Default 'audio'.
         @type string  $order        Designates ascending or descending order of items in the playlist.
                                     Accepts 'ASC', 'DESC'. Default 'ASC'.
         @type string  $orderby      Any column, or columns, to sort the playlist. If $ids are
                                     passed, this defaults to the order of the $ids array ('post__in').
                                     Otherwise default is 'menu_order ID'.
         @type int     $id           If an explicit $ids array is not present, this parameter
                                     will determine which attachments are used for the playlist.
                                     Default is the current post ID.
         @type array   $ids          Create a playlist out of these explicit attachment IDs. If empty,
                                     a playlist will be created from all $type attachments of $id.
                                     Default empty.
         @type array   $exclude      List of specific attachment IDs to exclude from the playlist. Default empty.
         @type string  $style        Playlist style to use. Accepts 'light' or 'dark'. Default 'light'.
         @type bool    $tracklist    Whether to show or hide the playlist. Default true.
         @type bool    $tracknumbers Whether to show or hide the numbers next to entries in the playlist. Default true.
         @type bool    $images       Show or hide the video or audio thumbnail (Featured Image/post
                                     thumbnail). Default true.
         @type bool    $artists      Whether to show or hide artist name in the playlist. Default true.
     }
    
     @return string Playlist output. Empty string if the passed type is unsupported.
    
  **/
  public function wp_playlist_shortcode(attr:php.NativeStructArray<Dynamic>):String;
  /**
    
     Provides a No-JS Flash fallback as a last resort for audio / video.
    
     @since 3.6.0
    
     @param string $url The media element URL.
     @return string Fallback HTML.
    
  **/
  public function wp_mediaelement_fallback(url:String):String;
  /**
    
     Returns a filtered list of WP-supported audio formats.
    
     @since 3.6.0
    
     @return array Supported audio formats.
    
  **/
  public function wp_get_audio_extensions():php.NativeArray;
  /**
    
     Returns useful keys to use to lookup data from an attachment's stored metadata.
    
     @since 3.9.0
    
     @param WP_Post $attachment The current attachment, provided for context.
     @param string  $context    Optional. The context. Accepts 'edit', 'display'. Default 'display'.
     @return array Key/value pairs of field keys to labels.
    
  **/
  public function wp_get_attachment_id3_keys(attachment:wp.extern.Post, context:String = 'display'):php.NativeArray;
  /**
    
     Builds the Audio shortcode output.
    
     This implements the functionality of the Audio Shortcode for displaying
     WordPress mp3s in a post.
    
     @since 3.6.0
    
     @staticvar int $instance
    
     @param array  $attr {
         Attributes of the audio shortcode.
    
         @type string $src      URL to the source of the audio file. Default empty.
         @type string $loop     The 'loop' attribute for the `<audio>` element. Default empty.
         @type string $autoplay The 'autoplay' attribute for the `<audio>` element. Default empty.
         @type string $preload  The 'preload' attribute for the `<audio>` element. Default 'none'.
         @type string $class    The 'class' attribute for the `<audio>` element. Default 'wp-audio-shortcode'.
         @type string $style    The 'style' attribute for the `<audio>` element. Default 'width: 100%;'.
     }
     @param string $content Shortcode content.
     @return string|void HTML content to display audio.
    
  **/
  public function wp_audio_shortcode(attr:php.NativeStructArray<Dynamic>, content:String = ''):String;
  /**
    
     Returns a filtered list of WP-supported video formats.
    
     @since 3.6.0
    
     @return array List of supported video formats.
    
  **/
  public function wp_get_video_extensions():php.NativeArray;
  /**
    
     Builds the Video shortcode output.
    
     This implements the functionality of the Video Shortcode for displaying
     WordPress mp4s in a post.
    
     @since 3.6.0
    
     @global int $content_width
     @staticvar int $instance
    
     @param array  $attr {
         Attributes of the shortcode.
    
         @type string $src      URL to the source of the video file. Default empty.
         @type int    $height   Height of the video embed in pixels. Default 360.
         @type int    $width    Width of the video embed in pixels. Default $content_width or 640.
         @type string $poster   The 'poster' attribute for the `<video>` element. Default empty.
         @type string $loop     The 'loop' attribute for the `<video>` element. Default empty.
         @type string $autoplay The 'autoplay' attribute for the `<video>` element. Default empty.
         @type string $preload  The 'preload' attribute for the `<video>` element.
                                Default 'metadata'.
         @type string $class    The 'class' attribute for the `<video>` element.
                                Default 'wp-video-shortcode'.
     }
     @param string $content Shortcode content.
     @return string|void HTML content to display video.
    
  **/
  public function wp_video_shortcode(attr:php.NativeStructArray<Dynamic>, content:String = ''):String;
  /**
    
     Displays previous image link that has the same post parent.
    
     @since 2.5.0
    
     @see adjacent_image_link()
    
     @param string|array $size Optional. Image size. Accepts any valid image size, an array of width and
                               height values in pixels (in that order), 0, or 'none'. 0 or 'none' will
                               default to 'post_title' or `$text`. Default 'thumbnail'.
     @param string       $text Optional. Link text. Default false.
    
  **/
  public function previous_image_link(size:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = 'thumbnail', text:String = false):Void;
  /**
    
     Displays next image link that has the same post parent.
    
     @since 2.5.0
    
     @see adjacent_image_link()
    
     @param string|array $size Optional. Image size. Accepts any valid image size, an array of width and
                               height values in pixels (in that order), 0, or 'none'. 0 or 'none' will
                               default to 'post_title' or `$text`. Default 'thumbnail'.
     @param string       $text Optional. Link text. Default false.
    
  **/
  public function next_image_link(size:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = 'thumbnail', text:String = false):Void;
  /**
    
     Displays next or previous image link that has the same post parent.
    
     Retrieves the current attachment object from the $post global.
    
     @since 2.5.0
    
     @param bool         $prev Optional. Whether to display the next (false) or previous (true) link. Default true.
     @param string|array $size Optional. Image size. Accepts any valid image size, or an array of width and height
                               values in pixels (in that order). Default 'thumbnail'.
     @param bool         $text Optional. Link text. Default false.
    
  **/
  public function adjacent_image_link(prev:Bool = true, size:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = 'thumbnail', text:Bool = false):Void;
  /**
    
     Retrieves taxonomies attached to given the attachment.
    
     @since 2.5.0
     @since 4.7.0 Introduced the `$output` parameter.
    
     @param int|array|object $attachment Attachment ID, data array, or data object.
     @param string           $output     Output type. 'names' to return an array of taxonomy names,
                                         or 'objects' to return an array of taxonomy objects.
                                         Default is 'names'.
     @return array Empty array on failure. List of taxonomies on success.
    
  **/
  public function get_attachment_taxonomies(attachment:haxe.extern.EitherType<Int, haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Dynamic>>, output:String = 'names'):php.NativeArray;
  /**
    
     Retrieves all of the taxonomies that are registered for attachments.
    
     Handles mime-type-specific taxonomies such as attachment:image and attachment:video.
    
     @since 3.5.0
     @see get_taxonomies()
    
     @param string $output Optional. The type of taxonomy output to return. Accepts 'names' or 'objects'.
                           Default 'names'.
     @return string[]|WP_Taxonomy[] Array of names or objects of registered taxonomies for attachments.
    
  **/
  public function get_taxonomies_for_attachments(output:String = 'names'):haxe.extern.EitherType<php.NativeIndexedArray<String>, php.NativeIndexedArray<wp.extern.Taxonomy>>;
  /**
    
     Create new GD image resource with transparency support
    
     @todo: Deprecate if possible.
    
     @since 2.9.0
    
     @param int $width  Image width in pixels.
     @param int $height Image height in pixels..
     @return resource The GD image resource.
    
  **/
  public function wp_imagecreatetruecolor(width:Int, height:Int):Dynamic;
  /**
    
     Based on a supplied width/height example, return the biggest possible dimensions based on the max width/height.
    
     @since 2.9.0
    
     @see wp_constrain_dimensions()
    
     @param int $example_width  The width of an example embed.
     @param int $example_height The height of an example embed.
     @param int $max_width      The maximum allowed width.
     @param int $max_height     The maximum allowed height.
     @return array The maximum possible width and height based on the example ratio.
    
  **/
  public function wp_expand_dimensions(example_width:Int, example_height:Int, max_width:Int, max_height:Int):php.NativeArray;
  /**
    
     Determines the maximum upload size allowed in php.ini.
    
     @since 2.5.0
    
     @return int Allowed upload size.
    
  **/
  public function wp_max_upload_size():Int;
  /**
    
     Returns a WP_Image_Editor instance and loads file into it.
    
     @since 3.5.0
    
     @param string $path Path to the file to load.
     @param array  $args Optional. Additional arguments for retrieving the image editor.
                         Default empty array.
     @return WP_Image_Editor|WP_Error The WP_Image_Editor object if successful, an WP_Error
                                      object otherwise.
    
  **/
  public function wp_get_image_editor(path:String, ?args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<wp.extern.ImageEditor, wp.extern.Error>;
  /**
    
     Tests whether there is an editor that supports a given mime type or methods.
    
     @since 3.5.0
    
     @param string|array $args Optional. Array of arguments to retrieve the image editor supports.
                               Default empty array.
     @return bool True if an eligible editor is found; false otherwise.
    
  **/
  public function wp_image_editor_supports(?args:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>):Bool;
  /**
    
     Tests which editors are capable of supporting the request.
    
     @ignore
     @since 3.5.0
    
     @param array $args Optional. Array of arguments for choosing a capable editor. Default empty array.
     @return string|false Class name for the first editor that claims to support the request. False if no
                         editor claims to support the request.
    
  **/
  public function _wp_image_editor_choose(?args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<String, Bool>;
  /**
    
     Prints default Plupload arguments.
    
     @since 3.4.0
    
  **/
  public function wp_plupload_default_settings():Void;
  /**
    
     Prepares an attachment post object for JS, where it is expected
     to be JSON-encoded and fit into an Attachment model.
    
     @since 3.5.0
    
     @param int|WP_Post $attachment Attachment ID or object.
     @return array|void Array of attachment details.
    
  **/
  public function wp_prepare_attachment_for_js(attachment:haxe.extern.EitherType<Int, wp.extern.Post>):php.NativeArray;
  /**
    
     Enqueues all scripts, styles, settings, and templates necessary to use
     all media JS APIs.
    
     @since 3.5.0
    
     @global int       $content_width
     @global wpdb      $wpdb
     @global WP_Locale $wp_locale
    
     @param array $args {
         Arguments for enqueuing media scripts.
    
         @type int|WP_Post A post object or ID.
     }
    
  **/
  public function wp_enqueue_media(?args:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Retrieves media attached to the passed post.
    
     @since 3.6.0
    
     @param string      $type Mime type.
     @param int|WP_Post $post Optional. Post ID or WP_Post object. Default is global $post.
     @return array Found attachments.
    
  **/
  public function get_attached_media(type:String, post:haxe.extern.EitherType<Int, wp.extern.Post> = 0):php.NativeArray;
  /**
    
     Check the content blob for an audio, video, object, embed, or iframe tags.
    
     @since 3.6.0
    
     @param string $content A string which might contain media data.
     @param array  $types   An array of media types: 'audio', 'video', 'object', 'embed', or 'iframe'.
     @return array A list of found HTML media embeds.
    
  **/
  public function get_media_embedded_in_content(content:String, types:php.NativeStructArray<Dynamic> = null):php.NativeArray;
  /**
    
     Retrieves galleries from the passed post's content.
    
     @since 3.6.0
    
     @param int|WP_Post $post Post ID or object.
     @param bool        $html Optional. Whether to return HTML or data in the array. Default true.
     @return array A list of arrays, each containing gallery data and srcs parsed
                   from the expanded shortcode.
    
  **/
  public function get_post_galleries(post:haxe.extern.EitherType<Int, wp.extern.Post>, html:Bool = true):php.NativeArray;
  /**
    
     Check a specified post's content for gallery and, if present, return the first
    
     @since 3.6.0
    
     @param int|WP_Post $post Optional. Post ID or WP_Post object. Default is global $post.
     @param bool        $html Optional. Whether to return HTML or data. Default is true.
     @return string|array Gallery data and srcs parsed from the expanded shortcode.
    
  **/
  public function get_post_gallery(post:haxe.extern.EitherType<Int, wp.extern.Post> = 0, html:Bool = true):haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>;
  /**
    
     Retrieve the image srcs from galleries from a post's content, if present
    
     @since 3.6.0
    
     @see get_post_galleries()
    
     @param int|WP_Post $post Optional. Post ID or WP_Post object. Default is global `$post`.
     @return array A list of lists, each containing image srcs parsed.
                   from an expanded shortcode
    
  **/
  public function get_post_galleries_images(post:haxe.extern.EitherType<Int, wp.extern.Post> = 0):php.NativeArray;
  /**
    
     Checks a post's content for galleries and return the image srcs for the first found gallery
    
     @since 3.6.0
    
     @see get_post_gallery()
    
     @param int|WP_Post $post Optional. Post ID or WP_Post object. Default is global `$post`.
     @return array A list of a gallery's image srcs in order.
    
  **/
  public function get_post_gallery_images(post:haxe.extern.EitherType<Int, wp.extern.Post> = 0):php.NativeArray;
  /**
    
     Maybe attempts to generate attachment metadata, if missing.
    
     @since 3.9.0
    
     @param WP_Post $attachment Attachment object.
    
  **/
  public function wp_maybe_generate_attachment_metadata(attachment:wp.extern.Post):Void;
  /**
    
     Tries to convert an attachment URL into a post ID.
    
     @since 4.0.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string $url The URL to resolve.
     @return int The found post ID, or 0 on failure.
    
  **/
  public function attachment_url_to_postid(url:String):Int;
  /**
    
     Returns the URLs for CSS files used in an iframe-sandbox'd TinyMCE media view.
    
     @since 4.0.0
    
     @return array The relevant CSS file URLs.
    
  **/
  public function wpview_media_sandbox_styles():php.NativeArray;
  /**
    
     Registers the personal data exporter for media
    
     @param array   $exporters   An array of personal data exporters.
     @return array  An array of personal data exporters.
    
  **/
  public function wp_register_media_personal_data_exporter(exporters:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Finds and exports attachments associated with an email address.
    
     @since 4.9.6
    
     @param  string $email_address The attachment owner email address.
     @param  int    $page          Attachment page.
     @return array  $return        An array of personal data.
    
  **/
  public function wp_media_personal_data_exporter(email_address:String, page:Int = 1):php.NativeArray;
}
