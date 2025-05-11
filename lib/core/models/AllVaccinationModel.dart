class AllVaccinationModel {
  String? childName;
  String? childAge;
  String? childGender;
  CompletedDoses? completedDoses;
  UpcomingDoses? upcomingDoses;

  AllVaccinationModel(
      {this.childName,
      this.childAge,
      this.childGender,
      this.completedDoses,
      this.upcomingDoses});

  AllVaccinationModel.fromJson(Map<String, dynamic> json) {
    childName = json['childName'];
    childAge = json['childAge'];
    childGender = json['childGender'];
    completedDoses = json['completedDoses'] != null
        ? new CompletedDoses.fromJson(json['completedDoses'])
        : null;
    upcomingDoses = json['upcomingDoses'] != null
        ? new UpcomingDoses.fromJson(json['upcomingDoses'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['childName'] = this.childName;
    data['childAge'] = this.childAge;
    data['childGender'] = this.childGender;
    if (this.completedDoses != null) {
      data['completedDoses'] = this.completedDoses!.toJson();
    }
    if (this.upcomingDoses != null) {
      data['upcomingDoses'] = this.upcomingDoses!.toJson();
    }
    return data;
  }
}

class CompletedDoses {
  List<Doses>? doses;
  int? allDoses;
  int? completedDoses;

  CompletedDoses({this.doses, this.allDoses, this.completedDoses});

  CompletedDoses.fromJson(Map<String, dynamic> json) {
    if (json['Doses'] != null) {
      doses = <Doses>[];
      json['Doses'].forEach((v) {
        doses!.add(new Doses.fromJson(v));
      });
    }
    allDoses = json['allDoses'];
    completedDoses = json['completedDoses'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.doses != null) {
      data['Doses'] = this.doses!.map((v) => v.toJson()).toList();
    }
    data['allDoses'] = this.allDoses;
    data['completedDoses'] = this.completedDoses;
    return data;
  }
}

class Doses {
  String? vaccineName;
  String? doseNumber;
  String? visitDate;

  Doses({this.vaccineName, this.doseNumber, this.visitDate});

  Doses.fromJson(Map<String, dynamic> json) {
    vaccineName = json['vaccine_name'];
    doseNumber = json['dose_number'];
    visitDate = json['visit_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vaccine_name'] = this.vaccineName;
    data['dose_number'] = this.doseNumber;
    data['visit_date'] = this.visitDate;
    return data;
  }
}

class UpcomingDoses {
  List<TheDoses>? theDoses;
  int? allTheDoses;
  int? upComingDoses;

  UpcomingDoses({this.theDoses, this.allTheDoses, this.upComingDoses});

  UpcomingDoses.fromJson(Map<String, dynamic> json) {
    if (json['theDoses'] != null) {
      theDoses = <TheDoses>[];
      json['theDoses'].forEach((v) {
        theDoses!.add(new TheDoses.fromJson(v));
      });
    }
    allTheDoses = json['allTheDoses'];
    upComingDoses = json['upComingDoses'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.theDoses != null) {
      data['theDoses'] = this.theDoses!.map((v) => v.toJson()).toList();
    }
    data['allTheDoses'] = this.allTheDoses;
    data['upComingDoses'] = this.upComingDoses;
    return data;
  }
}

class TheDoses {
  String? vaccineName;
  String? doseNumber;
  String? vaccinationDate;

  TheDoses({this.vaccineName, this.doseNumber, this.vaccinationDate});

  TheDoses.fromJson(Map<String, dynamic> json) {
    vaccineName = json['vaccine_name'];
    doseNumber = json['dose_number'];
    vaccinationDate = json['vaccination_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vaccine_name'] = this.vaccineName;
    data['dose_number'] = this.doseNumber;
    data['vaccination_date'] = this.vaccinationDate;
    return data;
  }
}