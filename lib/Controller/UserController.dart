import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Models/UserModel.dart';
import '../utils/Parametres.dart';
import '../utils/utilitaires.dart';

class UserController with ChangeNotifier{
  GetStorage stockage = GetStorage();
  List<UserModel> listUsers = [UserModel(
      nom: "nom",
      prenom: "prenom",
      postnom: "postnom",
      lieuDeNaissance: "lieuDeNaissance",
      sexe: "sexe",
      nomMere: "nomMere",
      nomPere: "nomPere",
      etatCivil: "etatCivil",
      pays: "pays",
      nationalite: "nationalite",
      province: "province",
      commune: "commune",
      quartier: "quartier",
      avenue: "avenue")];

  UserController() {
    recupererDansStockageLocale();
  }
  recupererDansStockageLocale() {
    //lecture base de données
    var tempList = stockage.read("LISTE_USERS") as List<dynamic>?;

    if (tempList != null) {
      listUsers = tempList.map((e) => UserModel.fromJson(e)).toList();
    }
    notifyListeners();
  }

  Future<dynamic> submitData(dynamic data) async{
    var res = json.encode(data);
    var header = {
      "Content-Type":"application/json"
    };
    var url = Uri.http('192.168.43.95:8000', Parametres.endPointUser);
    var response = await http.post(
        url,
        body: res,
        headers: header
    );
    print(url);
    print(response.statusCode);
    print(response.reasonPhrase);
    print(response.body);
    if(response.statusCode == 200 || response.statusCode == 201){
      return response.body;
    }
    return response.statusCode;
  }

  static getUsers() async
  {
    var url=Uri(scheme: "http",host: Parametres.host ,path:Parametres.endPointUser ,port: 8000);
    print(url);
    var reponse=await http.get(url);
    if(reponse.statusCode ==200)
    {
      var json = reponse.body;
      return  userModelFromJson(json);
    }

  }
/*    static getUsers() async {
      var url=Uri.http('0.0.0.0:8000', Parametres.endPointUser);
      print(url);
      var reponse=await http.get(url);
      if(reponse.statusCode == 200)
      {
        var json = reponse.body;
        return  userModelFromJson(json);
      }
  }*/
}