import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfc/Pages/identification.dart';

import '../Controller/UserController.dart';
import '../Models/UserModel.dart';
import '../utils/espace.dart';

class ListeUtilisateurs extends StatefulWidget {
  const ListeUtilisateurs({Key? key}) : super(key: key);

  @override
  State<ListeUtilisateurs> createState() => _ListeUtilisateursState();
}

class _ListeUtilisateursState extends State<ListeUtilisateurs> {

  List<UserModel>? user;
  var isLoad = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(2, 62, 138, 1),
        title: Text("Nombre de recensées (${user?.length})"),
      ),
      body: Column(
        children: [
          Espace(hauteur: 30),
          Expanded(child: listeUsersView(context))
        ],
      ),
    );
  }

  listeUsersView(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: user?.length,
        itemBuilder: (context, index) {
          var couleur = index % 2 == 0
              ? Colors.transparent
              : Colors.grey.withOpacity(0.3);
          var users = user?[index];

          return Container(
            color: couleur,
            child: ListTile(
              leading: const Icon(
                Icons.account_circle,
                size: 30,
              ),
              title: Text(
                '${users?.nom}',
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
              subtitle: Text(
                'Genre: ${users?.sexe}',
                style: const TextStyle(fontSize: 15),
              ),
            ),
          );

          return Text(
            '${users?.nom}',
            style: TextStyle(fontSize: 30, color: couleur),
          );
        });
  }


  getData() async
  {
    user = await UserController.getUsers();
    if(user!=null)
    {
      setState(() {
        isLoad=true;
      });
    }

  }
}

