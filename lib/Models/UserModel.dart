// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel({
    this.id,
    required this.nom,
    required this.prenom,
    required this.postnom,
    required this.lieuDeNaissance,
    required this.sexe,
    required this.nomMere,
    required this.nomPere,
    required this.etatCivil,
    required this.pays,
    required this.nationalite,
    required this.province,
    required this.commune,
    required this.quartier,
    required this.avenue,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String nom;
  String prenom;
  String postnom;
  String lieuDeNaissance;
  String sexe;
  String nomMere;
  String nomPere;
  String etatCivil;
  String pays;
  String nationalite;
  String province;
  String commune;
  String quartier;
  String avenue;
  dynamic createdAt;
  dynamic updatedAt;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    nom: json["nom"],
    prenom: json["prenom"],
    postnom: json["postnom"],
    lieuDeNaissance: json["lieu_de_naissance"],
    sexe: json["sexe"],
    nomMere: json["nom_mere"],
    nomPere: json["nom_pere"],
    etatCivil: json["etat_civil"],
    pays: json["pays"],
    nationalite: json["nationalite"],
    province: json["province"],
    commune: json["commune"],
    quartier: json["quartier"],
    avenue: json["avenue"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nom": nom,
    "prenom": prenom,
    "postnom": postnom,
    "lieu_de_naissance": lieuDeNaissance,
    "sexe": sexe,
    "nom_mere": nomMere,
    "nom_pere": nomPere,
    "etat_civil": etatCivil,
    "pays": pays,
    "nationalite": nationalite,
    "province": province,
    "commune": commune,
    "quartier": quartier,
    "avenue": avenue,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
