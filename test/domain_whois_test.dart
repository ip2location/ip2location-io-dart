import 'package:ip2location_io/domain_whois.dart';
import 'package:ip2location_io/configuration.dart';
import 'package:test/test.dart';

void main() {
  group('Basic Tests', () {
    test('Invalid Key', () async {
      var apiKey = 'INVALID_KEY';
      final config = Configuration(apiKey);
      final who = DomainWhois(config);
      expect(
        () async => await who.lookUp('locaproxy.com'),
        throwsA(predicate((e) => e.toString().contains('API key not found.'))),
      );
    });
    test('Use Real Key', () async {
      var apiKey = 'YOUR_API_KEY';
      final config = Configuration(apiKey);
      final who = DomainWhois(config);
      try {
        final result = await who.lookUp('locaproxy.com');
        expect(result['domain'], 'locaproxy.com');
      } catch (e) {
        print('Error: $e');
      }
    }, skip: 'Skip real key test unless you have real key.');
    test('To Punycode', () {
      var apiKey = '';
      final config = Configuration(apiKey);
      final who = DomainWhois(config);
      final result = who.toPunycode('täst.de');
      expect(result, 'xn--tst-qla.de');
    });
    test('To Normal Text', () {
      var apiKey = '';
      final config = Configuration(apiKey);
      final who = DomainWhois(config);
      final result = who.toNormalText('xn--tst-qla.de');
      expect(result, 'täst.de');
    });
    test('Get Domain Name', () {
      var apiKey = '';
      final config = Configuration(apiKey);
      final who = DomainWhois(config);
      final result = who.toDomainName('https://www.example.com/exe');
      expect(result, 'example.com');
    });
    test('Get Domain Extension', () {
      var apiKey = '';
      final config = Configuration(apiKey);
      final who = DomainWhois(config);
      final result = who.toDomainExtension('example.com');
      expect(result, '.com');
    });
  });
}
