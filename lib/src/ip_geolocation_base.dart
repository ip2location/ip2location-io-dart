import 'dart:convert';
import 'package:http/http.dart' as http;
import 'configuration_base.dart';

/// This class performs the lookup of geolocation data from an IP address
/// by querying the IP2Location.io API.
class IPGeolocation {
  static const String _baseUrl = 'https://api.ip2location.io/';
  static const String _format = 'json';
  static const String _error = 'IPGeolocation lookup error.';

  final Configuration _configuration;

  IPGeolocation(this._configuration);

  /// Query IP2Location.io geolocation data with an IP address.
  Future<Map<String, dynamic>> lookUp(String ip, [String language = '']) async {
    final uri = Uri.parse(_baseUrl).replace(
      queryParameters: {
        'format': _format,
        'source': _configuration.source,
        'source_version': _configuration.sourceVersion,
        'key': Uri.encodeQueryComponent(_configuration.apiKey),
        'ip': Uri.encodeQueryComponent(ip),
        'lang': Uri.encodeQueryComponent(language),
      },
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else if (response.statusCode == 400 || response.statusCode == 401) {
      final body = jsonDecode(response.body);
      if (body is Map && body.containsKey('error')) {
        final error = body['error'];
        if (error is Map && error.containsKey('error_message')) {
          throw Exception(error['error_message']);
        }
      }
    }

    throw Exception(_error);
  }
}
