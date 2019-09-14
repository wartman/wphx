package wp.extern;

@:native("_WP_Editors")
extern class WPEditors {
  /**
    
     Parse default arguments for the editor instance.
    
     @param string $editor_id ID for the current editor instance.
     @param array  $settings {
         Array of editor arguments.
    
         @type bool       $wpautop           Whether to use wpautop(). Default true.
         @type bool       $media_buttons     Whether to show the Add Media/other media buttons.
         @type string     $default_editor    When both TinyMCE and Quicktags are used, set which
                                             editor is shown on page load. Default empty.
         @type bool       $drag_drop_upload  Whether to enable drag & drop on the editor uploading. Default false.
                                             Requires the media modal.
         @type string     $textarea_name     Give the textarea a unique name here. Square brackets
                                             can be used here. Default $editor_id.
         @type int        $textarea_rows     Number rows in the editor textarea. Default 20.
         @type string|int $tabindex          Tabindex value to use. Default empty.
         @type string     $tabfocus_elements The previous and next element ID to move the focus to
                                             when pressing the Tab key in TinyMCE. Default ':prev,:next'.
         @type string     $editor_css        Intended for extra styles for both Visual and Text editors.
                                             Should include `<style>` tags, and can use "scoped". Default empty.
         @type string     $editor_class      Extra classes to add to the editor textarea element. Default empty.
         @type bool       $teeny             Whether to output the minimal editor config. Examples include
                                             Press This and the Comment editor. Default false.
         @type bool       $dfw               Deprecated in 4.1. Since 4.3 used only to enqueue wp-fullscreen-stub.js
                                             for backward compatibility.
         @type bool|array $tinymce           Whether to load TinyMCE. Can be used to pass settings directly to
                                             TinyMCE using an array. Default true.
         @type bool|array $quicktags         Whether to load Quicktags. Can be used to pass settings directly to
                                             Quicktags using an array. Default true.
     }
     @return array Parsed arguments array.
    
  **/
  @:native("parse_settings") public static function parseSettings(editor_id:String, settings:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Outputs the HTML for a single instance of the editor.
    
     @param string $content The initial content of the editor.
     @param string $editor_id ID for the textarea and TinyMCE and Quicktags instances (can contain only ASCII letters and numbers).
     @param array $settings See _WP_Editors::parse_settings() for description.
    
  **/
  @:native("editor") public static function editor(content:String, editor_id:String, ?settings:php.NativeStructArray<Dynamic>):Void;
  /**
    
     @global string $tinymce_version
    
     @param string $editor_id
     @param array  $set
    
  **/
  @:native("editor_settings") public static function editorSettings(editor_id:String, set:php.NativeStructArray<Dynamic>):Void;
  /**
    
    
     @static
    
     @param bool $default_scripts Optional. Whether default scripts should be enqueued. Default false.
    
  **/
  @:native("enqueue_scripts") public static function enqueueScripts(default_scripts:Bool = false):Void;
  /**
    
     Enqueue all editor scripts.
     For use when the editor is going to be initialized after page load.
    
     @since 4.8.0
    
  **/
  @:native("enqueue_default_editor") public static function enqueueDefaultEditor():Void;
  /**
    
     Print (output) all editor scripts and default settings.
     For use when the editor is going to be initialized after page load.
    
     @since 4.8.0
    
  **/
  @:native("print_default_editor_scripts") public static function printDefaultEditorScripts():Void;
  /**
    
     Translates the default TinyMCE strings and returns them as JSON encoded object ready to be loaded with tinymce.addI18n(),
     or as JS snippet that should run after tinymce.js is loaded.
    
     @param string $mce_locale The locale used for the editor.
     @param bool $json_only optional Whether to include the JavaScript calls to tinymce.addI18n() and tinymce.ScriptLoader.markDone().
     @return string Translation object, JSON encoded.
    
  **/
  @:native("wp_mce_translation") public static function wpMceTranslation(mce_locale:String = '', json_only:Bool = false):String;
  /**
    
     Force uncompressed TinyMCE when a custom theme has been defined.
    
     The compressed TinyMCE file cannot deal with custom themes, so this makes
     sure that we use the uncompressed TinyMCE file if a theme is defined.
     Even if we are on a production environment.
    
  **/
  @:native("force_uncompressed_tinymce") public static function forceUncompressedTinymce():Void;
  /**
    
     Print (output) the main TinyMCE scripts.
    
     @since 4.8.0
    
     @global string $tinymce_version
     @global bool   $concatenate_scripts
     @global bool   $compress_scripts
    
  **/
  @:native("print_tinymce_scripts") public static function printTinymceScripts():Void;
  /**
    
     Print (output) the TinyMCE configuration and initialization scripts.
    
     @global string $tinymce_version
    
  **/
  @:native("editor_js") public static function editorJs():Void;
  /**
    
     Outputs the HTML for distraction-free writing mode.
    
     @since 3.2.0
     @deprecated 4.3.0
    
  **/
  @:native("wp_fullscreen_html") public static function wpFullscreenHtml():Void;
  /**
    
     Performs post queries for internal linking.
    
     @since 3.1.0
    
     @param array $args Optional. Accepts 'pagenum' and 's' (search) arguments.
     @return false|array Results.
    
  **/
  @:native("wp_link_query") public static function wpLinkQuery(?args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Bool, php.NativeStructArray<Dynamic>>;
  /**
    
     Dialog for internal linking.
    
     @since 3.1.0
    
  **/
  @:native("wp_link_dialog") public static function wpLinkDialog():Void;
}
