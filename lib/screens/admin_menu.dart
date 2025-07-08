import 'package:flutter/material.dart';
import 'periodos.dart';
import 'reporte_fallas.dart';
import 'reporte_satisfaccion.dart';
import 'infraestructura copy.dart';
import 'infraestructura copy 2.dart';

class AdminMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Column(
        children: [
          Container(
            height: 20,
            color: Color(0xFF34495E),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/T.png', width: 200),
                Image.asset('assets/images/ITZ.png', width: 100),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start, // se sube
              children: [
                SizedBox(height: 10), // pequeño espacio superior
                const Text(
                  'TECNOLÓGICO\nNACIONAL DE MÉXICO',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
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
                    fontSize: 16,
                    color: Color(0xFF2C3E50),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'ADMINISTRADOR',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF34495E),
                  ),
                ),
                const SizedBox(height: 20),
                _menuButton(context, 'Períodos', Periodos()),
                _menuButton(context, 'Auxiliares', Auxiliares()),
                _menuButton(context, 'Infraestructura', Infraestructura()),
                _menuButton(context, 'Reporte Fallas', ReporteFallas()),
                _menuButton(
                    context, 'Reporte Satisfacción', ReporteSatisfaccion()),
              ],
            ),
          ),
          Container(
            height: 20,
            color: Color(0xFF34495E),
          ),
        ],
      ),
    );
  }

  Widget _menuButton(BuildContext context, String text, Widget page) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Color(0xFFEAEAEA),
          foregroundColor: Color(0xFF2C3E50),
          minimumSize: Size(200, 42),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
