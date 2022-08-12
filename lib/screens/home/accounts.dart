// ignore_for_file: deprecated_member_use

import 'package:firebase/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Accounts extends StatelessWidget {
   Accounts({Key? key}) : super(key: key);
  AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue[700],
        toolbarHeight: 80,
        title: Center(
          child: Text(
            'Accounts',
            style: GoogleFonts.italianno(fontSize: 40, color: Colors.white),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Account',
                        style: GoogleFonts.bebasNeue(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'tigst Melka',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Email',
                        style: GoogleFonts.bebasNeue(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'tigst@gmail.com',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    onPressed: () => _auth.SignOut(),
                    child: Text('Logout'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
