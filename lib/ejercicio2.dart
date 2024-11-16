import 'package:flutter/material.dart';

//Ejercicio2
class Ejercicio2 extends StatefulWidget {
  const Ejercicio2({super.key});

  @override
  State<Ejercicio2> createState() => _ChothesPriceCalculatorState();
}

class _ChothesPriceCalculatorState extends State<Ejercicio2> {
  final TextEditingController _controllerShirtsNum = TextEditingController();

  int shirtsNum = 0;
  double totalPrice = 0.0;
  String errorMessage = '';

  void calculateShirtsPrice() {
    setState(() {
      if (shirtsNum <= 0) {
        errorMessage = "Por favor, ingrese un número válido de camisas.";
        totalPrice = 0.0;
      } else {
        errorMessage = '';
        if (shirtsNum > 3) {
          totalPrice = shirtsNum * 4000;
        } else {
          totalPrice = shirtsNum * 4800;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de precio de camisas"),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Ingrese el número de camisas',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controllerShirtsNum,
              decoration: InputDecoration(
                labelText: 'Número de camisas',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: const Icon(Icons.shopping_bag),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                shirtsNum = int.tryParse(value) ?? 0;
              },
            ),
            const SizedBox(height: 10),
            if (errorMessage.isNotEmpty)
              Text(
                errorMessage,
                style: const TextStyle(color: Colors.red, fontSize: 14),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: calculateShirtsPrice,
              child: const Text(
                'Calcular precio total',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Precio Total: \$${totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
