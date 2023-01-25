// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
// / await Firebase.initializeApp(
// /   options: DefaultFirebaseOptions.currentPlatform,
// / );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBOLBYurIugPTL7sgvxewjv3BcnZgYLasQ',
    appId: '1:74471463077:web:d38f908bb14f582e14554c',
    messagingSenderId: '74471463077',
    projectId: 'pastquiz-66896',
    authDomain: 'pastquiz-66896.firebaseapp.com',
    storageBucket: 'pastquiz-66896.appspot.com',
    measurementId: 'G-S7Z32L8YVJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDcck7n4LwkQGTpijx98Cw6dytWJDVdiUU',
    appId: '1:74471463077:android:3a1bbaf40241415314554c',
    messagingSenderId: '74471463077',
    projectId: 'pastquiz-66896',
    storageBucket: 'pastquiz-66896.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDOAn-3U0imiIdDNuQhUNU1ZApVgmP5qc8',
    appId: '1:74471463077:ios:ec55fb19f323eb2b14554c',
    messagingSenderId: '74471463077',
    projectId: 'pastquiz-66896',
    storageBucket: 'pastquiz-66896.appspot.com',
    iosClientId:
        '74471463077-4n4lb15gc768gj0blmmms50ik31lck4b.apps.googleusercontent.com',
    iosBundleId: 'com.example.pastQuestions',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDOAn-3U0imiIdDNuQhUNU1ZApVgmP5qc8',
    appId: '1:74471463077:ios:ec55fb19f323eb2b14554c',
    messagingSenderId: '74471463077',
    projectId: 'pastquiz-66896',
    storageBucket: 'pastquiz-66896.appspot.com',
    iosClientId:
        '74471463077-4n4lb15gc768gj0blmmms50ik31lck4b.apps.googleusercontent.com',
    iosBundleId: 'com.example.pastQuestions',
  );
}