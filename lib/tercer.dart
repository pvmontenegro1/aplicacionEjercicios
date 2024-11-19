// archivo: tercer.dart

import 'package:flutter/material.dart';
import 'dart:math'; // Para utilizar sqrt (raíz cuadrada)

class TercerEjercicioPage extends StatefulWidget {
  @override
  _TercerEjercicioPageState createState() => _TercerEjercicioPageState();
}

class _TercerEjercicioPageState extends State<TercerEjercicioPage> {
  final TextEditingController _aController = TextEditingController();
  final TextEditingController _bController = TextEditingController();
  final TextEditingController _cController = TextEditingController();

  String _resultado = '';

  void _calcularRaices() {
    double? a = double.tryParse(_aController.text);
    double? b = double.tryParse(_bController.text);
    double? c = double.tryParse(_cController.text);

    if (a == null || b == null || c == null) {
      setState(() {
        _resultado = 'Por favor, ingresa valores válidos para A, B y C.';
      });
      return;
    }

    // Verificar si A es igual a 0
    if (a == 0) {
      setState(() {
        _resultado = 'A no puede ser cero. No es una ecuación de segundo grado.';
      });
      return;
    }

    // Calcular el discriminante
    double discriminante = pow(b, 2) - 4 * a * c;

    if (discriminante < 0) {
      setState(() {
        _resultado = 'La solución es imaginaria, ya que el discriminante es negativo.';
      });
    } else if (discriminante == 0) {
      double x = -b / (2 * a);
      setState(() {
        _resultado = 'Hay una sola solución real: x = ${x.toStringAsFixed(2)}';
      });
    } else {
      double x1 = (-b + sqrt(discriminante)) / (2 * a);
      double x2 = (-b - sqrt(discriminante)) / (2 * a);
      setState(() {
        _resultado = 'Las soluciones reales son: x1 = ${x1.toStringAsFixed(2)}, x2 = ${x2.toStringAsFixed(2)}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tercer Ejercicio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _aController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Coeficiente A'),
            ),
            TextField(
              controller: _bController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Coeficiente B'),
            ),
            TextField(
              controller: _cController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Coeficiente C'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularRaices,
              child: Text('Calcular Raíces'),
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
