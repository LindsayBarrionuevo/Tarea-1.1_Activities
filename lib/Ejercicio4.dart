import 'package:flutter/material.dart';

class Ejercicio4 extends StatefulWidget {
  const Ejercicio4({super.key});

  @override
  State<Ejercicio4> createState() => _Ejercicio4State();
}

class _Ejercicio4State extends State<Ejercicio4> {
  final TextEditingController _controllerLadoA = TextEditingController();
  final TextEditingController _controllerLadoB = TextEditingController();
  final TextEditingController _controllerLadoC = TextEditingController();

  double ladoA = 0.0;
  double ladoB = 0.0;
  double ladoC = 0.0;

  String resultMessage = '';

  void checkTriangle() {
    //Primero voy a poner las validaciones que son básicas/
    setState(() {
      if (_controllerLadoA.text.isEmpty ||
          _controllerLadoB.text.isEmpty ||
          _controllerLadoC.text.isEmpty) {
        resultMessage = 'Por favor, ingrese todos los lados.';
        return;
      }

      ladoA = double.tryParse(_controllerLadoA.text) ?? 0.0;
      ladoB = double.tryParse(_controllerLadoB.text) ?? 0.0;
      ladoC = double.tryParse(_controllerLadoC.text) ?? 0.0;

      if (ladoA <= 0 || ladoB <= 0 || ladoC <= 0) {
        resultMessage = 'Todos los lados deben ser números positivos.';
        return;
      }

//Lo primero a hacer es que se debe determinar la desigualdad triangular.
      if (ladoA + ladoB > ladoC &&
          ladoA + ladoC > ladoB &&
          ladoB + ladoC > ladoA) {
        //Casos para definir el tipo de triángulo:
        if (ladoA == ladoB && ladoB == ladoC) {
          resultMessage = 'Los lados forman un triángulo equilátero.';
        } else if (ladoA == ladoB || ladoA == ladoC || ladoB == ladoC) {
          resultMessage = 'Los lados forman un triángulo isósceles.';
        } else {
          resultMessage = 'Los lados forman un triángulo escaleno.';
        }
      } else {
        resultMessage = 'Los lados ingresados no forman un triángulo.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verificar Triángulo'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Ingrese las longitudes de tres lados para verificar si forman un triángulo:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controllerLadoA,
              decoration: InputDecoration(
                labelText: 'Lado A',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: const Icon(Icons.straighten),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _controllerLadoB,
              decoration: InputDecoration(
                labelText: 'Lado B',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: const Icon(Icons.straighten),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _controllerLadoC,
              decoration: InputDecoration(
                labelText: 'Lado C',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: const Icon(Icons.straighten),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: checkTriangle,
              child: const Text(
                'Verificar Triángulo',
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
