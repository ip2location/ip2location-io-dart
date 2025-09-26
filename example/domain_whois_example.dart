import 'package:ip2location_io/domain_whois.dart';
import 'package:ip2location_io/configuration.dart';

Future<void> main() async {
  var apiKey = 'YOUR_API_KEY';
  final config = Configuration(apiKey);
  final who = DomainWhois(config);

  try {
    final result = await who.lookUp('locaproxy.com');
    print(result);

    print(who.toPunycode('täst.de'));
    print(who.toNormalText('xn--tst-qla.de'));
    print(who.toDomainName('https://www.example.com/exe'));
    print(who.toDomainExtension('example.com'));
  } catch (e) {
    print('Error: $e');
  }
}
