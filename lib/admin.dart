import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spp/admin/siswa.dart';
import 'package:spp/admin/kelas.dart';
import 'package:spp/admin/entri.dart';
import 'package:spp/admin/history.dart';
import 'package:spp/admin/spp.dart';
import 'header_drawer.dart';
import 'admin/petugas.dart';
import 'package:spp/admin/register.dart';
import 'package:spp/controllers/logout.dart';

class Admin extends StatefulWidget{
  const Admin ({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin>{
  @override
  Widget build(BuildContext context){
    return Scaffold( 
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text("Admin"),
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
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const MyHeaderDrawer(),
              //siswa
              ListTile(
                leading: const Icon(Icons.school),
                title: const Text("Siswa"),
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const Siswa()));},
              ),
              //petugas
              ListTile(
                leading: const Icon(Icons.people),
                title: const Text("Petugas"),
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const Petugas()));},
              ),
              //kelas
              ListTile(
                leading: const Icon(Icons.class_),
                title: const Text("Kelas"),
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const Kelas()));},
              ),
              //SPP
              ListTile(
                leading: const Icon(Icons.payments),
                title: const Text("SPP"),
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const SPP()));},
              ),
              //ENTRI TRANSAKSI
              ListTile(
                leading: const Icon(Icons.point_of_sale),
                title: const Text("Entri Transaksi"),
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const Entri()));},
              ),
              //HISTORY
              ListTile(
                leading: const Icon(Icons.history),
                title: const Text("History"),
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const History()));},
              ),
              //ADD AKUN
              ListTile(
                leading: const Icon(Icons.person_add),
                title: const Text("Add Account"),
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) =>  Register()));},
              ),
              //LOGOUT
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("Logout"),
                onTap: (){logout(context);},
              ),
            ],
          ),
        ),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(25),
        crossAxisCount: 2,
        children: <Widget> [
          //siswa
          Card(
            margin: const EdgeInsets.all(8),
            color: Colors.orange[400],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            child: InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const Siswa()));},
              splashColor: Colors.white,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget> [
                    Icon(Icons.school , size: 70, color: Colors.white,),
                    Text("SISWA", style: TextStyle(fontSize: 17.0, color: Colors.white))
                  ],
                ),
              ),
            ),
          ),
          //petugas
          Card(
            margin: const EdgeInsets.all(8),
            color: Colors.orange[400],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Petugas()));
              },
              splashColor: Colors.white,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget> [
                    Icon(Icons.people, size: 70, color: Colors.white,),
                    Text("PETUGAS", style: TextStyle(fontSize: 17.0, color: Colors.white))
                  ],
                ),
              ),
            ),
          ),
          //kelas
          Card(
            margin: const EdgeInsets.all(8),
            color: Colors.blueGrey[900],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            child: InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const Kelas()));},
              splashColor: Colors.white,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget> [
                    Icon(Icons.class_, size: 70, color: Colors.white,),
                    Text("KELAS", style: TextStyle(fontSize: 17.0, color: Colors.white))
                  ],
                ),
              ),
            ),
          ),
          //SPP
          Card(
            margin: const EdgeInsets.all(8),
            color: Colors.blueGrey[900],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            child: InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const SPP()));},
              splashColor: Colors.white,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget> [
                    Icon(Icons.payments, size: 70, color: Colors.white,),
                    Text("SPP", style: TextStyle(fontSize: 17.0, color: Colors.white))
                  ],
                ),
              ),
            ),
          ),
          //transaksi
          Card(
            margin: const EdgeInsets.all(8),
            color: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            child: InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const Entri()));},
              splashColor: Colors.white,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget> [
                    Icon(Icons.point_of_sale, size: 70, color: Colors.white,),
                    Text("ENTRI", style: TextStyle(fontSize: 17.0, color: Colors.white)),
                    Text("TRANSAKSI", style: TextStyle(fontSize: 17.0, color: Colors.white))
                  ],
                ),
              ),
            ),
          ),
          //history
          Card(
            margin: const EdgeInsets.all(8),
            color: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            child: InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const History()));},
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
          //AKUN
          Card(
            margin: const EdgeInsets.all(8),
            color: Colors.orange[400],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            child: InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) =>  Register()));},
              splashColor: Colors.white,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget> [
                    Icon(Icons.person_add, size: 70, color: Colors.white,),
                    Text("ADD ACCOUNT", style: TextStyle(fontSize: 16.0, color: Colors.white))
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