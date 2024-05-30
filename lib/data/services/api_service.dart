import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../data/models/country.dart';
import '../../data/models/state.dart';

class ApiService {
  static const String baseUrl = 'https://api.stagingcupid.com/api/v1';
  static const String apiKey = 'sA,{tzUD=]dHvYNBJ4xVZ3c=&zS%.UqVc{But?kc';

  http.Client client;

  ApiService({http.Client? client}) : client = client ?? http.Client();

  Future<List<CountryModel>> getCountries() async {
    final response = await client.get(
      Uri.parse('$baseUrl/countries'),
      headers: {
        'X-API-Key': apiKey,
        'User-Agent': 'com.stagingcupid.api/10.16.6 (Release) Android/31',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => CountryModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load countries');
    }
  }

  Future<List<StateModel>> getStates(int countryId) async {
    final response = await client.get(
      Uri.parse('$baseUrl/countries/$countryId/states'),
      headers: {
        'X-API-Key': apiKey,
        'User-Agent': 'com.stagingcupid.api/10.16.6 (Release) Android/31',
      },
    );
    // print('Response status code: ${response.statusCode}');
    // print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => StateModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load states');
    }
  }
}
