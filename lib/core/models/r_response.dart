///This is a respose object returned from http requests
class RResponse<T> {
  T? result;
  RResponse({
    this.result,
  });

  RResponse<T> copyWith({
    T? result,
  }) {
    return RResponse<T>(
      result: result ?? this.result,
    );
  }
}
