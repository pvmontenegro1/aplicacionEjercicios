// archivo: cuarto.dart

import 'package:flutter/material.dart';

class CuartoEjercicioPage extends StatefulWidget {
  @override
  _CuartoEjercicioPageState createState() => _CuartoEjercicioPageState();
}

class _CuartoEjercicioPageState extends State<CuartoEjercicioPage> {
  final TextEditingController _lado1Controller = TextEditingController();
  final TextEditingController _lado2Controller = TextEditingController();
  final TextEditingController _lado3Controller = TextEditingController();

  String _resultado = '';

  void _determinarTriangulo() {
    double? lado1 = double.tryParse(_lado1Controller.text);
    double? lado2 = double.tryParse(_lado2Controller.text);
    double? lado3 = double.tryParse(_lado3Controller.text);

    if (lado1 == null || lado2 == null || lado3 == null) {
      setState(() {
        _resultado = 'Por favor, ingresa valores válidos para los tres lados.';
      });
      return;
    }

    // Validar si los lados forman un triángulo
    if ((lado1 + lado2 > lado3) && (lado1 + lado3 > lado2) && (lado2 + lado3 > lado1)) {
      // Es un triángulo válido
      if (lado1 == lado2 && lado2 == lado3) {
        setState(() {
          _resultado = 'El triángulo es equilátero.';
        });
      } else if (lado1 == lado2 || lado1 == lado3 || lado2 == lado3) {
        setState(() {
          _resultado = 'El triángulo es isósceles.';
        });
      } else {
        setState(() {
          _resultado = 'El triángulo es escaleno.';
        });
      }
    } else {
      // No es un triángulo
      setState(() {
        _resultado = 'Los lados ingresados no forman un triángulo.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cuarto Ejercicio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _lado1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Lado 1'),
            ),
            TextField(
              controller: _lado2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Lado 2'),
            ),
            TextField(
              controller: _lado3Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Lado 3'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _determinarTriangulo,
              child: Text('Determinar Tipo de Triángulo'),
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
