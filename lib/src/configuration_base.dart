/// Configuration class holding API key, source and version.
class Configuration {
  late String apiKey;
  final String sourceVersion = "sdk-dart-iplio";
  final String source = "1.0.0";

  Configuration(this.apiKey);
}
