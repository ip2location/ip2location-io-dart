# Quickstart

## Dependencies

This module requires API key to function. You may sign up for a free API key at <https://www.ip2location.io/pricing>.

## Installation

Install this package using the command below:

``` bash
dart pub add ip2location_io
```

## Sample Codes

### Lookup IP Address Geolocation Data

You can make a geolocation data lookup for an IP address as below:

``` dart
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
```

### Lookup Domain Information

You can lookup domain information as below:

```dart
import 'package:ip2location_io/domain_whois.dart';
import 'package:ip2location_io/configuration.dart';

Future<void> main() async {
  var apiKey = 'YOUR_API_KEY';
  final config = Configuration(apiKey);
  final who = DomainWhois(config);

  try {
    final result = await who.lookUp('locaproxy.com');
    print(result);
  } catch (e) {
    print('Error: $e');
  }
}
```

### Convert Normal Text to Punycode

You can convert an international domain name to Punycode as below:

```dart
import 'package:ip2location_io/domain_whois.dart';
import 'package:ip2location_io/configuration.dart';

Future<void> main() async {
  var apiKey = '';
  final config = Configuration(apiKey);
  final who = DomainWhois(config);

  try {
    print(who.toPunycode('täst.de'));
  } catch (e) {
    print('Error: $e');
  }
}
```

### Convert Punycode to Normal Text

You can convert a Punycode to international domain name as below:

```dart
import 'package:ip2location_io/domain_whois.dart';
import 'package:ip2location_io/configuration.dart';

Future<void> main() async {
  var apiKey = '';
  final config = Configuration(apiKey);
  final who = DomainWhois(config);

  try {
    print(who.toNormalText('xn--tst-qla.de'));
  } catch (e) {
    print('Error: $e');
  }
}
```

### Get Domain Name

You can extract the domain name from an url as below:

```dart
import 'package:ip2location_io/domain_whois.dart';
import 'package:ip2location_io/configuration.dart';

Future<void> main() async {
  var apiKey = '';
  final config = Configuration(apiKey);
  final who = DomainWhois(config);

  try {
    print(who.toDomainName('https://www.example.com/exe'));
  } catch (e) {
    print('Error: $e');
  }
}
```

### Get Domain Extension

You can extract the domain extension from a domain name or url as below:

```dart
import 'package:ip2location_io/domain_whois.dart';
import 'package:ip2location_io/configuration.dart';

Future<void> main() async {
  var apiKey = '';
  final config = Configuration(apiKey);
  final who = DomainWhois(config);

  try {
    print(who.toDomainExtension('example.com'));
  } catch (e) {
    print('Error: $e');
  }
}
```

### Lookup IP Address Hosted Domains Data

You can make a hosted domains data lookup for an IP address as below:

``` dart
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
```
