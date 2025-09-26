import 'package:ip2location_io/ip_geolocation.dart';
import 'package:ip2location_io/configuration.dart';

Future<void> main() async {
  var apiKey = 'YOUR_API_KEY';
  final config = Configuration(apiKey);
  final geo = IPGeolocation(config);

  try {
    final result = await geo.lookUp('8.8.8.8');
    print(result);
  } catch (e) {
    print('Error: $e');
  }
}
