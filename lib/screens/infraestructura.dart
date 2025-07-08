import 'package:flutter/material.dart';
import 'docente_menu.dart'; // importa tu pantalla principal

class Infraestructura extends StatefulWidget {
  @override
  _InfraestructuraState createState() => _InfraestructuraState();
}

class _InfraestructuraState extends State<Infraestructura> {
  bool windows = false;
  bool linux = false;
  bool java = false;
  bool autocat = false;

  void _onAceptar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Datos de infraestructura registrados')),
    );

    Future.delayed(Duration(milliseconds: 300), () {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => DocenteMenu()),
        (Route<dynamic> route) => false,
      );
    });
  }

  Widget _buildCheckbox(String label, bool value, Function(bool?) onChanged) {
    return CheckboxListTile(
      value: value,
      onChanged: onChanged,
      title: Text(label),
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.symmetric(horizontal: 8),
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            _buildCheckbox('Windows', windows, (val) {
                              setState(() {
                                windows = val ?? false;
                              });
                            }),
                            _buildCheckbox('Linux', linux, (val) {
                              setState(() {
                                linux = val ?? false;
                              });
                            }),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            _buildCheckbox('Java', java, (val) {
                              setState(() {
                                java = val ?? false;
                              });
                            }),
                            _buildCheckbox('Autocat', autocat, (val) {
                              setState(() {
                                autocat = val ?? false;
                              });
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 60),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0B2A5A),
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
