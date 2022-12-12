import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/espace.dart';
import '../Controller/UserController.dart';
import '../Models/UserModel.dart';

class Identification extends StatefulWidget {
  const Identification({Key? key}) : super(key: key);

  @override
  State<Identification> createState() => _IdentificationState();
}

class _IdentificationState extends State<Identification> {
  UserModel? _userModel;
  TextEditingController nom = TextEditingController();
  TextEditingController postnom = TextEditingController();
  TextEditingController prenom = TextEditingController();
  TextEditingController lieu_naiss = TextEditingController();
  TextEditingController nom_pere = TextEditingController();
  TextEditingController nom_mere = TextEditingController();
  TextEditingController commune = TextEditingController();
  TextEditingController pays = TextEditingController();
  TextEditingController province = TextEditingController();
  TextEditingController nationalite = TextEditingController();
  TextEditingController quartier = TextEditingController();
  TextEditingController avenue = TextEditingController();

  String? provinceSelect;
  List<String> sexe = ["Masculin", "Féminin"];
  List<String> etat_civil = ["Marié", "Célibataire"];
  String? _selectedState;
  String? _selectedSexe;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.withOpacity(0.05),
        body: SingleChildScrollView(
          child: Column(
            children: [
              /*Espace(hauteur: 50),
              enTete(),*/
              Espace(hauteur: 40,),
              paysChampSaisie(),
              Espace(hauteur: 25,),
              provinceChampSaisie(),
              Espace(hauteur: 25,),
              nationaliteChampSaisie(),
              Espace(hauteur: 25),
              nomChampSaisie(),
              Espace(hauteur: 25),
              postnomChampSaisie(),
              Espace(hauteur: 25),
              prenomChampSaisie(),
              Espace(hauteur: 25),
              sexeVue(),
              Espace(hauteur: 25),
              lieuNaissanceChampSaisie(),
              Espace(hauteur: 25),
              stateVue(),
              Espace(hauteur: 25,),
              nomPereChampSaisie(),
              Espace(hauteur: 25),
              nomMereChampSaisie(),
              Espace(hauteur: 25,),
              communeChampSaisie(),
              Espace(hauteur: 25,),
              quartierChampSaisie(),
              Espace(hauteur: 25,),
              avenueChampSaisie(),
              Espace(hauteur: 30,),
              buttonValider()
            ],
          ),
        ),
      ),
    );
  }
  Widget paysChampSaisie() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        style: TextStyle(
            color: Colors.blue
        ),
        controller: pays,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 3, color: Colors.blue
              )
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 3, color: Colors.blue
              )
          ),
          labelStyle: TextStyle(
              color: Colors.blue
          ),
          labelText: "Pays",
          filled: false,
        ),
      ),
    );
  }
  Widget provinceChampSaisie() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        style: TextStyle(
            color: Colors.blue
        ),
        controller: province,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 3, color: Colors.blue
              )
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 3, color: Colors.blue
              )
          ),
          labelStyle: TextStyle(
              color: Colors.blue
          ),
          labelText: "Province",
          filled: false,
        ),
      ),
    );
  }
  Widget nationaliteChampSaisie() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        style: TextStyle(
            color: Colors.blue
        ),
        controller: nationalite,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 3, color: Colors.blue
              )
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 3, color: Colors.blue
              )
          ),
          labelStyle: TextStyle(
              color: Colors.blue
          ),
          labelText: "Nationalité",
          filled: false,
        ),
      ),
    );
  }
  Widget nomChampSaisie() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        style: const TextStyle(
            color: Colors.blue
        ),
        controller: nom,
        decoration: const InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 3, color: Colors.blue
              )
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 3, color: Colors.blue
              )
          ),
          labelStyle: TextStyle(
              color: Colors.blue
          ),
          labelText: "Nom",
          filled: false,
        ),
      ),
    );
  }
  Widget postnomChampSaisie() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        style: TextStyle(
            color: Colors.blue
        ),
        controller: postnom,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 3, color: Colors.blue
              )
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 3, color: Colors.blue
              )
          ),
          labelStyle: TextStyle(
              color: Colors.blue
          ),
          labelText: "Post-Nom",
          filled: false,
        ),
      ),
    );
  }
  Widget prenomChampSaisie() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        style: TextStyle(
            color: Colors.blue
        ),
        controller: prenom,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 3, color: Colors.blue
              )
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 3, color: Colors.blue
              )
          ),
          labelStyle: TextStyle(
              color: Colors.blue
          ),
          labelText: "Prénom",
          filled: false,
        ),
      ),
    );
  }
  Widget sexeVue() {
    return Container(
      child: SizedBox(
        width: 314,
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: "Sexe",
            labelStyle: TextStyle(
              color: Colors.blue
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.blue),
                borderRadius: BorderRadius.circular(5)
            ),
          ),
          value: _selectedSexe,
          style: TextStyle(
            color: Colors.blue
          ),
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          items: sexe.map((e) => DropdownMenuItem<String>(
            child: Text(e),
            value: e,
          )
          ).toList(),
          onChanged: (e) => setState(() => _selectedSexe = e),
        ),
      )
    );
  }
  Widget lieuNaissanceChampSaisie() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        style: TextStyle(
            color: Colors.blue
        ),
        controller: lieu_naiss,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 3, color: Colors.blue
              )
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 3, color: Colors.blue
              )
          ),
          labelStyle: TextStyle(
              color: Colors.blue
          ),
          labelText: "Lieu de naissance",
          filled: false,
        ),
      ),
    );
  }
  Widget stateVue() {
    return Container(
        child: SizedBox(
          width: 314,
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: "État civil",
              labelStyle: TextStyle(
                  color: Colors.blue
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.blue),
                  borderRadius: BorderRadius.circular(5)
              ),
            ),
            value: _selectedState,
            style: TextStyle(
                color: Colors.blue
            ),
            icon: const Icon(Icons.keyboard_arrow_down_rounded),
            items: etat_civil.map((e) => DropdownMenuItem<String>(
              child: Text(e),
              value: e,
            )
            ).toList(),
            onChanged: (e) => setState(() => _selectedState = e),
          ),
        )
    );
  }
  Widget nomPereChampSaisie() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        style: TextStyle(
            color: Colors.blue
        ),
        controller: nom_pere,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 3, color: Colors.blue
              )
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 3, color: Colors.blue
              )
          ),
          labelStyle: TextStyle(
              color: Colors.blue
          ),
          labelText: "Nom du père",
          filled: false,
        ),
      ),
    );
  }
  Widget nomMereChampSaisie() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        style: TextStyle(
            color: Colors.blue
        ),
        controller: nom_mere,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 3, color: Colors.blue
              )
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 3, color: Colors.blue
              )
          ),
          labelStyle: TextStyle(
              color: Colors.blue
          ),
          labelText: "Nom de la mère",
          filled: false,
        ),
      ),
    );
  }
  Widget communeChampSaisie() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        style: TextStyle(
            color: Colors.blue
        ),
        controller: commune,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 3, color: Colors.blue
              )
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 3, color: Colors.blue
              )
          ),
          labelStyle: TextStyle(
              color: Colors.blue
          ),
          labelText: "Commune",
          filled: false,
        ),
      ),
    );
  }
  Widget quartierChampSaisie() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        style: const TextStyle(
            color: Colors.blue
        ),
        controller: quartier,
        decoration: const InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 3, color: Colors.blue
              )
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 3, color: Colors.blue
              )
          ),
          labelStyle: TextStyle(
              color: Colors.blue
          ),
          labelText: "Quartier",
          filled: false,
        ),
      ),
    );
  }
  Widget avenueChampSaisie() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        style: const TextStyle(
            color: Colors.blue
        ),
        controller: avenue,
        decoration: const InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 3, color: Colors.blue
              )
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 3, color: Colors.blue
              )
          ),
          labelStyle: TextStyle(
              color: Colors.blue
          ),
          labelText: "Avenue",
          filled: false,
        ),
      ),
    );
  }
  Widget buttonValider(){
    return ElevatedButton(
        onPressed: () async {
          Chargement(context);
          var data = UserModel(
              nom: nom.text.toString(),
              prenom: prenom.text.toString(),
              postnom: postnom.text.toString(),
              lieuDeNaissance: lieu_naiss.text.toString(),
              sexe: _selectedSexe.toString(),
              nomMere: nom_mere.text.toString(),
              nomPere: nom_pere.text.toString(),
              etatCivil: _selectedState.toString(),
              pays: pays.text.toString(),
              nationalite: nationalite.text.toString(),
              province: province.text.toString(),
              commune: commune.text.toString(),
              quartier: quartier.text.toString(),
              avenue: avenue.text.toString()
          );
          print(data.nom);
          print(data.sexe);
          var response= await context.read<UserController>().submitData(data);
          if(response == "Data have been sent succesfuly"){
            Navigator.pop(context);
            succesPopUp(context);
          }

        },
        child: const Text(
          "Envoyer",
          style: TextStyle(fontSize: 20),
        )
    );
  }


  Chargement(BuildContext context, [int duree = 1500]) async {
    ouvrirDialog(context);
  }
  ouvrirDialog(context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text("Envoi en cours..."),
        );
      },
    );
  }
  succesPopUp(BuildContext context){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Center(child: Text("ENVOI DES DONNES")),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_box,
                  color: Colors.green,
                  size: 50,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Données envoyées",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green
                  ),
                )
              ],
            ),
            actions: <Widget>[
              new TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: new Text("OK")
              )
            ],
          );
        }
    );
  }
}
