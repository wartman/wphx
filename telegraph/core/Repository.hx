package wp.core;

class Repository<T> {

  private var connection:ApiConnection;
  private var url:String;

  public function new(connection:ApiConnection) {
    this.connection = connection;
  }

  public function filter(data:Dynamic):T {
    return cast data;
  }

  #if php
    private function getSync(id:Int):T {
      return filter({});
    }
  #end

  public function get(id:Int):Promise<T> {
    #if php
      var out = getSync(id);
      if (out != null) return Promise.resolve(out);
      return Promise.reject('${id} does not exist');
    #else 
      return connection.fetch(url + id).then(filter);
    #end
  }

  public function query(options:Dynamic):Promise<Array<T>> {
    return Promise.reject('not implemented');
  }

  public function save(data:T):Promise<T> {
    return Promise.reject('Not implemented');
  }

}
