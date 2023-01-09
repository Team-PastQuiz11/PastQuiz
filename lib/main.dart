import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'view/router/drawer_router.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return const MaterialApp(
      /// false にすることで画面右上の debug 文字を消すことができる
      debugShowCheckedModeBanner: false,
      home: DrawerRouter(),
    );
  }
}
