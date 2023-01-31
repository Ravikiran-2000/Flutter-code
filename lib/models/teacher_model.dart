class TeacherModel {
  TeacherModel({
    this.code,
    this.name,
    this.image,
  });

  TeacherModel.fromJson(dynamic json) {
    code = json['Code'];
    name = json['Name'];
    image = json['Image'];
  }

  String? code;
  String? name;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Code'] = code;
    map['Name'] = name;
    map['Image'] = image;
    return map;
  }
}
