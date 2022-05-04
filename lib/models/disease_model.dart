class DiseaseModel {
  DiseaseModel({
    this.id = 0,
    this.nameDisease = '',
    this.status = '',
    this.description = '',
    this.numberAffected = 0,
    this.numberHealed = 0,
    this.dateAppearance,
  });

  int id;
  String nameDisease;
  String status;
  String description;
  int numberAffected;
  int numberHealed;
  DateTime? dateAppearance;

  factory DiseaseModel.fromJson(Map<String, dynamic> json) => DiseaseModel(
        id: json["id"] ?? '',
        nameDisease: json["name_disease"] ?? '',
        status: json["status"] ?? '',
        description: json["description"] ?? '',
        numberAffected: json["number_affected"] ?? 0,
        numberHealed: json["number_healed"] ?? 0,
        dateAppearance: json["date_appearance"] == null
            ? null
            : DateTime.parse(json["date_appearance"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name_disease": nameDisease == null ? null : nameDisease,
        "status": status == null ? null : status,
        "description": description == null ? null : description,
        "number_affected": numberAffected == null ? null : numberAffected,
        "number_healed": numberHealed == null ? null : numberHealed,
        "date_appearance":
            dateAppearance == null ? null : dateAppearance!.toIso8601String(),
      };
}
