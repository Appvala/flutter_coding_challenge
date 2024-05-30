import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coding_challenge/bloc/dropdown_event.dart';
import 'package:flutter_coding_challenge/bloc/dropdown_state.dart';

import '../data/services/api_service.dart';

class DropdownBloc extends Bloc<DropdownEvent, DropdownState> {
  final ApiService apiService;

  DropdownBloc({required this.apiService}) : super(const DropdownState()) {
    // Register event handlers
    on<FetchCountries>(_onFetchCountries);
    on<FetchStates>(_onFetchStates);
  }

  void _onFetchCountries(
      FetchCountries event, Emitter<DropdownState> emit) async {
    try {
      final countries = await apiService.getCountries();
      emit(state.copyWith(countries: countries, states: []));
    } catch (e) {
      emit(state);
    }
  }

  void _onFetchStates(FetchStates event, Emitter<DropdownState> emit) async {
    // print('Received event to fetch states for country ID: ${event.countryId}');
    try {
      final states = await apiService.getStates(event.countryId);
      emit(state.copyWith(states: states));
    } catch (e) {
      emit(state);
    }
  }
}
