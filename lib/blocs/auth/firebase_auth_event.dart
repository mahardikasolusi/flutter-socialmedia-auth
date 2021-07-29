part of 'firebase_auth_bloc.dart';

abstract class FirebaseAuthEvent extends Equatable {
  const FirebaseAuthEvent();
}

class FirebaseAuthSignIn extends FirebaseAuthEvent {
  @override
  List<Object> get props => [];
}

class FirebaseAuthSignUp extends FirebaseAuthEvent {
  final String email;
  final String password;

  FirebaseAuthSignUp({
    @required this.email,
    @required this.password
  });

  @override
  List<Object> get props => [email, password];
}

class FirebaseAuthSignOut extends FirebaseAuthEvent {
  @override
  List<Object> get props => [];
}