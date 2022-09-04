// ignore_for_file: deprecated_member_use
import 'package:firebase/services/auth.dart';
import 'package:firebase/services/google_signin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
  // ignore: prefer_typing_uninitialized_variables
  final toggelVeiw;
  const SignIn({Key? key, this.toggelVeiw}) : super(key: key);
}

class _SignInState extends State<SignIn> {
  AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String error = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      appBar: AppBar(
        elevation: 0.0,
        title: Center(
            child:
                Text('SiginPage', style: GoogleFonts.italianno(fontSize: 35))),
        backgroundColor: Colors.blue[700],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 250,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[350],
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                  ),
                  child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 50),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Container(
                                height: 55,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: TextFormField(
                                  validator: (value) =>
                                      value!.isEmpty ? 'Enter yor email' : null,
                                  onChanged: (value) {
                                    setState(() {
                                      email = value.trim();
                                    });
                                  },
                                  decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 10),
                                      errorStyle:
                                          TextStyle(fontSize: 9, height: 5.0),
                                      hintText: " \t\t Email",
                                      border: InputBorder.none),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Container(
                                height: 55,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: TextFormField(
                                  obscureText: true,
                                  validator: (value) => value!.length < 6
                                      ? 'Minimum password length is 6'
                                      : null,
                                  onChanged: (value) {
                                    setState(() {
                                      password = value.trim();
                                    });
                                  },
                                  decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 10),
                                      errorStyle:
                                          TextStyle(fontSize: 9, height: 5.0),
                                      hintText: " \t\t Password",
                                      border: InputBorder.none),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Container(
                                width: double.infinity,
                                height: 55,
                                decoration: BoxDecoration(
                                  color: Colors.blue[700],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      await _auth.SigninWithEmailAndPassword(
                                          email, password);
                                    } else {
                                      setState(() {
                                        error =
                                            "Enter Valid information or check you'r connection ";
                                      });
                                    }
                                  },
                                  color: Colors.blue[700],
                                  child: Text(
                                    'Sigin',
                                    style: GoogleFonts.italianno(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 100),
                              child: Row(
                                children: [
                                  const Text('Not a member ?'),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: widget.toggelVeiw,
                                    child: Text(
                                      'Register',
                                      style: GoogleFonts.italianno(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 35),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              error,
                              style: TextStyle(color: Colors.red),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      final provider =
                                          Provider.of<GoogleSigInProvider>(
                                              context,
                                              listen: false);
                                      provider.googleLogin();
                                    },
                                    icon: FaIcon(
                                      FontAwesomeIcons.google,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text("Continue with google"),
                              ],
                            ),
                          ],
                        ),
                      ))),
            ),
          ),
        ],
      ),
    );
  }
}
