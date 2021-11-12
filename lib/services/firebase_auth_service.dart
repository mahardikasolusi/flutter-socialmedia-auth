import 'package:firebase_auth/firebase_auth.dart';
import 'package:sosial_media_auth/models/firebase_user.dart';

abstract class FirebaseAuthService  {
  /// The OAuth2 access token to access Google services.
  Future<String> signIn();

  Future<bool> signOut({String token, String id, String app});

  Future<String> signUp(String email, String password);

  Future<bool> isUserLogin();

  Future<User> currentUser();

  Future<FirebaseUser> findUser(String email);
}