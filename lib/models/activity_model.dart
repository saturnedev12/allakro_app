class ActivityModel {
  ActivityModel({
    this.profession = '',
    this.members = 0,
  });

  String profession;
  int members;

  factory ActivityModel.fromJson(Map<String, dynamic> json) => ActivityModel(
        profession: json["profession"] ?? '',
        members: json["members"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "profession": profession,
        "members": members,
      };
}
