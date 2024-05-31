import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Auth {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Auth(this._firebaseAuth);

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    print(currentUser);

    // Check if it's the first login
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user = _firebaseAuth.currentUser;
    if (user != null) {
      DocumentReference userDoc =
          FirebaseFirestore.instance.collection("users").doc(user.uid);
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await userDoc.get() as DocumentSnapshot<Map<String, dynamic>>;

      if (!snapshot.exists) {
        // It's the first login, create the user document
        DateTime now = DateTime.now();
        await userDoc.set({
          'firstLoginDate': now,
          'email': email,
        });
      } else {
        // The user document exists, check if 'firstLoginDate' field is present
        Map<String, dynamic> data = snapshot.data()!;
        if (!data.containsKey('firstLoginDate')) {
          // 'firstLoginDate' field is not present, add it
          DateTime now = DateTime.now();
          await userDoc.set({
            'firstLoginDate': now,
          }, SetOptions(merge: true));
        }
      }
    }
  }

  Future<void> resetPassword({
    required String email,
  }) async {
    await _firebaseAuth.sendPasswordResetEmail(
      email: email,
    );
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
