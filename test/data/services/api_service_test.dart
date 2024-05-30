import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_coding_challenge/data/services/api_service.dart';
import 'package:flutter_coding_challenge/data/models/country.dart';
import 'package:flutter_coding_challenge/data/models/state.dart';

void main() {
  late ApiService apiService;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient((request) async {
      if (request.url.path == '/api/v1/countries') {
        return http.Response(
            jsonEncode([
              {"id": 1, "value": "Country 1"},
              {"id": 2, "value": "Country 2"},
            ]),
            200);
      } else if (request.url.path == '/api/v1/countries/1/states') {
        return http.Response(
            jsonEncode([
              {"id": 1, "value": "State 1"},
              {"id": 2, "value": "State 2"},
            ]),
            200);
      }
      return http.Response('Not Found', 404);
    });
    apiService = ApiService(client: mockClient);
  });

  group('ApiService', () {
    test('getCountries returns a list of countries', () async {
      final response = await apiService.getCountries();

      expect(response, isA<List<CountryModel>>());
      expect(response.length, 2);
      expect(response[0].value, 'Country 1');
    });

    test('getStates returns a list of states for a given country', () async {
      final response = await apiService.getStates(1);

      expect(response, isA<List<StateModel>>());
      expect(response.length, 2);
      expect(response[0].value, 'State 1');
    });
  });
}
