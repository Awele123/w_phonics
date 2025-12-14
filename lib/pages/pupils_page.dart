
import 'package:flutter/material.dart';

class PupilsPage extends StatelessWidget {
  const PupilsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text("Pupils") ,
        automaticallyImplyLeading: false,
        actions: [
          PupilAppBarContainer(),
          SizedBox(width: 5.0),
            PupilAppBarContainer(
              icon: Icon(Icons.add, color:  const Color.fromARGB(255, 170, 38, 193,))
            ),
             SizedBox(width: 8.0),
        ],
      ),
      body: Center(child: Text("No pupils yet")),
    );
    // Text("Hello Lessons Page", style: TextStyle(color: Colors.black),);
  }
}

class PupilAppBarContainer extends StatelessWidget {
  const PupilAppBarContainer({
    super.key, this.icon,
  });
final Icon? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow:[
          BoxShadow(
            color: const Color.fromARGB(255, 180, 166, 166).withValues(alpha:8),
            blurRadius: 3,
          //spreadRadius: 1,
            offset: Offset(0, 4)
          
          )
        ]
      ),
      child: icon ?? Icon(Icons.info_outline_rounded, color: const Color.fromARGB(255, 170, 38, 193),),
    );
  }
}