// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.id = 0,
    this.nameDomicile = '',
    this.nameOwner = '',
    this.dateLayout,
    this.dateMove,
    this.description = '',
    this.contactOwner = '',
    this.address = '',
    this.status = '',
  });

  int id;
  String nameDomicile;
  String nameOwner;
  DateTime? dateLayout;
  dynamic dateMove;
  String description;
  String contactOwner;
  String address;
  String status;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        id: json["id"] ?? 0,
        nameDomicile: json["name_domicile"] ?? '',
        nameOwner: json["name_owner"] ?? '',
        dateLayout: json["date_layout"] == null
            ? null
            : DateTime.parse(json["date_layout"]),
        dateMove: json["date_move"],
        description: json["description"] ?? '',
        contactOwner: json["contact_owner"] ?? '',
        address: json["address"] ?? '',
        status: json["status"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name_domicile": nameDomicile == null ? null : nameDomicile,
        "name_owner": nameOwner == null ? null : nameOwner,
        "date_layout": dateLayout == null
            ? null
            : "${dateLayout!.year.toString().padLeft(4, '0')}-${dateLayout!.month.toString().padLeft(2, '0')}-${dateLayout!.day.toString().padLeft(2, '0')}",
        "date_move": dateMove,
        "description": description == null ? null : description,
        "contact_owner": contactOwner == null ? null : contactOwner,
        "address": address == null ? null : address,
        "status": status == null ? null : status,
      };
}
