import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  group('Get availability API call test', () {
    test('Rocket list api', () async {
      final response =
          await http.get(Uri.parse('https://api.spacexdata.com/v4/rockets'));

      expect(response.statusCode, 200);
      expect(response.body, isNotNull);
    });

    test('Rocket list details api', () async {
      final response = await http.get(Uri.parse(
          'https://api.spacexdata.com/v4/rockets/5e9d0d96eda699382d09d1ee'));

      expect(response.statusCode, 200);
      expect(response.body, isNotNull);
    });
  });
}
