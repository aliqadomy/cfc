class PersonIdInfo {
  PersonIdInfo({
      this.idExpirationDate,});

  PersonIdInfo.fromJson(dynamic json) {
    idExpirationDate = json['idExpirationDate'];
  }
  String? idExpirationDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['idExpirationDate'] = idExpirationDate;
    return map;
  }

}