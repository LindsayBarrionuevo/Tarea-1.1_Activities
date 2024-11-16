import 'package:flutter/material.dart';
import 'package:deber_activities/ejercicio1.dart';
import 'package:deber_activities/ejercicio2.dart';
import 'models/activitymenu.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final Map<int, Widget> exerciseScreens = {
    1: Ejercicio1(),
    2: Ejercicio2(),
   // 3: Ejercicio3(),
    // Añade más ejercicios aquí
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ACTIVITIES"),
        backgroundColor: Colors.white60,
      ),
      backgroundColor: Colors.deepPurple.shade100,
      body: Container(
        child: GridView.builder(
          itemCount: ActivityMenu.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10.0,
                    spreadRadius: 0.5,
                    offset: Offset(0.5, 0.5),
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () {
                  final selectedExercise = exerciseScreens[ActivityMenu[index].id];
                  if (selectedExercise != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => selectedExercise),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("¡Ejercicio no disponible!")),
                    );
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 125,
                      height: 125,
                      child: Image.asset(
                        'assets/images/' + ActivityMenu[index].photo,
                      ),
                    ),
                    Text(ActivityMenu[index].name),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


/*import 'package:deber_activities/Ejercicio1.dart';
import 'package:flutter/material.dart';
import 'models/activitymenu.dart';

class Menu extends StatefulWidget {

  @override
  _MenuState createState() => _MenuState ();
}
class _MenuState extends State<Menu>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ACTIVITIES"),
        backgroundColor: Colors.white60,
      ),
      backgroundColor: Colors.deepPurple.shade100,
      body: Container(

        child: GridView.builder(
          itemCount: ActivityMenu.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index){
            return Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10.0,
                  spreadRadius: 0.5,
                  offset: Offset(0.5, 0.5)
              )
              ],
              ),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>Ejercicio1()));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 125,
                      height: 125,
                      child: Image.asset('assets/images/'+ActivityMenu[index].photo),
                    ),
                    Text(ActivityMenu[index].name)
                  ],
                ),
              )
            );
            }
        ),
      ),
    );
  }

}

*/