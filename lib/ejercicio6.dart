import 'package:flutter/material.dart';

class Ejercicio6 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Ejercicio6State();
}

class _Ejercicio6State extends State<Ejercicio6> {
  final TextEditingController _horasMatutinasController =
      TextEditingController();
  final TextEditingController _horasVespertinasController =
      TextEditingController();

  double? _salarioFinalHorasExtra;
  double? _salarioFinal;
  double salarioSemanal = 1000;

  double calculateTarifa(int horasMatutinas, int horasVespertinas) {
    return (horasMatutinas * 2000) + (horasVespertinas * (2000 * 1.3));
  }

  void _calcular() {
    final horasMatutinas = int.tryParse(_horasMatutinasController.text);
    final horasVespertinas = int.tryParse(_horasVespertinasController.text);
    if (horasMatutinas != null && horasVespertinas != null) {
      setState(() {
        _salarioFinalHorasExtra =
            calculateTarifa(horasMatutinas, horasVespertinas);
        _salarioFinal = _salarioFinalHorasExtra! + salarioSemanal;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calcular Sueldo Semanal',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 73, 181, 63),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Calcula la tarifa de un empleado.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Horario Matutino: Horas × 2000\n'
              'Horario Vespertino: Horas × (2000 × 1.3)\n'
              'Salario Semanal Base: \$1000',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _horasMatutinasController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Horas Matutinas (7am - 12pm)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: const Icon(Icons.wb_sunny),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _horasVespertinasController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Horas Vespertinas (12pm - 7pm)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: const Icon(Icons.nights_stay),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcular,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 73, 181, 63),
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'Calcular Sueldo',
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
                  'La tarifa es: \$${_salarioFinal!.toStringAsFixed(2)}',
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
