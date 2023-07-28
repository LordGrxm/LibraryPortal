import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:libraryportal/libbook.dart';

import 'login.dart';
import 'register.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _adminState();
}

class _adminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 4, 131, 163),
          bottom: TabBar(
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10), // Creates border
                color: Colors.greenAccent), //Change background color from her
            tabs: [
              Tab(icon: Icon(Icons.admin_panel_settings)),
              Tab(icon: Icon(Icons.book_sharp)),
            ],
          ),
          title: Text('Admin'),
        ),
        body: TabBarView(
          children: [
            Register(),
            Libbook(),
          ],
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
}
