// archivo: segundo.dart

import 'package:flutter/material.dart';

class SegundoEjercicioPage extends StatefulWidget {
  @override
  _SegundoEjercicioPageState createState() => _SegundoEjercicioPageState();
}

class _SegundoEjercicioPageState extends State<SegundoEjercicioPage> {
  final TextEditingController _camisasController = TextEditingController();

  String _resultado = '';

  void _calcularCosto() {
    int? cantidad = int.tryParse(_camisasController.text);

    if (cantidad == null || cantidad <= 0) {
      setState(() {
        _resultado = 'Por favor, ingresa una cantidad válida de camisas.';
      });
      return;
    }

    double precio;
    if (cantidad > 3) {
      precio = 4000.0;
    } else {
      precio = 4800.0;
    }

    double total = cantidad * precio;

    setState(() {
      _resultado = 'Costo total de la compra: \$${total.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segundo Ejercicio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _camisasController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número de camisas'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularCosto,
              child: Text('Calcular Costo'),
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
