import 'package:flutter/material.dart';

class Periodos extends StatefulWidget {
  @override
  _PeriodosState createState() => _PeriodosState();
}

class _PeriodosState extends State<Periodos> {
  String? periodo;
  String? semanas;
  String? anio;
  String? aula;
  String? sistema;

  final periodos = ['ENERO-JUNIO', 'AGOSTO-DICIEMBRE', 'VERANO'];
  final semanasList = ['16 SEMANAS', '4 SEMANAS', '6 SEMANAS'];
  final anios = [for (var i = DateTime.now().year; i <= 2030; i++) '$i'];
  final aulas = ['LC1', 'LC2', 'LC3', 'LC4', 'LC5', 'LC6', 'LC7'];
  final sistemas = ['WINDOWS', 'LINUX'];

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
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/T.png', width: 200),
                Image.asset('assets/images/ITZ.png', width: 100),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
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
                  const SizedBox(height: 10),
                  const Text(
                    'Abrir Periodos',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF34495E),
                    ),
                  ),
                  const SizedBox(height: 25),
                  buildDropdown('Periodo', periodos, periodo, (value) {
                    setState(() => periodo = value);
                  }),
                  const SizedBox(height: 15),
                  buildDropdown('Semanas', semanasList, semanas, (value) {
                    setState(() => semanas = value);
                  }),
                  const SizedBox(height: 15),
                  buildDropdown('Año', anios, anio, (value) {
                    setState(() => anio = value);
                  }),
                  const SizedBox(height: 15),
                  buildDropdown('Aulas', aulas, aula, (value) {
                    setState(() => aula = value);
                  }),
                  const SizedBox(height: 15),
                  buildDropdown('Sistemas Operativos', sistemas, sistema,
                      (value) {
                    setState(() => sistema = value);
                  }),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _actionButton('Iniciar Periodo', () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Periodo Iniciado')),
                        );
                        Navigator.pop(context);
                      }),
                      _actionButton('Finalizar Periodo', () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Periodo Finalizado')),
                        );
                        Navigator.pop(context);
                      }),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
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

  Widget buildDropdown(String label, List<String> items, String? selected,
      void Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 5),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Color(0xFFEAEAEA),
              borderRadius: BorderRadius.circular(30),
            ),
            child: DropdownButton<String>(
              isExpanded: true,
              value: selected,
              hint: Text('Seleccione $label'),
              underline: SizedBox(),
              items: items
                  .map((item) =>
                      DropdownMenuItem(value: item, child: Text(item)))
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Color(0xFFEAEAEA),
        foregroundColor: Color(0xFF2C3E50),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
    );
  }
}
