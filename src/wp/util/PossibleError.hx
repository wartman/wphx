package wp.util;

import haxe.extern.EitherType;
import wp.extern.Error;

abstract PossibleError<T>(Outcome<T, Error>) to Outcome<T, Error> {

  @:from public static function ofError(err:Error) {
    return new PossibleError(Failure(err));
  }

  @:from public static function ofValue<T>(value:T) {
    return new PossibleError(Success(value));
  }

  @:from public static function ofEitherType<T>(value:EitherType<T, Error>):PossibleError<T> {
    if (Std.is(value, Error)) {
      return ofError(value);
    }
    return ofValue(value);
  }

  inline public function new(outcome:Outcome<T, Error>) {
    this = outcome;
  }

}
