import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../try_questions/try_questions.dart';

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseP = ref.watch(baseProvider);

    return Drawer(
      width: MediaQuery.of(context).size.width * 0.55,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('機能一覧'),
          ),
          ListTile(
            title: const Text('過去問'),
            onTap: () {
              baseP.drawerScreenChange(0);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('掲示板'),
            onTap: () {
              baseP.drawerScreenChange(1);
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
