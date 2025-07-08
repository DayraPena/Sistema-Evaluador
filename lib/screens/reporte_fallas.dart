import 'package:flutter/material.dart';
import 'reporte_docentes.dart';
import 'reporte_alumno.dart';

class ReporteFallas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          Container(height: 20, color: const Color(0xFF34495E)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Flecha para regresar
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Color(0xFF34495E)),
                  onPressed: () => Navigator.pop(context),
                ),
                const Spacer(),
              ],
            ),
          ),
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
            children: const [
              Text(
                'TECNOLÓGICO\nNACIONAL DE MÉXICO',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C3E50),
                  height: 1.3,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'INSTITUTO TECNOLÓGICO DE ZACATEPEC',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF2C3E50),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Reportes',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF34495E),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                _menuButton(context, 'Docentes', ReporteDocentes()),
                const SizedBox(height: 20),
                _menuButton(context, 'Alumnos', ReporteAlumnos()),
              ],
            ),
          ),
          const Spacer(),
          Container(height: 20, color: const Color(0xFF34495E)),
        ],
      ),
    );
  }

  Widget _menuButton(BuildContext context, String text, Widget page) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => page));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFEAEAEA),
        foregroundColor: const Color(0xFF2C3E50),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 0,
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
      ),
    );
  }
}
