import 'package:finallproject/core/tables/vaccine_table.dart';

class VaccineModel {
  VaccineModel({
    this.id,
    required this.title,
    required this.description,
  });
  int? id;
  final String title;
  final String description;
  factory VaccineModel.fromMap(Map<dynamic, dynamic> map) => VaccineModel(
        id: map[VaccineTable.id],
        title: map[VaccineTable.title],
        description: map[VaccineTable.description],
      );
  Map<String, Object?> toMap() => {
        if (id != null) VaccineTable.id: id,
        VaccineTable.title: title,
        VaccineTable.description: description,
      };
}