import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:universal_html/html.dart' as html;
import 'package:excel/excel.dart' as ex;

class ReporteDocentes extends StatefulWidget {
  const ReporteDocentes({super.key});

  @override
  State<ReporteDocentes> createState() => _ReporteDocentesState();
}

class _ReporteDocentesState extends State<ReporteDocentes> {
  String? ciclo;
  String? anio;
  final ciclos = ['ENERO-JUNIO', 'AGOSTO-DICIEMBRE', 'VERANO'];
  final anios = [for (var i = DateTime.now().year; i <= 2030; i++) '$i'];

  List<Map<String, String>> datos = [];

  void generarReporte() {
    setState(() {
      datos = [
        {
          'Folio': 'A001',
          'Nombre': 'Juan Pérez',
          'Grupo': '3A',
          'Fecha': '10/06/2025'
        },
        {
          'Folio': 'A002',
          'Nombre': 'María López',
          'Grupo': '2B',
          'Fecha': '12/06/2025'
        },
      ];
    });
  }

  void exportarExcel() async {
    var excel = ex.Excel.createExcel();
    var sheet = excel['Reportes Alumnos'];
    sheet.appendRow(['Folio', 'Nombre', 'Grupo', 'Fecha']);
    for (var d in datos) {
      sheet.appendRow([d['Folio'], d['Nombre'], d['Grupo'], d['Fecha']]);
    }
    final excelBytes = excel.encode();

    if (kIsWeb) {
      final blob = html.Blob([excelBytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..setAttribute("download", "reporte_AlumnosFallas.xlsx")
        ..click();
      html.Url.revokeObjectUrl(url);
    } else {
      var dir = await getApplicationDocumentsDirectory();
      String outputPath = '${dir.path}/reporte_AlumnosFallas.xlsx';
      File(outputPath)
        ..createSync(recursive: true)
        ..writeAsBytesSync(excelBytes!);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Reporte exportado en documentos')));
    }
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
                'Reportes Docentes',
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
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildDropdown('CICLO', ciclos, ciclo,
                      (val) => setState(() => ciclo = val)),
                  buildDropdown(
                      'AÑO', anios, anio, (val) => setState(() => anio = val)),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: generarReporte,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4C7ED6),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text('Generar Reporte',
                        style: TextStyle(fontSize: 16)),
                  ),
                  const SizedBox(height: 20),
                  if (datos.isNotEmpty)
                    Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            columns: const [
                              DataColumn(label: Text('Folio')),
                              DataColumn(label: Text('Nombre')),
                              DataColumn(label: Text('Grupo')),
                              DataColumn(label: Text('Fecha')),
                            ],
                            rows: datos
                                .map((d) => DataRow(cells: [
                                      DataCell(Text(d['Folio']!)),
                                      DataCell(Text(d['Nombre']!)),
                                      DataCell(Text(d['Grupo']!)),
                                      DataCell(Text(d['Fecha']!)),
                                    ]))
                                .toList(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: exportarExcel,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFEAEAEA),
                            foregroundColor: const Color(0xFF2C3E50),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text('Exportar a Excel',
                              style: TextStyle(fontSize: 16)),
                        )
                      ],
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

  Widget buildDropdown(String label, List<String> items, String? selected,
      void Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButton<String>(
              isExpanded: true,
              value: selected,
              hint: Text('Seleccione $label'),
              underline: const SizedBox(),
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
}
