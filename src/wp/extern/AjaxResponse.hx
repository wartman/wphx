package wp.extern;

@:native("WP_Ajax_Response")
extern class AjaxResponse {
  /**
    
     Store XML responses to send.
    
     @since 2.1.0
     @var array
    
  **/
  @:native("responses") public var responses:php.NativeStructArray<Dynamic>;
  /**
    
     Constructor - Passes args to WP_Ajax_Response::add().
    
     @since 2.1.0
     @see WP_Ajax_Response::add()
    
     @param string|array $args Optional. Will be passed to add() method.
    
  **/
  public function new(args:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = ''):Void;
  /**
    
     Appends data to an XML response based on given arguments.
    
     With `$args` defaults, extra data output would be:
    
         <response action='{$action}_$id'>
          <$what id='$id' position='$position'>
              <response_data><![CDATA[$data]]></response_data>
          </$what>
         </response>
    
     @since 2.1.0
    
     @param string|array $args {
         Optional. An array or string of XML response arguments.
    
         @type string          $what         XML-RPC response type. Used as a child element of `<response>`.
                                             Default 'object' (`<object>`).
         @type string|false    $action       Value to use for the `action` attribute in `<response>`. Will be
                                             appended with `_$id` on output. If false, `$action` will default to
                                             the value of `$_POST['action']`. Default false.
         @type int|WP_Error    $id           The response ID, used as the response type `id` attribute. Also
                                             accepts a `WP_Error` object if the ID does not exist. Default 0.
         @type int|false       $old_id       The previous response ID. Used as the value for the response type
                                             `old_id` attribute. False hides the attribute. Default false.
         @type string          $position     Value of the response type `position` attribute. Accepts 1 (bottom),
                                             -1 (top), html ID (after), or -html ID (before). Default 1 (bottom).
         @type string|WP_Error $data         The response content/message. Also accepts a WP_Error object if the
                                             ID does not exist. Default empty.
         @type array           $supplemental An array of extra strings that will be output within a `<supplemental>`
                                             element as CDATA. Default empty array.
     }
     @return string XML response.
    
  **/
  @:native("add") public function add(args:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = ''):String;
  /**
    
     Display XML formatted responses.
    
     Sets the content type header to text/xml.
    
     @since 2.1.0
    
  **/
  @:native("send") public function send():Void;
}
