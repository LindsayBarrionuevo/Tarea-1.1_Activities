import 'package:flutter/material.dart';
import 'dart:math';

class Ejercicio3 extends StatefulWidget {
  const Ejercicio3({super.key});

  @override
  State<Ejercicio3> createState() => _Ejercicio3State();
}

class _Ejercicio3State extends State<Ejercicio3> {
  final TextEditingController _controllerA = TextEditingController();
  final TextEditingController _controllerB = TextEditingController();
  final TextEditingController _controllerC = TextEditingController();

  double coefA = 0.0;
  double coefB = 0.0;
  double coefC = 0.0;

  String resultMessage = '';

  void calculateRoots() {
    setState(() {
      // Validar que los campos no estén vacíos
      if (_controllerA.text.isEmpty ||
          _controllerB.text.isEmpty ||
          _controllerC.text.isEmpty) {
        resultMessage = 'Por favor, ingrese todos los coeficientes.';
        return;
      }

      coefA = double.tryParse(_controllerA.text) ?? 0.0;
      coefB = double.tryParse(_controllerB.text) ?? 0.0;
      coefC = double.tryParse(_controllerC.text) ?? 0.0;

      if (coefA == 0) {
        resultMessage =
            'El coeficiente A no puede ser 0. Esto no es una ecuación de segundo grado.';
        return;
      }

      double discriminant = coefB * coefB - 4 * coefA * coefC;

      if (discriminant < 0) {
        resultMessage = 'La ecuación tiene soluciones imaginarias.';
      } else if (discriminant == 0) {
        double root = -coefB / (2 * coefA);
        resultMessage =
            'La ecuación tiene una raíz única: ${root.toStringAsFixed(2)}';
      } else {
        double root1 = (-coefB + sqrt(discriminant)) / (2 * coefA);
        double root2 = (-coefB - sqrt(discriminant)) / (2 * coefA);
        resultMessage =
            'Las raíces de la ecuación son: ${root1.toStringAsFixed(2)} y ${root2.toStringAsFixed(2)}';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cálculo de raíces'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Ingrese los coeficientes de la ecuación: (Ax² + Bx + C = 0):',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controllerA,
              decoration: InputDecoration(
                labelText: 'Coeficiente A',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: const Icon(Icons.numbers),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _controllerB,
              decoration: InputDecoration(
                labelText: 'Coeficiente B',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: const Icon(Icons.numbers),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _controllerC,
              decoration: InputDecoration(
                labelText: 'Coeficiente C',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: const Icon(Icons.numbers),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: calculateRoots,
              child: const Text(
                'Calcular raíces',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              resultMessage,
              style: const TextStyle(fontSize: 18, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
