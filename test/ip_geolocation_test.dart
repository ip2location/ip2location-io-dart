import 'package:ip2location_io/ip_geolocation.dart';
import 'package:ip2location_io/configuration.dart';
import 'package:test/test.dart';

void main() {
  group('Basic Tests', () {
    test('Keyless', () async {
      var apiKey = '';
      final config = Configuration(apiKey);
      final geo = IPGeolocation(config);

      try {
        final result = await geo.lookUp('8.8.8.8');
        expect(result['country_code'], 'US');
      } catch (e) {
        print('Error: $e');
      }
    });
    test('Invalid Key', () async {
      var apiKey = 'INVALID_KEY';
      final config = Configuration(apiKey);
      final geo = IPGeolocation(config);
      expect(
        () async => await geo.lookUp('8.8.8.8'),
        throwsA(
          predicate(
            (e) => e.toString().contains(
              'Invalid API key or insufficient credit.',
            ),
          ),
        ),
      );
    });
    test('Invalid IP', () async {
      var apiKey = '';
      final config = Configuration(apiKey);
      final geo = IPGeolocation(config);
      expect(
        () async => await geo.lookUp('8.8.8.8x'),
        throwsA(predicate((e) => e.toString().contains('Invalid IP address.'))),
      );
    });
  });
}
