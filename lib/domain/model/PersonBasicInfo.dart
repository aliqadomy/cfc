class PersonBasicInfo {
  PersonBasicInfo({
      this.birthDateG, 
      this.familyName, 
      this.familyNameT, 
      this.fatherName, 
      this.fatherNameT, 
      this.firstNameT, 
      this.firstName, 
      this.grandFatherName, 
      this.grandFatherNameT, 
      this.nationalityDescAr, 
      this.sexDescAr,});

  PersonBasicInfo.fromJson(dynamic json) {
    birthDateG = json['birthDateG'];
    familyName = json['familyName'];
    familyNameT = json['familyNameT'];
    fatherName = json['fatherName'];
    fatherNameT = json['fatherNameT'];
    firstNameT = json['firstNameT'];
    firstName = json['firstName'];
    grandFatherName = json['grandFatherName'];
    grandFatherNameT = json['grandFatherNameT'];
    nationalityDescAr = json['nationalityDescAr'];
    sexDescAr = json['sexDescAr'];
  }
  String? birthDateG;
  String? familyName;
  String? familyNameT;
  String? fatherName;
  String? fatherNameT;
  String? firstNameT;
  String? firstName;
  String? grandFatherName;
  String? grandFatherNameT;
  String? nationalityDescAr;
  String? sexDescAr;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['birthDateG'] = birthDateG;
    map['familyName'] = familyName;
    map['familyNameT'] = familyNameT;
    map['fatherName'] = fatherName;
    map['fatherNameT'] = fatherNameT;
    map['firstNameT'] = firstNameT;
    map['firstName'] = firstName;
    map['grandFatherName'] = grandFatherName;
    map['grandFatherNameT'] = grandFatherNameT;
    map['nationalityDescAr'] = nationalityDescAr;
    map['sexDescAr'] = sexDescAr;
    return map;
  }

}