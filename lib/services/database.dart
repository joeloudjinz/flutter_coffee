import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // a reference to a particular collection
  final CollectionReference _brews = Firestore.instance.collection('brews');

  Future updateUserData(String sugars, String name, int strength) async {
    return await _brews.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  Stream<QuerySnapshot> get brews {
    return _brews.snapshots();
  }
}
