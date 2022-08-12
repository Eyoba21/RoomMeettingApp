import 'package:firebase/services/auth.dart';
import 'package:firebase/services/google_signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NavBar extends StatelessWidget {
  final _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<GoogleSigInProvider>(context, listen: false);
    final user = FirebaseAuth.instance.currentUser!;
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Name:' + user.displayName!),
            accountEmail: Text('Email:' + user.email!),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.deepPurple,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Icon(Icons.logout),
                SizedBox(
                  width: 80,
                ),
                GestureDetector(
                    onDoubleTap: provider.googleLogout,
                    onTap: _auth.SignOut,
                    child: Text(
                      'Logout',
                      style: GoogleFonts.bebasNeue(fontSize: 20),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
