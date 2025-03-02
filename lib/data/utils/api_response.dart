class ApiResponse<T> {
  final String documentationUrl;
  final T? data;
  final String message;

  ApiResponse({
    required this.documentationUrl,
    required this.data,
    required this.message,
  });

  factory ApiResponse.fromJson({
    required Map<String, dynamic> json,
    required T Function(dynamic) data,
  }) {
    return ApiResponse<T>(
      documentationUrl: json['documentation_url'],
      message: json['q'],
      data: json['docs'] != null ? data(json['docs']) : null,
    );
  }
}
