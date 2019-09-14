package wp;

import wp.extern.ThemeApi;
import wp.extern.Theme as WpTheme;

@:forward
abstract Theme(WpTheme) to WpTheme from WpTheme {
  
  public static inline final init = new Action('init');
  public static inline final setup = new Action('after_setup_theme');
  public static inline final enqueueAssets = new Action('wp_enqueue_scripts');

  public static inline function get(?stylesheet:String, ?themeRoot:String):Theme {
    return ThemeApi.wpGetTheme(stylesheet, themeRoot);
  }

  public function new(themeDir:String, themeRoot:String) {
    this = new WpTheme(themeDir, themeRoot);
  }

}
