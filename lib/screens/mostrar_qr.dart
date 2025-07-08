import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:math';
import 'docente_menu.dart';

class MostrarQR extends StatelessWidget {
  final String tema;
  final String practica;
  final String nombre;
  final String grupo;

  MostrarQR({
    required this.tema,
    required this.practica,
    required this.nombre,
    required this.grupo,
  });

  String generarClaveAleatoria() {
    const chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    Random rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        8, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  }

  @override
  Widget build(BuildContext context) {
    String clave = generarClaveAleatoria();
    String datosQR =
        "Grupo: $grupo | Tema: $tema | Práctica: $practica | Nombre: $nombre | Clave: $clave";

    return Scaffold(
      body: Column(
        children: [
          Container(
              height: 20, color: Color(0xFF34495E)), // barra azul superior

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/T.png', width: 200),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10), // más a la izquierda
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(height: 20),
                        Text(
                          'TECNOLÓGICO NACIONAL DE MÉXICO',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          'INSTITUTO TECNOLÓGICO DE ZACATEPEC',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'DOCENTE',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF34495E),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Image.asset('assets/images/ITZ.png', width: 100),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 30),
                  QrImageView(
                    data: datosQR,
                    size: 220.0,
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Información del Código QR',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 12),
                  Text('Clave: $clave'),
                  Text('Docente: $nombre'),
                  Text('Materia: $tema'),
                  Text('Práctica: $practica'),
                  SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF34495E),
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => DocenteMenu()),
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: Text('Cerrar'),
                  ),
                ],
              ),
            ),
          ),

          Container(
              height: 20, color: Color(0xFF34495E)), // barra azul inferior
        ],
      ),
    );
  }
}
