import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:past_questions/View/Chat/login_page.dart';

import '../try_questions/try_questions.dart';



class CustomFloatButton extends ConsumerWidget {
  const CustomFloatButton({super.key});

  

  @override
  Widget build(context, ref) {
    final User? user =  FirebaseAuth.instance.currentUser;
    debugPrint(user == null ? 'not signed' : 'is signed');
    final baseP = ref.watch(baseProvider);
    final drawerScreenManager = baseP.model.drawerScreenManager;
    final isEdit = baseP.model.isEdit;

    return (drawerScreenManager == 1 && !isEdit)
        ? FloatingActionButton(
            elevation: 7.0, // Add this line
            onPressed: ()async{
              if(user == null){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)
                  => const LoginPage(),
                  ),
                );
              }else{
                baseP.editStateChange(true);
              }
              
            },
            child: const Icon(Icons.add),
          )
        : const SizedBox.shrink();
  }
}
