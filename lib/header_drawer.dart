import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget{
  const MyHeaderDrawer({Key? key}) : super(key: key);


  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState(); 
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[900],
      width: double.infinity,
      height: 83,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              // image: DecorationImage(
              //   image: AssetImage('assets/login.png'),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}