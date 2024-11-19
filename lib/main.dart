import 'package:flutter/material.dart';
import 'primer.dart';
import 'segundo.dart';
import 'tercer.dart';
import 'cuarto.dart';
import 'quinto.dart';
import 'sexto.dart'; // Importa la pantalla del sexto ejercicio

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicios',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(), // Página de inicio con los botones
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicios'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade200, Colors.purple.shade300],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              _buildExerciseCard(
                context,
                'Primer Ejercicio: Ordenar Números',
                PrimerEjercicioPage(),
                Colors.redAccent,
              ),
              _buildExerciseCard(
                context,
                'Segundo Ejercicio: Costo de Camisas',
                SegundoEjercicioPage(),
                Colors.orangeAccent,
              ),
              _buildExerciseCard(
                context,
                'Tercer Ejercicio: Ecuación Cuadrática',
                TercerEjercicioPage(),
                Colors.yellowAccent,
              ),
              _buildExerciseCard(
                context,
                'Cuarto Ejercicio: Tipos de Triángulos',
                CuartoEjercicioPage(),
                Colors.greenAccent,
              ),
              _buildExerciseCard(
                context,
                'Quinto Ejercicio: Reajuste de Sueldos',
                QuintoEjercicioPage(),
                Colors.lightBlueAccent,
              ),
              _buildExerciseCard(
                context,
                'Sexto Ejercicio: Sueldo Semanal',
                SextoEjercicioPage(),
                Colors.purpleAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExerciseCard(
      BuildContext context, String title, Widget page, Color color) {
    return Card(
      color: color.withOpacity(0.8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: ListTile(
        title: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
      ),
    );
  }
}
