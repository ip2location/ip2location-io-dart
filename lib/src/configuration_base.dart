/// Configuration class holding API key, source and version.
class Configuration {
  /// The IP2Location.io API key.
  late String apiKey;
  /// The version of the SDK.
  final String sourceVersion = '1.0.1';
  /// The SDK type.
  final String source = 'sdk-dart-iplio''';

  Configuration(this.apiKey);
}
