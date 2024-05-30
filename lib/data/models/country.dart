import 'package:equatable/equatable.dart';

class CountryModel extends Equatable {
  final int id;
  final String value;

  const CountryModel({required this.id, required this.value});

  @override
  List<Object?> get props => [id, value];

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      id: json['id'],
      value: json['value'],
    );
  }
}
