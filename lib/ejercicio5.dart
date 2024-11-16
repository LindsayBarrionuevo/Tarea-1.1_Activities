import 'package:flutter/material.dart';

class Ejercicio5 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>
      _Ejercicio5State(); // Creando el estado
}

class _Ejercicio5State extends State<Ejercicio5> {
  final TextEditingController _aniosEmpresaController = TextEditingController();
  final TextEditingController _sueldoActualController = TextEditingController();

  double? _reajusteSueldo;
  double? _salarioFinal;

  double calculateReajuste(int aniosAntiguedad, int sueldoActual) {
    if (aniosAntiguedad < 10 && aniosAntiguedad > 0) {
      if (sueldoActual <= 300000) {
        return sueldoActual * 0.12;
      } else if (sueldoActual > 300000 && sueldoActual <= 500000) {
        return sueldoActual * 0.1;
      } else if (sueldoActual > 500000) {
        return sueldoActual * 0.14;
      }
    } else if (aniosAntiguedad > 10 && aniosAntiguedad <= 20) {
      if (sueldoActual <= 300000) {
        return sueldoActual * 0.14;
      } else if (sueldoActual > 300000 && sueldoActual <= 500000) {
        return sueldoActual * 0.12;
      } else if (sueldoActual > 500000) {
        return sueldoActual * 0.1;
      }
    }
    return sueldoActual * 0.15;
  }

  void _calcular() {
    final aniosAntiguedad = int.tryParse(_aniosEmpresaController.text);
    final sueldoActual = int.tryParse(_sueldoActualController.text);
    if (aniosAntiguedad != null && sueldoActual != null) {
      setState(() {
        _reajusteSueldo = calculateReajuste(aniosAntiguedad, sueldoActual);
        _salarioFinal = _reajusteSueldo! + sueldoActual;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calcular Reajuste Salarial',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 239, 241, 77),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Calcula el reajuste salarial de un empleado.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Ingrese los años de antigüedad y el sueldo actual, para calcular el nuevo sueldo.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _aniosEmpresaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Años de antigüedad en la empresa',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: const Icon(Icons.business),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _sueldoActualController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Sueldo actual del empleado',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: const Icon(Icons.attach_money),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcular,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 239, 241, 77),
                foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'Calcular Reajuste',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            if (_salarioFinal != null)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      spreadRadius: 1.0,
                      offset: Offset(5.0, 5.0),
                    )
                  ],
                ),
                child: Text(
                  'El nuevo salario es: \$${_salarioFinal!.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
