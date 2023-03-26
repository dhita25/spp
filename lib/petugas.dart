import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'controllers/logout.dart';
import 'screenPetugas.dart';

class Petugas extends StatefulWidget {
  const Petugas({super.key});

  @override
  State<Petugas> createState() => _PetugasState();
}

class _PetugasState extends State<Petugas> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PETUGAS"),
        backgroundColor: Colors.blueGrey[900],
        actions: [
          IconButton(
            onPressed: () {
              logout(context);
            },
            icon: Icon(
              Icons.logout,
            ),
          )
        ],
      ),
      body: screenPetugas().elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        color: Colors.blueGrey[900],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 15),
          child: GNav(
            backgroundColor: Colors.blueGrey.shade900,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.orange.shade400,
            gap: 20,
            padding: EdgeInsets.all(10),
            tabs: const [
              GButton(
                icon: Icons.point_of_sale,
                text: 'Transaksi',  
              ),
              GButton(
                icon: Icons.history,
                text: 'History',
                ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index){
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),

    );
  }
}
