import 'package:flutter/material.dart';
import 'auxiliar_horario.dart';

class Auxiliares extends StatefulWidget {
  @override
  AuxiliaresState createState() => AuxiliaresState();
}

class AuxiliaresState extends State<Auxiliares> {
  final List<String> nombres = [
    'FERNANDO XXXX XXXX',
    'GUSTAVO XXXX XXXX',
    'MIGUEL XXXX XXXX',
    'JESUS XXXX XXXX',
    'PEDRO XXXX XXXX'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Column(
        children: [
          Container(height: 20, color: Color(0xFF34495E)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/T.png', width: 200),
                Image.asset('assets/images/ITZ.png', width: 100),
              ],
            ),
          ),
          Column(
            children: [
              const Text(
                'TECNOLÓGICO\nNACIONAL DE MÉXICO',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C3E50),
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'INSTITUTO TECNOLÓGICO DE ZACATEPEC',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF2C3E50),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Auxiliares',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF34495E),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: nombres.map((nombre) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AuxiliarHorario(nombre: nombre),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Color(0xFF4C7ED6), // azul como figma
                        foregroundColor: Colors.white,
                        minimumSize: Size(260, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        nombre,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Container(height: 20, color: Color(0xFF34495E)),
        ],
      ),
    );
  }
}
