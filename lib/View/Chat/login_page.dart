import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:past_questions/service/firebase/auth_method.dart';

class LoginPage extends ConsumerWidget{

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref){
    // final baseP = ref.watch(baseProvider);
    

    return Scaffold(
      body:Center(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SignInButton(
        Buttons.Google,
        onPressed: ()async{
          await signInWithGoogle(
            navigate: (){
              // Navigator.pop(context);
            },
          );
        }, 
        
        ),
        ],
        ), 
    ),);
  }
  
}