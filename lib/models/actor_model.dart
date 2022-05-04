// To parse this JSON data, do
//
//     final ActorModel = ActorModelFromJson(jsonString);

import 'dart:convert';

class ActorModel {
  ActorModel({
    this.id = 0,
    this.createAt = '',
    this.email = '',
    this.civilite = '',
    this.nom = '',
    this.telephone = '',
    this.age = '',
    this.paysNaissance = '',
    this.nationnalite = '',
    this.matrimoniale = '',
    this.lire = '',
    this.niveauEtude = '',
    this.profession = '',
    this.profession2 = '',
    this.enfants = '',
    this.nbEnfant = '',
  });

  int id;
  String createAt;
  String email;
  String civilite;
  String nom;
  String telephone;
  String age;
  String paysNaissance;
  String nationnalite;
  String matrimoniale;
  String lire;
  String niveauEtude;
  String profession;
  String profession2;
  String enfants;
  String nbEnfant;

  factory ActorModel.fromJson(Map<String, dynamic> json) => ActorModel(
        id: json["id"] ?? 0,
        createAt: json["create_at"] ?? '',
        email: json["email"] ?? '',
        civilite: json["civilite"] ?? '',
        nom: json["nom"] ?? '',
        telephone: json["telephone"] ?? '',
        age: json["age"] ?? '',
        paysNaissance: json["pays_naissance"] ?? '',
        nationnalite: json["nationnalite"] ?? '',
        matrimoniale: json["matrimoniale"] ?? '',
        lire: json["lire"] ?? '',
        niveauEtude: json["niveau_etude"] ?? '',
        profession: json["profession"] ?? '',
        profession2: json["profession2"] ?? '',
        enfants: json["enfants"] ?? '',
        nbEnfant: json["nb_enfant"] ?? '',
      );

  /*Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "create_at": createAt == null ? null : createAt,
        "email": email == null ? null : email,
        "civilite": civilite == null ? null : civilite,
        "nom": nom == null ? null : nom,
        "telephone": telephone == null ? null : telephone,
        "age": age == null ? null : age,
        "pays_naissance": paysNaissance == null ? null : paysNaissance,
        "nationnalite": nationnalite == null ? null : nationnalite,
        "matrimoniale": matrimoniale == null ? null : matrimoniale,
        "lire": lire == null ? null : lire,
        "niveau_etude": niveauEtude == null ? null : niveauEtude,
        "profession": profession == null ? null : profession,
        "profession2": profession2 == null ? null : profession2,
        "enfants": enfants == null ? null : enfants,
        "nb_enfant": nbEnfant == null ? null : nbEnfant,
    };*/
}
