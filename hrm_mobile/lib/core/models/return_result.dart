class ReturnResult<T> {
  final T? result;
  final String? message;
  ReturnResult({
    this.result,
    this.message,
  });

  factory ReturnResult.fromJson(Map<String, dynamic> json) {
    return ReturnResult(
      result: json['result'] as T?,
      message: json['message'] as String?
    );
  }
}