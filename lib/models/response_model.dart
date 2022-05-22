class ResponseModel {
  ResponseModel({
    this.status = 'KO',
    this.message = '',
  });

  String status;
  String message;

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        status: json["status"] ?? 'KO',
        message: json["message"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
