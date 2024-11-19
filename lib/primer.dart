// archivo: primer.dart

import 'package:flutter/material.dart';

class PrimerEjercicioPage extends StatefulWidget {
  @override
  _PrimerEjercicioPageState createState() => _PrimerEjercicioPageState();
}

class _PrimerEjercicioPageState extends State<PrimerEjercicioPage> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  final TextEditingController _num3Controller = TextEditingController();

  String _resultado = '';

  void _ordenarNumeros() {
    int? num1 = int.tryParse(_num1Controller.text);
    int? num2 = int.tryParse(_num2Controller.text);
    int? num3 = int.tryParse(_num3Controller.text);

    if (num1 == null || num2 == null || num3 == null) {
      setState(() {
        _resultado = 'Por favor, ingresa números válidos.';
      });
      return;
    }

    List<int> numeros = [num1, num2, num3];
    numeros.sort(); // Ordena los números en orden ascendente

    setState(() {
      _resultado = 'Números en orden ascendente: ${numeros[0]}, ${numeros[1]}, ${numeros[2]}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primer Ejercicio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 1'),
            ),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 2'),
            ),
            TextField(
              controller: _num3Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 3'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _ordenarNumeros,
              child: Text('Ordenar Números'),
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
