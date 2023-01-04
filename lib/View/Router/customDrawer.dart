import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:past_questions/View/tryquestions/tryquestions.dart';

class CustomDrawer extends ConsumerWidget{

  const CustomDrawer({
    Key? key
  }):super(
    key: key
  );

  @override
  Widget build(context,ref){
    final baseP = ref.watch(baseProvider);

    return Drawer(
        width: MediaQuery.of(context).size.width * 0.55,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text("機能一覧"),
              decoration: BoxDecoration(
                color: Colors.blue
              ),
            ),
            ListTile(
              title: Text("過去問"),
              onTap: () {
                baseP.drawerScreenChange(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("掲示板"),
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