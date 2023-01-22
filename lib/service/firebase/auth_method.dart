import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn(
  clientId: '74471463077-3a37shro399hpvf6ddn31mmbvkq8n2ad.apps.googleusercontent.com',
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

Future<void> signInWithGoogle({
  required void Function() navigate,
}) async{
  try{
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
    navigate();
  }catch(e){
    debugPrint(e.toString());
    return;
  }
}