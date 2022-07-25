import 'package:flutter/material.dart';
import 'package:firebase/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
  final toggelVeiw;
  SignIn({Key? key, this.toggelVeiw}) : super(key: key);
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _emailControler = TextEditingController();
  final _passwordControler = TextEditingController();
  String Error = "";
  bool loading = false;
  Future Signin() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
    final email = _emailControler.text.trim();
    final password = _passwordControler.text.trim();
    final dynamic result =
        await _auth.SigninWithEmailAndPassword(email, password);
        Navigator.of(context).pop();
    if (result == null) {
      setState(() {
        Error = "Enter valid information";
      });
    }

    return _auth.SigninWithEmailAndPassword(email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.room),
            const Center(
                child: Text(
              "Hello Again",
              style: TextStyle(
                fontSize: 54,
                fontWeight: FontWeight.bold,
              ),
            )),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Welcome back you've been missed",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    controller: _emailControler,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    controller: _passwordControler,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: GestureDetector(
                onTap: Signin,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.deepPurple,
                  ),
                  child: const Center(
                    child: Text(
                      'Signin',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Not a member ? ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                RaisedButton(
                  onPressed: widget.toggelVeiw,
                  color: Colors.blue,
                  child: Text(
                    "Rigster now",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Text(
              Error,
              style: TextStyle(color: Colors.red),
            ),
          ],
        ));
  }
}
