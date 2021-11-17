class PeopleModel {
  int id;
  String name;
  String profilePath;

  PeopleModel({
    this.id,
    this.name,
    this.profilePath,
  });

  PeopleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    profilePath = json['profile_path'];
  }
}
