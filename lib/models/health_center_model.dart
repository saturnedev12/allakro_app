class HealthCenterModel {
  HealthCenterModel({
    this.id = 0,
    this.name = '',
    this.description = '',
    this.status = '',
    this.garde = '',
    this.longitude = '',
    this.latitude = '',
  });

  int id;
  String name;
  String description;
  String status;
  String garde;
  String longitude;
  String latitude;

  factory HealthCenterModel.fromJson(Map<String, dynamic> json) =>
      HealthCenterModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        description: json["description"] ?? '',
        status: json["status"] ?? '',
        garde: json["garde"] ?? '',
        longitude: json["longitude"] ?? '',
        latitude: json["latitude"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "description": description == null ? null : description,
        "status": status == null ? null : status,
        "garde": garde == null ? null : garde,
        "longitude": longitude == null ? null : longitude,
        "latitude": latitude == null ? null : latitude,
      };
}
