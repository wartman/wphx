package wp.core;

#if js

  typedef Promise<T> = js.Promise<T>;

#else 

  typedef PromiseCallback<T, R> = T -> R;

  // A syncronous promise shim.
  class Promise<T> {

    public static function resolve<T>(?value:T):Promise<T> {
      return new Promise(function (res, rej) res(value));
    }

    public static function reject<T>(?value:Dynamic):Promise<T> {
      return new Promise(function (res, rej) rej(value));
    }

    // todo: `all` and `race`.
    // see: https://github.com/HaxeFoundation/haxe/blob/development/std/js/Promise.hx

    private var value:T;
    private var failed:Bool = false;
    private var err:Dynamic;

    public function new(init:(T->Void) -> (Dynamic->Void) -> Void) {
      init(function (value) {
        this.value = value;
      }, function(err) {
        this.failed = true;
        this.err = err;
      });
    }

    public function then<R>(fulfill:PromiseCallback<T, R>, ?reject:PromiseCallback<Dynamic, R>):Promise<R> {
      if (this.failed) {
        return this.catchError(reject);
      }
      try {
        var out = fulfill(this.value);
        if (Std.is(out, Promise)) return cast out;
        return Promise.resolve(out);
      } catch (err:Dynamic) {
        var failed:Promise<R> = Promise.reject(err);
        return failed;
      }
    }

    public function catchError<R>(reject:PromiseCallback<Dynamic, R>):Promise<R> {
      if (this.failed) {
        var out = reject(this.err);
        if (Std.is(out, Promise)) return cast out;
        return Promise.reject(out);
      }
      return cast Promise.resolve(this.value);
    }

  }

#end