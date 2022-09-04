import 'package:firebase/models/user.dart';
import 'package:firebase/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase/shared/bottom.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users?>(context);
    print(user);
    if (user == null) {
      return Authenticate();
    } else {
      return BottomNav();
    }
  }
}
