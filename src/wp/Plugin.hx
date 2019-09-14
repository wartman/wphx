package wp;

import wp.extern.PluginApi;

abstract Plugin(String) {

  public static inline function basename(file:String)
    return PluginApi.pluginBasename(file);

  public function new(name:String)
    this = name;

  public function registerActivationHook(cb:Dynamic)
    PluginApi.registerActivationHook(this, cb); 

}
