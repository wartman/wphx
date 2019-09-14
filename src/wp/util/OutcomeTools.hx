package wp.util;

class OutcomeTools {
  
  /**
    Get the value of an outcome. If `Failure`, throw the failed
    value.
  **/
  public static function sure<A, B>(outcome:Outcome<A, B>) {
    return switch outcome {
      case Success(value): value;
      case Failure(err): throw err;
    }
  }

}
