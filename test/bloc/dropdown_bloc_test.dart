import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_coding_challenge/bloc/dropdown_bloc.dart';
import 'package:flutter_coding_challenge/bloc/dropdown_event.dart';
import 'package:flutter_coding_challenge/bloc/dropdown_state.dart';
import 'package:flutter_coding_challenge/data/models/country.dart';
import 'package:flutter_coding_challenge/data/services/api_service.dart';

class TestApiService extends ApiService {
  @override
  Future<List<CountryModel>> getCountries() async {
    return [const CountryModel(id: 1, value: 'Country 1')];
  }
}

void main() {
  late DropdownBloc dropdownBloc;
  late ApiService testApiService;

  setUp(() {
    testApiService = TestApiService();
    dropdownBloc = DropdownBloc(apiService: testApiService);
  });

  blocTest<DropdownBloc, DropdownState>(
    'emits [] when nothing is added',
    build: () => dropdownBloc,
    expect: () => [],
  );

  blocTest<DropdownBloc, DropdownState>(
    'emits [DropdownState] with countries when FetchCountries is added',
    build: () => dropdownBloc,
    act: (bloc) => bloc.add(FetchCountries()),
    expect: () => [
      const DropdownState(
          countries: [CountryModel(id: 1, value: 'Country 1')], states: []),
    ],
  );
}
