import 'package:flutter/material.dart';
import 'docente_menu.dart'; // importa tu pantalla de menú principal

class Evaluar extends StatefulWidget {
  @override
  _EvaluarState createState() => _EvaluarState();
}

class _EvaluarState extends State<Evaluar> {
  final Map<String, int> ratings = {
    'Computadora': 0,
    'Software': 0,
    'Internet': 0,
    'Aire': 0,
    'Limpieza': 0,
    'Atención': 0,
  };

  Widget buildRatingRow(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Row(
            children: List.generate(5, (index) {
              int starIndex = index + 1;
              return IconButton(
                icon: Icon(
                  Icons.star,
                  color:
                      ratings[label]! >= starIndex ? Colors.amber : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    ratings[label] = starIndex;
                  });
                },
              );
            }),
          )
        ],
      ),
    );
  }

  void _onAceptar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Evaluación enviada')),
    );
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => DocenteMenu()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(height: 20, color: Color(0xFF34495E)), // barra superior
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/T.png', width: 150),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text('TECNOLÓGICO\nNACIONAL DE MÉXICO',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18)),
                      Text('INSTITUTO TECNOLÓGICO DE ZACATEPEC',
                          style: TextStyle(fontSize: 14)),
                      SizedBox(height: 4),
                      Text('DOCENTE',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF34495E))),
                    ],
                  ),
                ),
                Image.asset('assets/images/ITZ.png', width: 100),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Column(
                children: [
                  ...ratings.keys
                      .map((label) => buildRatingRow(label))
                      .toList(),
                  SizedBox(height: 40),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF34495E),
                        padding:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                      ),
                      onPressed: _onAceptar,
                      child: Text('Aceptar'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(height: 20, color: Color(0xFF34495E)), // barra inferior
        ],
      ),
    );
  }
}
