package wp.extern;

@:native("WP_Locale_Switcher")
extern class LocaleSwitcher {
  /**
    
     Constructor.
    
     Stores the original locale as well as a list of all available languages.
    
     @since 4.7.0
    
  **/
  public function new():Void;
  /**
    
     Initializes the locale switcher.
    
     Hooks into the {@see 'locale'} filter to change the locale on the fly.
    
     @since 4.7.0
    
  **/
  @:native("init") public function init():Void;
  /**
    
     Switches the translations according to the given locale.
    
     @since 4.7.0
    
     @param string $locale The locale to switch to.
     @return bool True on success, false on failure.
    
  **/
  @:native("switch_to_locale") public function switchToLocale(locale:String):Bool;
  /**
    
     Restores the translations according to the previous locale.
    
     @since 4.7.0
    
     @return string|false Locale on success, false on failure.
    
  **/
  @:native("restore_previous_locale") public function restorePreviousLocale():haxe.extern.EitherType<String, Bool>;
  /**
    
     Restores the translations according to the original locale.
    
     @since 4.7.0
    
     @return string|false Locale on success, false on failure.
    
  **/
  @:native("restore_current_locale") public function restoreCurrentLocale():haxe.extern.EitherType<String, Bool>;
  /**
    
     Whether switch_to_locale() is in effect.
    
     @since 4.7.0
    
     @return bool True if the locale has been switched, false otherwise.
    
  **/
  @:native("is_switched") public function isSwitched():Bool;
  /**
    
     Filters the locale of the WordPress installation.
    
     @since 4.7.0
    
     @param string $locale The locale of the WordPress installation.
     @return string The locale currently being switched to.
    
  **/
  @:native("filter_locale") public function filterLocale(locale:String):String;
}
