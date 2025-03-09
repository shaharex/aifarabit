class ApiKey {
  static const String apiKey =
      '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';
}

class DeepLKey {
  static const String apiKey = "b04fd492-2615-488b-935e-241c083b3004:fx";
}

final class ApiHeaderKeys {
  static const String authorization = 'Authorization';
  static const String contentType = 'Content-Type';
}

final class ApiHeaderValues {
  static const String applicationJson = 'application/json';
  static String bearer(String key) => 'Bearer $key';
}