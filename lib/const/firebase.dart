import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

final Future<FirebaseApp> initialization = Firebase.initializeApp();
final FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
