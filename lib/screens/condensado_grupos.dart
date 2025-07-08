import 'package:flutter/material.dart';
import 'formulario_qr.dart';

class CondensadoGrupos extends StatelessWidget {
  final List<String> grupos = [
    "GRUPO XA",
    "GRUPO XB",
    "GRUPO XC",
    "GRUPO XD",
    "GRUPO XE"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              height: 20, color: Color(0xFF34495E)), // barra superior azul
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/T.png', width: 200),
                Column(
                  children: const [
                    Text(
                      'TECNOLÓGICO\nNACIONAL DE MÉXICO',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'INSTITUTO TECNOLÓGICO DE ZACATEPEC',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'DOCENTE',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF34495E)),
                    ),
                  ],
                ),
                Image.asset('assets/images/ITZ.png', width: 100),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: ListView.builder(
                itemCount: grupos.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Color(0xFFEAEAD5), // fondo tipo beige
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(grupos[index]),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF0B2A5A), // azul fuerte
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    FormularioQR(grupo: grupos[index]),
                              ),
                            );
                          },
                          child: Text('Abrir'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
              height: 20, color: Color(0xFF34495E)), // barra inferior azul
        ],
      ),
    );
  }
}
