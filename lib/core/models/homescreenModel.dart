class IndexModel {
  int? parentId;
  String? parentName;
  List<Children>? children;
  // List<dynamic>? notifications;

  IndexModel({this.parentId, this.parentName, this.children});

  IndexModel.fromJson(Map<String, dynamic> json) {
    parentId = json['parent_id'];
    parentName = json['Parent Name'];
    if (json['Childern'] != null) {
      children = <Children>[];
      json['Childern'].forEach((v) {
        children!.add(Children.fromJson(v));
      });
    }
    // if (json['notifications'] != null) {
    //   notifications = List<dynamic>.from(json['notifications']);
    // }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = {};
  //   data['parent_id'] = this.parentId;
  //   data['Parent Name'] = this.parentName;
  //   if (this.children != null) {
  //     data['Childern'] = this.children!.map((v) => v.toJson()).toList();
  //   }
  //   if (this.notifications != null) {
  //     data['notifications'] = this.notifications;
  //   }
  //   return data;
  // }
}

class Children {
  int? iD;
  String? firstName;
  String? gender;
  String? age;
  int? allVaccinations;
  int? completedVaccinations;

  Children({this.iD, this.firstName, this.gender, this.age, this.allVaccinations, this.completedVaccinations});

  Children.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    firstName = json['First Name'];
    gender = json['Gender'];
    age = json['Age'];
    allVaccinations = json['allVaccinations'];
    completedVaccinations = json['completedVaccinations'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = {};
  //   data['ID'] = this.iD;
  //   data['First Name'] = this.firstName;
  //   data['Gender'] = this.gender;
  //   data['Age'] = this.age;
  //   data['allVaccinations'] = this.allVaccinations;
  //   data['completedVaccinations'] = this.completedVaccinations;
  //   return data;
  // }
}
