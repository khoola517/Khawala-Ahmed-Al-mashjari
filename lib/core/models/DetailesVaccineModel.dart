class DetailesVaccine {
  String? stageName;
  int? startAge;
  int? endAge;
  List<Vaccines>? vaccines;

  DetailesVaccine({this.stageName, this.startAge, this.endAge, this.vaccines});

  factory DetailesVaccine.fromJson(Map<String, dynamic> json) {
    List<Vaccines>? vaccineList;
    if (json['vaccines'] is List) {
      try {
        vaccineList = (json['vaccines'] as List)
            .map((v) => Vaccines.fromJson(v))
            .toList();
      } catch (e) {
        print("Error parsing vaccines list: $e");
        vaccineList = [];
      }
    }

    return DetailesVaccine(
      stageName: json['stage_name']?.toString(),
      //startAge: int.tryParse(json['start_age']?.toString() ?? ''),
      //endAge: int.tryParse(json['end_age']?.toString() ?? ''),
      vaccines: vaccineList,
    );
  }
}

class Vaccines {
  int? vaccineId;
  String? vaccineName;
  String? description;
  String? doseNumber;

  Vaccines({this.vaccineId, this.vaccineName, this.description, this.doseNumber});

  factory Vaccines.fromJson(Map<String, dynamic> json) {
    return Vaccines(
      vaccineId: int.tryParse(json['vaccine_id']?.toString() ?? ''),
      vaccineName: json['vaccine_name']?.toString(),
      description: json['description']?.toString(),
      doseNumber: json['dose_number']?.toString(),
    );
  }

}





// class DetailesVaccine {
//   String? stageName;
//   int? startAge;
//   int? endAge;
//   List<Vaccines>? vaccines;

//   DetailesVaccine({this.stageName, this.startAge, this.endAge, this.vaccines});

//   DetailesVaccine.fromJson(Map<String, dynamic> json) {
//     stageName = json['stage_name'];
//     startAge = json['start_age'];
//     endAge = json['end_age'];
//     if (json['vaccines'] != null) {
//       vaccines = <Vaccines>[];
//       json['vaccines'].forEach((v) {
//         vaccines!.add(new Vaccines.fromJson(v));
//       });
//     }
//   }
// }

// class Vaccines {
//   int? vaccineId;
//   String? vaccineName;
//   String? description;
//   String? doseNumber;

//   Vaccines(
//       {this.vaccineId, this.vaccineName, this.description, this.doseNumber});

//   Vaccines.fromJson(Map<String, dynamic> json) {
//     vaccineId = json['vaccine_id'];
//     vaccineName = json['vaccine_name'];
//     description = json['description'];
//     doseNumber = json['dose_number'];
//   }
// }