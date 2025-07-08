import 'package:flutter/material.dart';

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
      const SnackBar(content: Text('Datos de infraestructura registrados')),
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
                'Infraestructura',
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Columna izquierda
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCheck('Windows', windows, (val) {
                      setState(() => windows = val);
                    }),
                    _buildCheck('Linux', linux, (val) {
                      setState(() => linux = val);
                    }),
                  ],
                ),
                const SizedBox(width: 50),
                // Columna derecha
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCheck('Java', java, (val) {
                      setState(() => java = val);
                    }),
                    _buildCheck('Autocat', autocat, (val) {
                      setState(() => autocat = val);
                    }),
                  ],
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: _onAceptar,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4C7ED6),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Aceptar',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 30),
          Container(height: 20, color: const Color(0xFF34495E)),
        ],
      ),
    );
  }

  Widget _buildCheck(String label, bool value, Function(bool) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Checkbox(
            value: value,
            onChanged: (val) => onChanged(val ?? false),
          ),
          Text(label,
              style: const TextStyle(fontSize: 15, color: Color(0xFF2C3E50))),
        ],
      ),
    );
  }
}
