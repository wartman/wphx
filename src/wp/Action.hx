package wp;

using wp.extern.PluginApi;

abstract Action(String) from String to String {

  public inline function new(tag:String)
    this = tag;

  public inline function add<T>(cb:(args:T)->Void, priority:Int = 10, acceptedArgs:Int = 1)
    return PluginApi.addAction(this, cb, priority, acceptedArgs);

  public inline function remove<T>(cb:(args:T)->Void, ?priority:Int)
    return PluginApi.removeAction(this, cb, priority);

  public inline function dispatch<T>(payload:T)
    PluginApi.doAction(this, payload);

}
