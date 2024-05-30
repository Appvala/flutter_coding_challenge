import 'package:equatable/equatable.dart';

class StateModel extends Equatable {
  final int id;
  final String value;

  const StateModel({required this.id, required this.value});

  @override
  List<Object?> get props => [id, value];

  factory StateModel.fromJson(Map<String, dynamic> json) {
    return StateModel(
      id: json['id'],
      value: json['value'],
    );
  }
}
