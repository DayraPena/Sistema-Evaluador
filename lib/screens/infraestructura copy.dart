import 'package:flutter/material.dart';
import 'admin_menu.dart';

class Infraestructura extends StatefulWidget {
  @override
  _InfraestructuraState createState() => _InfraestructuraState();
}

class _InfraestructuraState extends State<Infraestructura> {
  // Equipos disponibles
  Map<String, bool> equipos = {
    'Dell Inspiron 24 3477 AllinOne': false,
    'GHIA Core i7, RAM:4/8, HD:1TB, SSD:': false,
    'Gamer Core i7, RAM 16GB, SSD 512GB': false,
  };

  TextEditingController otroEquipoCtrl = TextEditingController();
  TextEditingController otroSistemaCtrl = TextEditingController();
  TextEditingController otroSoftwareCtrl = TextEditingController();

  // Sistema operativo seleccionado
  String? sistemaSeleccionado = '';

  // Software (30 programas en columnas)
  final List<List<String>> softwareColumnas = [
    [
      'Java c/Netbeans u otro',
      'Tomcat 10.x',
      'Android Studio',
      'Framework de Java o Php',
      'VSCode',
      'Apache2/php/mysql en Linux',
      'Jetbrains IDE Tools'
    ],
    [
      'Teams, Classroom o Zoom',
      'Moodle',
      'Autocad 2025',
      'SolidWorks 2025',
      'Simio 17',
      'Minitab 18',
      'Octave',
    ],
    [
      'SciLab',
      'R Computación estadística',
      'Visual Studio Community 2022',
      'XAMPP',
      'Postgresql 16',
      'Mysql WorkBench',
      'Editor DIA',
    ],
    [
      'Docker de Bigdata',
      'TC o DevCPP o Ensamblador',
      'Xmind/Cmaptools/FreeMind',
      'StarUML',
      'Office 2016',
      'LibreOffice 7',
      'MV de PW / Jakarta',
      'MV de nodeJS, expressJS',
      'MV de Sistemas Operativos',
    ]
  ];

  Map<String, bool> softwareSeleccionado = {};

  @override
  void initState() {
    super.initState();
    for (var columna in softwareColumnas) {
      for (var item in columna) {
        softwareSeleccionado[item] = false;
      }
    }
  }

  Widget buildCheckbox(String label, Map<String, bool> map) {
    return CheckboxListTile(
      dense: true,
      title: Text(label),
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.zero,
      value: map[label],
      onChanged: (val) {
        setState(() {
          map[label] = val ?? false;
        });
      },
    );
  }

  void _onAceptar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Datos de infraestructura registrados')),
    );
    Future.delayed(Duration(milliseconds: 300), () {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => AdminMenu()),
        (Route<dynamic> route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4EDF9),
      body: Column(
        children: [
          Container(height: 10, color: Color(0xFF34495E)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Image.asset('assets/images/T.png', width: 200),
                Expanded(
                  child: Column(
                    children: const [
                      Text(
                        'TECNOLÓGICO NACIONAL DE MÉXICO',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        'INSTITUTO TECNOLÓGICO DE ZACATEPEC',
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Infraestructura',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 3, 32, 56),
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset('assets/images/ITZ.png', width: 100),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Elige el tipo de equipo que está disponible en el área que te asignaron:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13),
            ),
          ),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            children:
                equipos.keys.map((k) => buildCheckbox(k, equipos)).toList(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text('Otro:'),
                SizedBox(width: 10),
                Expanded(child: TextField(controller: otroEquipoCtrl)),
              ],
            ),
          ),
          Divider(),

          // SISTEMA OPERATIVO CON RADIO BUTTONS
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Usaste el Sistema Operativo:'),
                const SizedBox(width: 10),
                ...['Windows', 'Linux'].map((sistema) => Row(
                      children: [
                        Radio<String>(
                          value: sistema,
                          groupValue: sistemaSeleccionado,
                          onChanged: (val) {
                            setState(() {
                              sistemaSeleccionado = val;
                              otroSistemaCtrl.clear(); // Limpia si no es 'Otro'
                            });
                          },
                        ),
                        Text(sistema),
                        const SizedBox(width: 10),
                      ],
                    )),
                Row(
                  children: [
                    Radio<String>(
                      value: 'Otro',
                      groupValue: sistemaSeleccionado,
                      onChanged: (val) {
                        setState(() {
                          sistemaSeleccionado = val;
                        });
                      },
                    ),
                    const Text('Otro:'),
                    const SizedBox(width: 5),
                    SizedBox(
                      width: 120,
                      child: TextField(
                        controller: otroSistemaCtrl,
                        enabled: sistemaSeleccionado == 'Otro',
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(),

          // LISTA DE SOFTWARE EN COLUMNAS
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(4, (i) {
                  return Expanded(
                    child: Column(
                      children: softwareColumnas[i]
                          .map((e) => buildCheckbox(e, softwareSeleccionado))
                          .toList(),
                    ),
                  );
                }),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text('Si no está en la lista, especifícalo:'),
                SizedBox(width: 10),
                Expanded(child: TextField(controller: otroSoftwareCtrl)),
              ],
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _onAceptar,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF0B2A5A),
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 14),
            ),
            child: Text('Aceptar'),
          ),
          SizedBox(height: 10),
          Container(height: 10, color: const Color.fromARGB(255, 25, 0, 94)),
        ],
      ),
    );
  }
}
