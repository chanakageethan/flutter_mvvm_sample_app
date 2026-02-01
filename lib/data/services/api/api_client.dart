abstract class ApiClient {
  Future<ApiResponse> get(String path,
      {Map<String, dynamic>? query, Map<String, String>? header});

  Future<ApiResponse> post(String path,
      {Object? data,
        Map<String, dynamic>? query,
        Map<String, dynamic>? header});

  Future<ApiResponse> put(
      String path, {
        Object? data,
        Map<String, dynamic>? query,
        Map<String, String>? header,
      });

  Future<ApiResponse> delete(
      String path, {
        Map<String, dynamic>? data,
        Map<String, dynamic>? query,
        Map<String, String>? header,
      });
}

enum Status {
  success,
  httpClientException,
  exception,
  unknownError,
  noInternet,
}

class ApiResponse {
  Status status;
  dynamic body;
  int? code;
  String? message;

  ApiResponse({required this.status});
}