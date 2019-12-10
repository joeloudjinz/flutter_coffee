import 'package:brew_crew/models/brew.dart';
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

  List<Brew> _createBrewsListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Brew(
        name: doc.data['name'] ?? '',
        sugars: doc.data['sugars'] ?? '0',
        strength: doc.data['strength'] ?? 100,
      );
    }).toList();
  }

  Stream<List<Brew>> get brews {
    return _brews.snapshots().map(_createBrewsListFromSnapshot);
  }
}
