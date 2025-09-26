import 'package:ip2location_io/hosted_domain.dart';
import 'package:ip2location_io/configuration.dart';

Future<void> main() async {
  var apiKey = 'YOUR_API_KEY';
  final config = Configuration(apiKey);
  final hd = HostedDomain(config);

  try {
    final result = await hd.lookUp('8.8.8.8');
    print(result);
  } catch (e) {
    print('Error: $e');
  }
}
