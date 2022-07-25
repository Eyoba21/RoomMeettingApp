import 'package:firebase/screens/authenticate/register.dart';
import 'package:firebase/screens/authenticate/signin.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool IsShowSignIn = true;
    toggelVeiw() {
    setState(() => IsShowSignIn = !IsShowSignIn);
  }
  @override
  Widget build(BuildContext context) {
    
    if (IsShowSignIn == true ) {
      return SignIn(toggelVeiw: toggelVeiw);
    } else {
      return Register(toggelVeiw: toggelVeiw);
    }
    
    //return SignIn();
  }
}
