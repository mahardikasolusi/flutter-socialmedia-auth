import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:sosial_media_auth/models/firebase_user.dart';
import 'package:sosial_media_auth/services/firebase_auth_service.dart';

part 'firebase_auth_event.dart';
part 'firebase_auth_state.dart';

class FirebaseAuthBloc extends Bloc<FirebaseAuthEvent, FirebaseAuthState> {
  final FirebaseAuthService firebaseAuthService;
  final Function deviceToken;
  final String app;

  FirebaseAuthBloc(this.firebaseAuthService, {this.deviceToken, this.app}) : super(FirebaseAuthInitial());


  @override
  FirebaseAuthState get state => FirebaseAuthInitial();

  @override
  Stream<FirebaseAuthState> mapEventToState(FirebaseAuthEvent event) async* {
    if (event is FirebaseAuthSignIn) {
      yield* _authSignIn(event);
    } else if (event is FirebaseAuthSignUp) {
      yield* _authSignUp(event);
    } else if (event is FirebaseAuthSignOut) {
      yield* _authSignOut(event);
    }
  }

  Stream<FirebaseAuthState> _authSignIn(FirebaseAuthSignIn firebaseAuthSignIn) async* {
    // FirebaseAuthLoading : Loading
    yield FirebaseAuthLoading();
    String token;

    try {
      bool isLoginSuccessful = await firebaseAuthService.signIn();
      if (deviceToken != null) {
        token = await deviceToken();
      }
      if (!isLoginSuccessful) {
        yield FirebaseAuthFailure('Google login error');
      } else {
        User firebaseUser = await firebaseAuthService.currentUser();

        if (firebaseUser?.uid == null) {
          await firebaseAuthService.signOut(app: app, token: token);
          yield FirebaseAuthFailure('Unauthorized user');
        }

        yield FirebaseAuthSuccess(firebaseUser);
      }
    } catch(e) {
      yield FirebaseAuthFailure(e.toString());
    }
  }

  Stream<FirebaseAuthState> _authSignUp(FirebaseAuthSignUp firebaseAuthSignUp) async* {
    try {
      User firebaseUser = await firebaseAuthService.currentUser();
      if (deviceToken != null) {
        String token = await deviceToken();
        await firebaseAuthService.signOut(token: token, id: firebaseUser.uid, app: app);
      } else {
        await firebaseAuthService.signOut();
      }

      //yield FirebaseAuthSuccess(firebaseUser);
    } catch (e, s) {
      yield FirebaseAuthFailure(e.toString());
    }
  }

  Stream<FirebaseAuthState> _authSignOut(FirebaseAuthSignOut firebaseAuthSignOut) async* {

  }
}
