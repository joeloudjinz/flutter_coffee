import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  // a reference to a particular collection 
  final CollectionReference brews = Firestore.instance.collection('brews');
}