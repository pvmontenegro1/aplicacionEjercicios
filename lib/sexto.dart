// archivo: sexto.dart

import 'package:flutter/material.dart';

class SextoEjercicioPage extends StatefulWidget {
  @override
  _SextoEjercicioPageState createState() => _SextoEjercicioPageState();
}

class _SextoEjercicioPageState extends State<SextoEjercicioPage> {
  final TextEditingController _sueldoBaseController = TextEditingController();
  final TextEditingController _horasNormalesController = TextEditingController();
  final TextEditingController _horasNocturnasController = TextEditingController();

  String _resultado = '';

  void _calcularSueldoSemanal() {
    double? sueldoBase = double.tryParse(_sueldoBaseController.text);
    int? horasExtrasNormales = int.tryParse(_horasNormalesController.text);
    int? horasExtrasNocturnas = int.tryParse(_horasNocturnasController.text);

    if (sueldoBase == null || horasExtrasNormales == null || horasExtrasNocturnas == null || sueldoBase < 0 || horasExtrasNormales < 0 || horasExtrasNocturnas < 0) {
      setState(() {
        _resultado = 'Por favor, ingresa valores válidos para el sueldo y las horas extras.';
      });
      return;
    }

    // Valores de las horas extras
    double valorHoraNormal = 2000;
    double valorHoraNocturna = valorHoraNormal * 1.3;

    // Cálculo de la valorización de las horas extras
    double pagoHorasExtrasNormales = horasExtrasNormales * valorHoraNormal;
    double pagoHorasExtrasNocturnas = horasExtrasNocturnas * valorHoraNocturna;

    // Cálculo del sueldo total
    double sueldoTotal = sueldoBase + pagoHorasExtrasNormales + pagoHorasExtrasNocturnas;

    setState(() {
      _resultado = 'El sueldo semanal total es \$${sueldoTotal.toStringAsFixed(2)}.\n'
                   'Pago por horas extras normales: \$${pagoHorasExtrasNormales.toStringAsFixed(2)}\n'
                   'Pago por horas extras nocturnas: \$${pagoHorasExtrasNocturnas.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sexto Ejercicio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _sueldoBaseController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Sueldo base'),
            ),
            TextField(
              controller: _horasNormalesController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Horas extras en horario normal'),
            ),
            TextField(
              controller: _horasNocturnasController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Horas extras en horario nocturno'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularSueldoSemanal,
              child: Text('Calcular Sueldo Semanal'),
            ),
            SizedBox(height: 20),
            Text(
              _resultado,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
