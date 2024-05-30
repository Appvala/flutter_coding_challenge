import 'package:equatable/equatable.dart';
import '../data/models/country.dart';
import '../data/models/state.dart';

class DropdownState extends Equatable {
  final List<CountryModel>? countries;
  final List<StateModel>? states;
  final CountryModel? selectedCountry;
  final StateModel? selectedState;

  const DropdownState({
    this.countries,
    this.states,
    this.selectedCountry,
    this.selectedState,
  });

  DropdownState copyWith({
    List<CountryModel>? countries,
    List<StateModel>? states,
    CountryModel? selectedCountry,
    StateModel? selectedState,
  }) {
    final newState = DropdownState(
      countries: countries ?? this.countries,
      states: states ?? this.states,
      selectedCountry: selectedCountry ?? this.selectedCountry,
      selectedState: selectedState ?? this.selectedState,
    );
    // print('New state: $newState');
    return newState;
  }

  @override
  List<Object?> get props =>
      [countries, states, selectedCountry, selectedState];
}
