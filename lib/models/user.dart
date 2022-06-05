import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;

  final String username;

  const User({
    this.email,
    this.uid,
    this.username,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'email': email,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      username: snapshot['username'],
      uid: snapshot['uid'],
      email: snapshot['email'],
    );
  }
}
