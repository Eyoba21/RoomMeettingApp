// ignore_for_file: deprecated_member_use

import 'package:firebase/services/google_signin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileVeiw extends StatefulWidget {
  const ProfileVeiw({Key? key}) : super(key: key);

  @override
  State<ProfileVeiw> createState() => _ProfileVeiwState();
}

class _ProfileVeiwState extends State<ProfileVeiw> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<GoogleSigInProvider>(context, listen: false);
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue[700],
        title: Center(
            child: Text(
          'Profile',
          style: GoogleFonts.italianno(fontSize: 40, color: Colors.white),
        )),
      ),
      backgroundColor: Colors.blue[700],
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
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.deepPurple,
                        maxRadius: 50,
                        backgroundImage: NetworkImage(user.photoURL!),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Name:\t\t" + user.displayName!,
                      style: GoogleFonts.italianno(
                          fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Email:" + user.email!,
                      style: GoogleFonts.italianno(
                          fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        child: RaisedButton(
                          color: Colors.blue[700],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          onPressed: () => provider.googleLogout(),
                          child: Text(
                            'Logout',
                            style: GoogleFonts.bebasNeue(
                                fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    )
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
