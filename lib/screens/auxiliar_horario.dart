import 'package:flutter/material.dart';
import 'admin_menu.dart'; // importa tu menú del admin

class AuxiliarHorario extends StatefulWidget {
  final String nombre;
  const AuxiliarHorario({super.key, required this.nombre});

  @override
  State<AuxiliarHorario> createState() => _AuxiliarHorarioState();
}

class _AuxiliarHorarioState extends State<AuxiliarHorario> {
  final List<String> horariosDisponibles = [
    'LUNES 6:00 AM A 2:00 PM',
    'MARTES Y JUEVES 2:00 PM A 8:00 PM',
  ];

  String? horarioSeleccionado;
  String? horarioAsignado;

  void _darDeAlta() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Auxiliar dado de alta')),
    );

    Future.delayed(Duration(milliseconds: 300), () {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => AdminMenu()),
        (Route<dynamic> route) => false,
      );
    });
  }

  void _asignarHorarioDesdeBoton() {
    if (horarioSeleccionado != null) {
      setState(() {
        horarioAsignado = horarioSeleccionado;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Horario asignado a ${widget.nombre}')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecciona un horario primero')),
      );
    }
  }

  void _eliminarHorario() {
    setState(() {
      horarioAsignado = null;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Horario eliminado de ${widget.nombre}')),
    );
  }

  void _darDeBaja() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Auxiliar dado de baja')),
    );
  }

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
                'ASIGNAR HORARIOS',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF34495E),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Botones verticales
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _sideButton('DAR DE ALTA', _darDeAlta),
                      _sideButton('HORARIO', _asignarHorarioDesdeBoton),
                      _sideButton('DAR DE BAJA', _darDeBaja),
                    ],
                  ),
                  const SizedBox(width: 50),
                  // Horario asignado + dropdown y botones abajo
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 16),
                          decoration: BoxDecoration(
                            color: const Color(0xFFBFD8FF),
                            borderRadius: BorderRadius.circular(30),
                            border:
                                Border.all(color: Colors.blueAccent, width: 1),
                          ),
                          child: Text(
                            horarioAsignado ?? 'SIN HORARIO',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2C3E50),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFEAEAEA),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 14),
                            hintText: 'Seleccione un horario',
                          ),
                          value: horarioSeleccionado,
                          items: horariosDisponibles.map((horario) {
                            return DropdownMenuItem(
                              value: horario,
                              child: Text(horario),
                            );
                          }).toList(),
                          onChanged: (valor) {
                            setState(() {
                              horarioSeleccionado = valor;
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _smallButton(
                                'Asignar Horario', _asignarHorarioDesdeBoton),
                            const SizedBox(width: 20),
                            _smallButton('Eliminar Horario', _eliminarHorario),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(height: 20, color: const Color(0xFF34495E)),
        ],
      ),
    );
  }

  Widget _sideButton(String text, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4C7ED6),
          foregroundColor: Colors.white,
          minimumSize: const Size(140, 36),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0,
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _smallButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF4C7ED6),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 0,
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
    );
  }
}
