class DataModel {
  String id, fullName, tagLine, profilePicture;
  DataModel({required this.id,required this.fullName,required this.tagLine,required this.profilePicture});

  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
      id: map['id'] as String,
      fullName: map['fullName'] as String,
      tagLine: map['tagLine'] as String,
      profilePicture: map['profilePicture'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'fullName': this.fullName,
      'tagLine': this.tagLine,
      'profilePicture': this.profilePicture,
    } as Map<String, dynamic>;
  }
}
