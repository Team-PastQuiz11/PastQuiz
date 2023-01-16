import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase_options.dart';
import 'View/sign_in/sign_in_page.dart';
import 'view/router/drawer_router.dart';

bool _isUseFirebase = false;
bool _isUseSignIn = false;

Future<void> main() async {
  if (_isUseFirebase) {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.android,
    );
  }
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    if (_isUseSignIn) {
      return const MaterialApp(
        /// false にすることで画面右上の debug 文字を消すことができる
        debugShowCheckedModeBanner: false,
        home: DrawerRouter(),
      );
    } else {
      return const MaterialApp(
        /// false にすることで画面右上の debug 文字を消すことができる
        debugShowCheckedModeBanner: false,
        home: DrawerRouter(),
      );
    }
  }
}
