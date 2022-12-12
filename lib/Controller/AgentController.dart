import 'package:flutter/material.dart';

import '../Models/AgentModel.dart';

class AgentController with ChangeNotifier{
  List<AgentModel> agent = [
    AgentModel(name: "admin", password: "password")
  ];

  Future<bool> authentifier(String name, String motDePasse) async {
    var resultat = agent
        .where((e) => e.name == name && e.password == motDePasse)
        .toList();
    await Future.delayed(Duration(milliseconds: 300));
    return resultat.length == 0 ? false : true;
  }
}

