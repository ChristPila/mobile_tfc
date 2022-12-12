import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:tfc/Pages/identification.dart';
import 'package:tfc/Pages/listUsers.dart';

class BottomNavigationBarPage extends StatefulWidget {
  String title;

  BottomNavigationBarPage({required this.title});

  @override
  State<BottomNavigationBarPage> createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  List<String> utilisateurs = [Faker().person.name()];
  int selectedIndex = 0;
  List choixPagesMap = [Identification(), ListeUtilisateurs()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recesement App"),
        elevation: 0,
        backgroundColor: Colors.blueAccent,
      ),
      bottomNavigationBar: bottomNavigation(),
      body: choixPagesMap[selectedIndex],
    );
  }

  bottomNavigation() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: this.selectedIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.edit_location_outlined),
          label: "Identification",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.supervised_user_circle),
          label: "Personnes Identifiées",
        )
      ],
      onTap: (int index) {
        selectedIndex = index;
        setState(() {});
      },
      backgroundColor: Colors.blue,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black87,
    );
  }


}
