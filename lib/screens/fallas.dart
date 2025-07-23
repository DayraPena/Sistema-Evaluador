import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'docente_menu.dart'; // importa tu pantalla de menú principal

class Fallas extends StatefulWidget {
  @override
  _FallasState createState() => _FallasState();
}

class _FallasState extends State<Fallas> {
  final TextEditingController folioController = TextEditingController();
  final TextEditingController fallaController = TextEditingController();
  final TextEditingController docenteController = TextEditingController();
  final TextEditingController nombreController = TextEditingController();
  DateTime? fechaSeleccionada;

  Future<void> _seleccionarFecha(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: fechaSeleccionada ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != fechaSeleccionada) {
      setState(() {
        fechaSeleccionada = picked;
      });
    }
  }

  void _onAceptar() {
    print('Folio: ${folioController.text}');
    print('Falla: ${fallaController.text}');
    print(
        'Fecha: ${fechaSeleccionada != null ? DateFormat('dd/MM/yyyy').format(fechaSeleccionada!) : 'No seleccionada'}');
    print('Docente: ${docenteController.text}');
    print('Nombre: ${nombreController.text}');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Falla registrada')),
    );

    // después de un pequeño delay para mostrar el mensaje
    Future.delayed(Duration(milliseconds: 300), () {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => DocenteMenu()),
        (Route<dynamic> route) => false,
      );
    });
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
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: folioController,
                    decoration: InputDecoration(labelText: 'Folio'),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: fallaController,
                    decoration: InputDecoration(labelText: 'Ejemplo de falla'),
                    maxLines: 3,
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Text('Fecha: ', style: TextStyle(fontSize: 16)),
                      TextButton(
                        onPressed: () => _seleccionarFecha(context),
                        child: Text(
                          fechaSeleccionada == null
                              ? 'Seleccionar fecha'
                              : DateFormat('dd/MM/yyyy')
                                  .format(fechaSeleccionada!),
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: docenteController,
                    decoration: InputDecoration(labelText: 'Docente'),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: nombreController,
                    decoration: InputDecoration(labelText: 'Nombre'),
                  ),
                  SizedBox(height: 40),
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
          Container(height: 20, color: Color(0xFF34495E)), // barra inferior
        ],
      ),
    );
  }
}
