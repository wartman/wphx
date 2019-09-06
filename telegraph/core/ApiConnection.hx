package wp.core;

import haxe.Json;
import haxe.Http;
import haxe.io.Path;
import wp.core.Promise;

class ApiConnection {

  private var root:String;
  private var nonce:String;

  public function new(root:String, nonce:String) {
    this.root = root;
    this.nonce = nonce;
  }

  public function fetch(url:String):Promise<Dynamic> {
    #if php
      var data = Http.requestUrl(Path.join([ root, url ]));
      return Promise.resolve(Json.parse(data));
    #else
      return new Promise(function (res, rej) {
        var request = new Http(Path.join([ root, url ]));
        request.onData = function (data) { 
          var json = Json.parse(data);
          res(json);
        }
        request.onError = function (err) {
          rej(err);
        }
        request.request();
      });
    #end
  }

}
