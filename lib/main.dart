import 'package:firebase/models/user.dart';
import 'package:firebase/screens/wrapper.dart';
import 'package:firebase/services/google_signin.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:firebase/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => GoogleSigInProvider(),
          ),
          StreamProvider<Users?>.value(
            value: AuthService().user,
            initialData: null,
          )
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primarySwatch: Colors.blue),
            home: Wrapper()),
      );
}
