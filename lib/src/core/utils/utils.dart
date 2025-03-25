
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';

class FirebaseServices {
  final _auth = FirebaseAuth.instance;

  Future<User?> signInWithEmail(String email, String password) async {
    
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(" successful");
      return credential.user;
    } on FirebaseAuthException catch (e) {
      print("error: ${e.message}");
      return null;
    }
  }

  Future<User?> registerWithEmailAndPassword({
    required String username,
    required String email,
    required String password,
    required List<String> preferences,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
        'username': username,
        'email': email,
        'password': password,
        'preferences': preferences,
      });

      final user = userCredential.user;

      return user;
    } catch (e) {
      print("Registration Error: ${e.toString()}");
    }
    return null;
  }
}



class LocationService {
  // final Geolocator _geolocator = Geolocator();

  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition();
  }
}