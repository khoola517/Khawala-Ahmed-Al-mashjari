import 'package:finallproject/core/models/DetailesVaccineModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DescriptionVaccine {
  Data? data;

  DescriptionVaccine({this.data});

  DescriptionVaccine.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? id;
  String? vaccineName;
  String? vaccineDescription;
  List<VaccineDoses>? vaccineDoses;

  Data({this.id, this.vaccineName, this.vaccineDescription, this.vaccineDoses});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vaccineName = json['vaccineName'];
    vaccineDescription = json['vaccineDescription'];
    if (json['vaccineDoses'] != null) {
      vaccineDoses = <VaccineDoses>[];
      json['vaccineDoses'].forEach((v) {
        vaccineDoses!.add(new VaccineDoses.fromJson(v));
      });
    }
  }
}

class VaccineDoses {
  int? id;
  String? doseNumber;
  String? vaccineAge;

  VaccineDoses({this.id, this.doseNumber, this.vaccineAge});

  VaccineDoses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doseNumber = json['doseNumber'];
    vaccineAge = json['vaccineAge'];
  }
}