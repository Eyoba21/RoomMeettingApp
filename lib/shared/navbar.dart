import 'package:firebase/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class NavBar extends StatelessWidget {
  final _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Row(
              children: [
                Text("Name: "),
                Text(user.displayName ?? 'NoName'),
              ],
            ),
            accountEmail: Text('Email:' + user.email!),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.deepPurple,
              backgroundImage: NetworkImage(user.photoURL ?? 'NoPhoto'),
            ),
          ),
        
        ],
      ),
    );
  }
}
