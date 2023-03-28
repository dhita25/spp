import 'package:flutter/material.dart';
import 'package:spp/siswa/history.dart';
import 'package:spp/controllers/logout.dart';

class Student extends StatefulWidget{
  const Student ({super.key});

  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student>{
  @override
  Widget build(BuildContext context){
    return Scaffold( 
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text("Student"),
        // actions: [
        //   IconButton(
        //     onPressed: (){
        //       logout(context);
        //     }, 
        //      icon: Icon(
        //       Icons.logout,
        //      ),
        //      )
        // ],
      ),
      //data data sidebar
      body: GridView.count(
        padding: const EdgeInsets.all(25),
        crossAxisCount: 1,
        children: <Widget> [
          //history
          Card(
            margin: const EdgeInsets.all(8),
            color: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            child: InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const PembayaranPage()));},
              splashColor: Colors.white,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget> [
                    Icon(Icons.history, size: 70, color: Colors.white,),
                    Text("HISTORY", style: TextStyle(fontSize: 17.0, color: Colors.white))
                  ],
                ),
              ),
            ),
          ),
          //LOGOUT
          Card(
            margin: const EdgeInsets.all(8),
            color: Colors.orange[400],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            child: InkWell(
              onTap: (){
                logout(context);
              },
              splashColor: Colors.white,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget> [
                    Icon(Icons.logout, size: 70, color: Colors.white,),
                    Text("LOGOUT", style: TextStyle(fontSize: 17.0, color: Colors.white)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Future<void> logout(BuildContext context) async{
//   CircularProgressIndicator();
//   await FirebaseAuth.instance.signOut();
//   Navigator.pushReplacement(
//     context, 
//     MaterialPageRoute(
//       builder: (context) => LoginPage(),
//       ),
//       );
// }