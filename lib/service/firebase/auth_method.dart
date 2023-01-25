import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn(
  clientId: '638123334577-68g1papk310vd093r57ptjsl5nk11sbf.apps.googleusercontent.com',
);

Future<UserCredential> signInWithGoogle() async{

    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final UserCredential authResult = await _auth.signInWithCredential(credential);
    final User? user = authResult.user;
    assert(user != null,'user is null');
    assert(await user?.getIdToken() != null,'user-idToken is null');
    return authResult;
}