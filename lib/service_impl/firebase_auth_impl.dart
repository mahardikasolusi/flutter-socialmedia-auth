import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sosial_media_auth/models/firebase_user.dart';
import 'package:sosial_media_auth/services/firebase_auth_service.dart';

class FirebaseAuthImpl extends FirebaseAuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final String baseUrl;

  FirebaseApp app;
  FirebaseAuth _firebaseAuth;
  FirebaseFirestore fs;

  Future<void> initializeFirebaseApp() async {
    app = await Firebase.initializeApp();
    _firebaseAuth = FirebaseAuth.instanceFor(app: app);
    fs = FirebaseFirestore.instance;
  }

  FirebaseAuthImpl({@required this.baseUrl}) {
    initializeFirebaseApp();
  }

  @override
  Future<User> currentUser() async {
    // TODO: implement currentUser
    throw UnimplementedError();
  }

  @override
  Future<bool> isUserLogin() {
    // TODO: implement isUserLogin
    throw UnimplementedError();
  }

  @override
  Future<String> signIn() async {
    /*try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      print('Google user:');
      print(googleUser?.email);

      if (googleUser == null) {
        return false;
      }
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      print('Google auth:');
      print(googleAuth.accessToken);
      print(googleAuth.idToken);

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      print('Credential:');
      print(credential.providerId);

      final UserCredential userCredential = await _firebaseAuth.signInWithCredential(
        credential,
      );

      if (userCredential?.user != null) {
        FirebaseUser firebaseUser = await this.currentUser();

        await FirebaseAuth.instance.signInWithCredential(credential);
        print("this is user ${firebaseUser}");
      }

      return userCredential?.user != null;
    } catch (e, s) {
      print('loginWithGoogle error: $e, $s');
      return Future.error(e);
    }*/
  }

  @override
  Future<bool> signOut({String token, String id, String app}) {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<String> signUp(String email, String password) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future<FirebaseUser> findUser(String email) {

  }

}