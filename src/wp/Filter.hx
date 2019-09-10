package wp;

using wp.api.PluginApi;

abstract Filter(String) from String to String {

  public inline function new(tag:String)
    this = tag;

  public inline function add<T>(cb:(args:T)->T, priority:Int = 10, acceptedArgs:Int = 1)
    return PluginApi.addFilter(this, cb, priority, acceptedArgs);

  public inline function remove<T>(cb:(args:T)->T, ?priority:Int)
    return PluginApi.removeFilter(this, cb, priority);

  public inline function dispatch<T>(payload:T):T
    return PluginApi.applyFilters(this, payload);

}
