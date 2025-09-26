import 'package:ip2location_io/hosted_domain.dart';
import 'package:ip2location_io/configuration.dart';
import 'package:test/test.dart';

void main() {
  group('Basic Tests', () {
    test('With Real Key', () async {
      var apiKey = 'YOUR_API_KEY';
      final config = Configuration(apiKey);
      final hd = HostedDomain(config);

      try {
        final result = await hd.lookUp('8.8.8.8');
        expect(result['ip'], '8.8.8.8');
      } catch (e) {
        print('Error: $e');
      }
    }, skip: 'Skip real key test unless you have a real API key.');
    test('Invalid Key', () async {
      var apiKey = 'INVALID_KEY';
      final config = Configuration(apiKey);
      final hd = HostedDomain(config);
      expect(
        () async => await hd.lookUp('8.8.8.8'),
        throwsA(predicate((e) => e.toString().contains('API key not found.'))),
      );
    });
  });
}
