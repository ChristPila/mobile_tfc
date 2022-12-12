import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfc/Pages/Layouts/NavigationBar.dart';
import 'package:tfc/Pages/identification.dart';
import '../Controller/AgentController.dart';
import '../utils/espace.dart';

class Authentification extends StatefulWidget {
  @override
  State<Authentification> createState() => _AuthentificationState();
}

class _AuthentificationState extends State<Authentification> {
  TextEditingController login = TextEditingController();

  TextEditingController pwd = TextEditingController();

  String errorMessage = "";
  String buttonConnexionText = "Connexion";


  @override
  // affichage
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Color.fromRGBO(203, 243, 240, 1),
        //backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Espace(hauteur: 50),
              enTete(),
              Espace(hauteur: 40),
              iconApplication(),
              Espace(hauteur: 30),
              loginChampSaisie(),
              Espace(hauteur: 30),
              motDePasseChampSaisie(),
              Text(
                errorMessage,
                style: TextStyle(color: Colors.red),
              ),
              Espace(hauteur: 50),
              buttonValider(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget buttonValider(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          if( buttonConnexionText == "Traitement en cours..."){
            print('Ne plus appuyer....');
            return;
          }
          var resultat =
          context.read<AgentController>().authentifier(login.text, pwd.text);

          buttonConnexionText = "Traitement en cours...";
          setState(() {});
          await Future.delayed(Duration(seconds: 5), () {});

          buttonConnexionText = "Connexion";
          setState(() {});

          if (await resultat) {
            errorMessage = "";
            setState(() {});

            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
              return BottomNavigationBarPage(title: '',);
            }));
          } else {
            errorMessage = "Login/mot de passe incorrect";
            setState(() {});
          }
        },
        style: ElevatedButton.styleFrom(
            primary: Colors.white, shadowColor: Colors.red),
        child: Text(
          buttonConnexionText,
          style: TextStyle(fontSize: 25, color: Colors.blue),
        ));
  }

  Widget tempButtonValider() {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            primary: Colors.blueAccent,
            side: BorderSide(color: Colors.red),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
        child: Text(
          'Connexion',
          style: TextStyle(fontSize: 25),
        ));
  }

  Widget loginChampSaisie() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: login,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Votre nom",
            filled: false,
        ),
      ),
    );
  }

  Widget motDePasseChampSaisie() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: pwd,
        obscureText: true,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Mot de passe",
            filled: false
        ),
      ),
    );
  }

  Widget titreZoneSasie(String titre) {
    return Center(
      child: Text(titre, style: TextStyle(fontSize: 25)),
    );
  }

  Widget enTete() {
    return const Center(
      child: Text(
        'BIENVENUE',
        style: TextStyle(fontSize: 30, color: Colors.blue),
      ),
    );
  }


  /* Widget espace(double hauteur) {
    return SizedBox(
      height: hauteur,
    );
  }*/
  Widget iconApplication() {
    return const Center(
      child: Icon(
        Icons.account_circle,
        color: Colors.blue,
        size: 90,
      ),
    );
  }
}
