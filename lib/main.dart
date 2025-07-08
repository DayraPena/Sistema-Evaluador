import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/docente_menu.dart';
import 'screens/admin_menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistema Evaluación ITZ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/docente': (context) => DocenteMenu(),
        '/admin': (context) => AdminMenu(),
      },
    );
  }
}
