package wp.extern;

@:native("WP_Locale")
extern class Locale {
  /**
    
     Stores the translated strings for the full weekday names.
    
     @since 2.1.0
     @var array
    
  **/
  @:native("weekday") public var weekday:php.NativeStructArray<Dynamic>;
  /**
    
     Stores the translated strings for the one character weekday names.
    
     There is a hack to make sure that Tuesday and Thursday, as well
     as Sunday and Saturday, don't conflict. See init() method for more.
    
     @see WP_Locale::init() for how to handle the hack.
    
     @since 2.1.0
     @var array
    
  **/
  @:native("weekday_initial") public var weekdayInitial:php.NativeStructArray<Dynamic>;
  /**
    
     Stores the translated strings for the abbreviated weekday names.
    
     @since 2.1.0
     @var array
    
  **/
  @:native("weekday_abbrev") public var weekdayAbbrev:php.NativeStructArray<Dynamic>;
  /**
    
     Stores the translated strings for the full month names.
    
     @since 2.1.0
     @var array
    
  **/
  @:native("month") public var month:php.NativeStructArray<Dynamic>;
  /**
    
     Stores the translated strings for the month names in genitive case, if the locale specifies.
    
     @since 4.4.0
     @var array
    
  **/
  @:native("month_genitive") public var monthGenitive:php.NativeStructArray<Dynamic>;
  /**
    
     Stores the translated strings for the abbreviated month names.
    
     @since 2.1.0
     @var array
    
  **/
  @:native("month_abbrev") public var monthAbbrev:php.NativeStructArray<Dynamic>;
  /**
    
     Stores the translated strings for 'am' and 'pm'.
    
     Also the capitalized versions.
    
     @since 2.1.0
     @var array
    
  **/
  @:native("meridiem") public var meridiem:php.NativeStructArray<Dynamic>;
  /**
    
     The text direction of the locale language.
    
     Default is left to right 'ltr'.
    
     @since 2.1.0
     @var string
    
  **/
  @:native("text_direction") public var textDirection:String;
  /**
    
     The thousands separator and decimal point values used for localizing numbers.
    
     @since 2.3.0
     @var array
    
  **/
  @:native("number_format") public var numberFormat:php.NativeStructArray<Dynamic>;
  /**
    
     Constructor which calls helper methods to set up object variables.
    
     @since 2.1.0
    
  **/
  public function new():Void;
  /**
    
     Sets up the translated strings and object properties.
    
     The method creates the translatable strings for various
     calendar elements. Which allows for specifying locale
     specific calendar names and text direction.
    
     @since 2.1.0
    
     @global string $text_direction
    
  **/
  @:native("init") public function init():Void;
  /**
    
     Outputs an admin notice if the /build directory must be used for RTL.
    
     @since 3.8.0
    
  **/
  @:native("rtl_src_admin_notice") public function rtlSrcAdminNotice():Void;
  /**
    
     Retrieve the full translated weekday word.
    
     Week starts on translated Sunday and can be fetched
     by using 0 (zero). So the week starts with 0 (zero)
     and ends on Saturday with is fetched by using 6 (six).
    
     @since 2.1.0
    
     @param int $weekday_number 0 for Sunday through 6 Saturday.
     @return string Full translated weekday.
    
  **/
  @:native("get_weekday") public function getWeekday(weekday_number:Int):String;
  /**
    
     Retrieve the translated weekday initial.
    
     The weekday initial is retrieved by the translated
     full weekday word. When translating the weekday initial
     pay attention to make sure that the starting letter does
     not conflict.
    
     @since 2.1.0
    
     @param string $weekday_name Full translated weekday word.
     @return string Translated weekday initial.
    
  **/
  @:native("get_weekday_initial") public function getWeekdayInitial(weekday_name:String):String;
  /**
    
     Retrieve the translated weekday abbreviation.
    
     The weekday abbreviation is retrieved by the translated
     full weekday word.
    
     @since 2.1.0
    
     @param string $weekday_name Full translated weekday word.
     @return string Translated weekday abbreviation.
    
  **/
  @:native("get_weekday_abbrev") public function getWeekdayAbbrev(weekday_name:String):String;
  /**
    
     Retrieve the full translated month by month number.
    
     The $month_number parameter has to be a string
     because it must have the '0' in front of any number
     that is less than 10. Starts from '01' and ends at
     '12'.
    
     You can use an integer instead and it will add the
     '0' before the numbers less than 10 for you.
    
     @since 2.1.0
    
     @param string|int $month_number '01' through '12'.
     @return string Translated full month name.
    
  **/
  @:native("get_month") public function getMonth(month_number:haxe.extern.EitherType<String, Int>):String;
  /**
    
     Retrieve translated version of month abbreviation string.
    
     The $month_name parameter is expected to be the translated or
     translatable version of the month.
    
     @since 2.1.0
    
     @param string $month_name Translated month to get abbreviated version.
     @return string Translated abbreviated month.
    
  **/
  @:native("get_month_abbrev") public function getMonthAbbrev(month_name:String):String;
  /**
    
     Retrieve translated version of meridiem string.
    
     The $meridiem parameter is expected to not be translated.
    
     @since 2.1.0
    
     @param string $meridiem Either 'am', 'pm', 'AM', or 'PM'. Not translated version.
     @return string Translated version
    
  **/
  @:native("get_meridiem") public function getMeridiem(meridiem:String):String;
  /**
    
     Global variables are deprecated.
    
     For backward compatibility only.
    
     @deprecated For backward compatibility only.
    
     @global array $weekday
     @global array $weekday_initial
     @global array $weekday_abbrev
     @global array $month
     @global array $month_abbrev
    
     @since 2.1.0
    
  **/
  @:native("register_globals") public function registerGlobals():Void;
  /**
    
     Checks if current locale is RTL.
    
     @since 3.0.0
     @return bool Whether locale is RTL.
    
  **/
  @:native("is_rtl") public function isRtl():Bool;
  /**
    
     Register date/time format strings for general POT.
    
     Private, unused method to add some date/time formats translated
     on wp-admin/options-general.php to the general POT that would
     otherwise be added to the admin POT.
    
     @since 3.6.0
    
  **/
  @:native("_strings_for_pot") public function _stringsForPot():Void;
}
