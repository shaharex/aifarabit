class ApiKey {
  static const String apiKey =
      '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';
}

final class ApiHeaderKeys {
  static const String authorization = 'Authorization';
  static const String contentType = 'Content-Type';
}

final class ApiHeaderValues {
  static const String applicationJson = 'application/json';
  static String bearer(String key) => 'Bearer $key';
}