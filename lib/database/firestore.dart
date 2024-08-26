import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStoreDatabase {
  User? user = FirebaseAuth.instance.currentUser;

  final CollectionReference posts =
      FirebaseFirestore.instance.collection('Posts');

  Future<void> addPost(String message) async {
    await posts.add({
      'userEmail': user!.email,
      'postMessage': message,
      'timeStamp': DateTime.now(),
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getPostStream() {
    final postStream = FirebaseFirestore.instance
        .collection('Posts')
        .orderBy('timeStamp', descending: true)
        .snapshots();
    return postStream;
  }
}
