import 'package:deber_activities/models/detail.dart';
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