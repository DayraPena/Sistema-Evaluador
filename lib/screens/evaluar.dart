import 'package:flutter/material.dart';
import 'docente_menu.dart';

class Evaluar extends StatefulWidget {
  @override
  _EvaluarState createState() => _EvaluarState();
}

class _EvaluarState extends State<Evaluar> {
  final Map<String, int> ratings = {
    'Computadoras......': 0,
    'Software de la práctica......': 0,
    'Red o Internet......': 0,
    'Iluminación......': 0,
    'Aire acondicionado......': 0,
    'Limpieza en área......': 0,
    'Limpieza de equipos ......': 0,
    'Atención del personal......': 0,
  };

  int satisfactionRating = 0;
  final TextEditingController fallasController = TextEditingController();
  final TextEditingController observacionesController = TextEditingController();

  Widget buildRatingRow(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(fontSize: 18),
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

  Widget buildSatisfactionStars() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        int starIndex = index + 1;
        return IconButton(
          icon: Icon(
            Icons.star,
            color: satisfactionRating >= starIndex ? Colors.amber : Colors.grey,
          ),
          onPressed: () {
            setState(() {
              satisfactionRating = starIndex;
            });
          },
        );
      }),
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
          Container(height: 20, color: Color(0xFF34495E)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Image.asset('assets/images/T.png', width: 200),
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
                      Text('Evaluar',
                          style: TextStyle(
                              fontSize: 16,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'Evalúa a detalle',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 16),
                  ...ratings.keys
                      .map((label) => buildRatingRow(label))
                      .toList(),
                  SizedBox(height: 32),
                  const Text(
                    'Fallas detectadas:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: fallasController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                  SizedBox(height: 24),
                  const Center(
                    child: Text(
                      'En función de lo anterior.\nEvalúa la satisfacción global del servicio del L.C',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Tacha la opción que refleje tu sentir:\ndel 5=totalmente de acuerdo. al 1=totalmente en desacuerdo.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  SizedBox(height: 12),
                  buildSatisfactionStars(),
                  SizedBox(height: 24),
                  const Text(
                    'Observaciones y sugerencias:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: observacionesController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                  SizedBox(height: 32),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Color.fromARGB(255, 3, 39, 75), // Azul oscuro
                        foregroundColor: Colors.white, // Texto blanco
                        padding:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                        textStyle: TextStyle(fontSize: 16),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => DocenteMenu()),
                          (Route<dynamic> route) => false,
                        );
                      },
                      child: Text('Aceptar'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(height: 20, color: Color(0xFF34495E)),
        ],
      ),
    );
  }
}
