part of 'firebase_auth_bloc.dart';

abstract class FirebaseAuthState extends Equatable {
  const FirebaseAuthState();
}

class FirebaseAuthLoading extends FirebaseAuthState {
  @override
  List<Object> get props => [];
}

class FirebaseAuthInitial extends FirebaseAuthState {
  @override
  List<Object> get props => [];
}

class FirebaseAuthSuccess extends FirebaseAuthState {
  final User firebaseUser;
  final String accessToken;

  FirebaseAuthSuccess(this.firebaseUser, this.accessToken);

  @override
  List<Object> get props => [];
}

class FirebaseAuthFailure extends FirebaseAuthState {
  final String message;

  FirebaseAuthFailure(this.message);

  @override
  List<Object> get props => [];
}