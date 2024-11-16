
import 'package:flutter/material.dart';

// NumberSortingComputer
class Ejercicio1 extends StatefulWidget {
  const Ejercicio1({super.key});

  @override
  State<Ejercicio1> createState() => _NumberSortingComputerState();
}

class _NumberSortingComputerState extends State<Ejercicio1> {
  final TextEditingController _controllerNumA = TextEditingController();
  final TextEditingController _controllerNumB = TextEditingController();
  final TextEditingController _controllerNumC = TextEditingController();

  double numA = 0.0;
  double numB = 0.0;
  double numC = 0.0;

  String errorMessage = '';

  void sortByAcendingOrder() {
    setState(() {
      if (numA < 0 || numB < 0 || numC < 0) {
        errorMessage = "Todos los números deben ser positivos.";
        numA = 0.0;
        numB = 0.0;
        numC = 0.0;
        return;
      }
      errorMessage = '';
      double temp = 0.0;

      if (numC >= numA) {
        temp = numC;
        numC = numA;
        numA = temp;
      }

      if (numA < numB) {
        temp = numB;
        numB = numA;
        numA = temp;
      }

      if (numB < numC) {
        temp = numC;
        numC = numB;
        numB = temp;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ordenar Números'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Ingrese tres números positivos para ordenarlos de mayor a menor.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controllerNumA,
              decoration: InputDecoration(
                labelText: 'Número A',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: const Icon(Icons.numbers),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                numA = double.tryParse(value) ?? 0.0;
              },
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _controllerNumB,
              decoration: InputDecoration(
                labelText: 'Número B',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: const Icon(Icons.numbers),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                numB = double.tryParse(value) ?? 0.0;
              },
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _controllerNumC,
              decoration: InputDecoration(
                labelText: 'Número C',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: const Icon(Icons.numbers),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                numC = double.tryParse(value) ?? 0.0;
              },
            ),
            const SizedBox(height: 20),
            if (errorMessage.isNotEmpty)
              Text(
                errorMessage,
                style: const TextStyle(color: Colors.red, fontSize: 14),
              ),
            const SizedBox(height: 10),
               ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: sortByAcendingOrder,
              child: const Text(
                'Ordenar',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            Text('Número A: $numA', style: const TextStyle(fontSize: 18)),
            Text('Número B: $numB', style: const TextStyle(fontSize: 18)),
            Text('Número C: $numC', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

/*import 'package:deber_activities/models/detail.dart';
import 'package:flutter/material.dart';

class Ejercicio1 extends StatefulWidget {
  @override
  _Ejercicio1State createState() => _Ejercicio1State();
}

class _Ejercicio1State extends State<Ejercicio1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu of Activities"),
        backgroundColor: Colors.white60,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: DetailMenu.length,
            itemBuilder: (context, index){
            return (index % 2 == 0)
                ? _item_left(DetailMenu[index].name, DetailMenu[index].photo)
                : _item_right(DetailMenu[index].name, DetailMenu[index].photo);

            }
        ),
      ),
    );
  }
}

Widget _item_left(String texto, String imagen) {
  return Row(
    children: [
      Expanded( flex:1, child: Text(texto)),
      Expanded(flex:1, child: Image.asset("assets/images/"+imagen, width: 125,))
    ],
  );
}

Widget _item_right(String texto, String imagen) {
  return Row(
    children: [
      Expanded(flex:1, child: Image.asset("assets/images/"+imagen, width: 125,)),
      Expanded( flex:1, child: Text(texto))
    ],
  );
}

*/