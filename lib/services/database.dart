import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference CoffeeCollection =
      FirebaseFirestore.instance.collection('buna');
}
