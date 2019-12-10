import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // a reference to a particular collection
  final CollectionReference brews = Firestore.instance.collection('brews');

  Future updateUserData(String sugars, String name, int strength) async {
    return await brews.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }
}
