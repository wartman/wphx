package wp.extern;

extern class BookmarkTemplateApi implements wp.util.ApiFunctions {
  /**
    
     The formatted output of a list of bookmarks.
    
     The $bookmarks array must contain bookmark objects and will be iterated over
     to retrieve the bookmark to be used in the output.
    
     The output is formatted as HTML with no way to change that format. However,
     what is between, before, and after can be changed. The link itself will be
     HTML.
    
     This function is used internally by wp_list_bookmarks() and should not be
     used by themes.
    
     @since 2.1.0
     @access private
    
     @param array $bookmarks List of bookmarks to traverse.
     @param string|array $args {
         Optional. Bookmarks arguments.
    
         @type int|bool $show_updated     Whether to show the time the bookmark was last updated.
                                          Accepts 1|true or 0|false. Default 0|false.
         @type int|bool $show_description Whether to show the bookmark description. Accepts 1|true,
                                          Accepts 1|true or 0|false. Default 0|false.
         @type int|bool $show_images      Whether to show the link image if available. Accepts 1|true
                                          or 0|false. Default 1|true.
         @type int|bool $show_name        Whether to show link name if available. Accepts 1|true or
                                          0|false. Default 0|false.
         @type string   $before           The HTML or text to prepend to each bookmark. Default `<li>`.
         @type string   $after            The HTML or text to append to each bookmark. Default `</li>`.
         @type string   $link_before      The HTML or text to prepend to each bookmark inside the anchor
                                          tags. Default empty.
         @type string   $link_after       The HTML or text to append to each bookmark inside the anchor
                                          tags. Default empty.
         @type string   $between          The string for use in between the link, description, and image.
                                          Default "\n".
         @type int|bool $show_rating      Whether to show the link rating. Accepts 1|true or 0|false.
                                          Default 0|false.
    
     }
     @return string Formatted output in HTML
    
  **/
  public function _walk_bookmarks(bookmarks:php.NativeStructArray<Dynamic>, args:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = ''):String;
  /**
    
     Retrieve or echo all of the bookmarks.
    
     List of default arguments are as follows:
    
     These options define how the Category name will appear before the category
     links are displayed, if 'categorize' is 1. If 'categorize' is 0, then it will
     display for only the 'title_li' string and only if 'title_li' is not empty.
    
     @since 2.1.0
    
     @see _walk_bookmarks()
    
     @param string|array $args {
         Optional. String or array of arguments to list bookmarks.
    
         @type string   $orderby          How to order the links by. Accepts post fields. Default 'name'.
         @type string   $order            Whether to order bookmarks in ascending or descending order.
                                          Accepts 'ASC' (ascending) or 'DESC' (descending). Default 'ASC'.
         @type int      $limit            Amount of bookmarks to display. Accepts 1+ or -1 for all.
                                          Default -1.
         @type string   $category         Comma-separated list of category ids to include links from.
                                          Default empty.
         @type string   $category_name    Category to retrieve links for by name. Default empty.
         @type int|bool $hide_invisible   Whether to show or hide links marked as 'invisible'. Accepts
                                          1|true or 0|false. Default 1|true.
         @type int|bool $show_updated     Whether to display the time the bookmark was last updated.
                                          Accepts 1|true or 0|false. Default 0|false.
         @type int|bool $echo             Whether to echo or return the formatted bookmarks. Accepts
                                          1|true (echo) or 0|false (return). Default 1|true.
         @type int|bool $categorize       Whether to show links listed by category or in a single column.
                                          Accepts 1|true (by category) or 0|false (one column). Default 1|true.
         @type int|bool $show_description Whether to show the bookmark descriptions. Accepts 1|true or 0|false.
                                          Default 0|false.
         @type string   $title_li         What to show before the links appear. Default 'Bookmarks'.
         @type string   $title_before     The HTML or text to prepend to the $title_li string. Default '<h2>'.
         @type string   $title_after      The HTML or text to append to the $title_li string. Default '</h2>'.
         @type string   $class            The CSS class to use for the $title_li. Default 'linkcat'.
         @type string   $category_before  The HTML or text to prepend to $title_before if $categorize is true.
                                          String must contain '%id' and '%class' to inherit the category ID and
                                          the $class argument used for formatting in themes.
                                          Default '<li id="%id" class="%class">'.
         @type string   $category_after   The HTML or text to append to $title_after if $categorize is true.
                                          Default '</li>'.
         @type string   $category_orderby How to order the bookmark category based on term scheme if $categorize
                                          is true. Default 'name'.
         @type string   $category_order   Whether to order categories in ascending or descending order if
                                          $categorize is true. Accepts 'ASC' (ascending) or 'DESC' (descending).
                                          Default 'ASC'.
     }
     @return string|void Will only return if echo option is set to not echo. Default is not return anything.
    
  **/
  public function wp_list_bookmarks(args:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = ''):String;
}
