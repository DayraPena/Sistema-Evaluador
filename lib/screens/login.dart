import 'package:flutter/material.dart';
import 'docente_menu.dart';
import 'admin_menu.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userController = TextEditingController();
  final passController = TextEditingController();

  void _login() {
    if (userController.text == "docente" && passController.text == "doc123") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DocenteMenu()),
      );
    } else if (userController.text == "admin" &&
        passController.text == "admin123") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AdminMenu()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Usuario o contraseña incorrectos')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          Container(
            color: const Color(0xFF2D3E50),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: const Center(
              child: Text(
                'Tecnológico Nacional de México',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/images/T.png',
                            width: 200), // más grande
                        Image.asset('assets/images/ITZ.png',
                            width: 100), // más grande
                      ],
                    ),
                    const SizedBox(height: 50),
                    const Text(
                      'TECNOLÓGICO NACIONAL DE MÉXICO\nInstituto Tecnológico de Zacatepec',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Center(
                      child: SizedBox(
                        width: 250, // más corto y centrado
                        child: TextField(
                          controller: userController,
                          decoration: const InputDecoration(
                            labelText: 'Usuario',
                            border: UnderlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: SizedBox(
                        width: 250, // más corto y centrado
                        child: TextField(
                          controller: passController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Contraseña',
                            border: UnderlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD7C5EA),
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text('INGRESAR'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: const Color(0xFF2D3E50),
            height: 20,
          )
        ],
      ),
    );
  }
}
