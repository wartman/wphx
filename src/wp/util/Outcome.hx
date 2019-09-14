package wp.util;

enum Outcome<A, B> {
  Success(value:A);
  Failure(value:B);
}
