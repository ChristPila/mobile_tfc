import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfc/Controller/AgentController.dart';
import 'package:tfc/Controller/UserController.dart';
import 'package:tfc/Pages/Layouts/NavigationBar.dart';
import 'package:tfc/Pages/authentification.dart';
import 'package:tfc/Pages/identification.dart';
import 'package:tfc/Pages/listUsers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserController()),
        ChangeNotifierProvider(create: (context) => AgentController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  Authentification(),
      ),
    );
  }
}
