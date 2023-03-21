import 'package:flutter/material.dart';


class SPP extends StatelessWidget {
  const SPP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data SPP'),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('Page SPP')
          ],
        ),
      ),
    );
  }
}