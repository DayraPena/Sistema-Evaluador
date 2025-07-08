import 'package:flutter/material.dart';
import 'mostrar_qr.dart';

class FormularioQR extends StatefulWidget {
  final String grupo;
  FormularioQR({required this.grupo});

  @override
  _FormularioQRState createState() => _FormularioQRState();
}

class _FormularioQRState extends State<FormularioQR> {
  final temaController = TextEditingController();
  final practicaController = TextEditingController();
  final nombreController = TextEditingController();

  void _generarQR() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MostrarQR(
          tema: temaController.text,
          practica: practicaController.text,
          nombre: nombreController.text,
          grupo: widget.grupo,
        ),
      ),
    );
  }

  Widget _campo(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(label, style: TextStyle(fontSize: 16)),
          ),
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xFFEAEAD5),
                borderRadius: BorderRadius.circular(4),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12),
              alignment: Alignment.centerLeft,
              child: TextField(
                controller: controller,
                decoration: InputDecoration.collapsed(hintText: ''),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              height: 20, color: Color(0xFF34495E)), // barra azul superior
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _campo('Tema:', temaController),
                  _campo('Nº Practica:', practicaController),
                  _campo('Nombre:', nombreController),
                  SizedBox(height: 30),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 140, 176, 230),
                        padding:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                      ),
                      onPressed: _generarQR,
                      child: Text('Generar QR'),
                    ),
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
