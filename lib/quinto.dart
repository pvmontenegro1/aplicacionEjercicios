// archivo: quinto.dart

import 'package:flutter/material.dart';

class QuintoEjercicioPage extends StatefulWidget {
  @override
  _QuintoEjercicioPageState createState() => _QuintoEjercicioPageState();
}

class _QuintoEjercicioPageState extends State<QuintoEjercicioPage> {
  final TextEditingController _antiguedadController = TextEditingController();
  final TextEditingController _sueldoController = TextEditingController();

  String _resultado = '';

  void _calcularReajuste() {
    int? antiguedad = int.tryParse(_antiguedadController.text);
    double? sueldo = double.tryParse(_sueldoController.text);

    if (antiguedad == null || sueldo == null || antiguedad < 0 || sueldo < 0) {
      setState(() {
        _resultado = 'Por favor, ingresa valores válidos para la antigüedad y el sueldo.';
      });
      return;
    }

    double reajuste = 0;

    // Reajuste para antigüedades superiores a 20 años
    if (antiguedad > 20) {
      reajuste = sueldo * 0.15;
    }
    // Reajuste para antigüedades entre 10 y 20 años
    else if (antiguedad >= 10) {
      if (sueldo <= 300000) {
        reajuste = sueldo * 0.14;
      } else if (sueldo > 300000 && sueldo <= 500000) {
        reajuste = sueldo * 0.12;
      } else {
        reajuste = sueldo * 0.10;
      }
    }
    // Reajuste para antigüedades menores a 10 años
    else {
      if (sueldo <= 300000) {
        reajuste = sueldo * 0.12;
      } else if (sueldo > 300000 && sueldo <= 500000) {
        reajuste = sueldo * 0.10;
      } else {
        reajuste = sueldo * 0.08;
      }
    }

    setState(() {
      _resultado = 'El reajuste es de \$${reajuste.toStringAsFixed(2)}. Sueldo total: \$${(sueldo + reajuste).toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quinto Ejercicio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _antiguedadController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Antigüedad (años)'),
            ),
            TextField(
              controller: _sueldoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Sueldo actual'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularReajuste,
              child: Text('Calcular Reajuste'),
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
