import 'package:equatable/equatable.dart';

abstract class DropdownEvent extends Equatable {
  const DropdownEvent();

  @override
  List<Object> get props => [];
}

class FetchCountries extends DropdownEvent {}

class FetchStates extends DropdownEvent {
  final int countryId;

  const FetchStates(this.countryId);

  @override
  List<Object> get props => [countryId];
}
