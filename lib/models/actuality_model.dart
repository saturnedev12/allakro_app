class ActualityModel {
  ActualityModel({
    this.id = 0,
    this.datePublication,
    this.title = '',
    this.textPage = '',
    this.namePublisher = '',
    this.views = 0,
    this.typeActuality = '',
    this.idActuality = 0,
    this.nbVews = 0,
  });

  int id;
  DateTime? datePublication;
  String title;
  String textPage;
  String namePublisher;
  int views;
  String typeActuality;
  int idActuality;
  int nbVews;

  factory ActualityModel.fromJson(Map<String, dynamic> json) => ActualityModel(
        id: json["id"] ?? 0,
        datePublication: json["date_publication"] == null
            ? null
            : DateTime.parse(json["date_publication"]),
        title: json["title"] ?? '',
        textPage: json["text_page"] ?? '',
        namePublisher: json["name_publisher"] ?? '',
        views: json["views"] ?? 0,
        typeActuality: json["type_actuality"] ?? '',
        idActuality: json["id_actuality"] ?? 0,
        nbVews: json["nb_vews"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "date_publication":
            datePublication == null ? null : datePublication!.toIso8601String(),
        "title": title == null ? null : title,
        "text_page": textPage == null ? null : textPage,
        "name_publisher": namePublisher == null ? null : namePublisher,
        "views": views == null ? null : views,
        "type_actuality": typeActuality == null ? null : typeActuality,
        "id_actuality": idActuality == null ? null : idActuality,
        "nb_vews": nbVews == null ? null : nbVews,
      };
}
