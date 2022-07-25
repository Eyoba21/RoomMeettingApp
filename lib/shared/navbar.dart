import 'package:firebase/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class NavBar extends StatelessWidget {
 
  final _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(accountName: Text('Tigst'), accountEmail: Text('tigst@gmail.com'),
          currentAccountPicture: CircleAvatar(backgroundColor: Colors.deepPurple,),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                 Icon(Icons.logout),
                  SizedBox(width: 30,),
                GestureDetector(
                  onTap: _auth.SignOut,
                  child: Text('Logout', style: GoogleFonts.bebasNeue(fontSize: 20),)),
               
              ],
            ),
          ),
        ],
      ),
    );
  }
}