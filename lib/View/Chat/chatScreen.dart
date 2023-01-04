import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:past_questions/View/Chat/editPage.dart';
import 'package:past_questions/View/Router/customDrawer.dart';
import 'package:past_questions/View/tryquestions/tryquestions.dart';

class ChatScreen extends ConsumerStatefulWidget{

  @override
  ConsumerState<ChatScreen> createState() => ChatScreenState();
}

class ChatScreenState extends ConsumerState<ChatScreen>{


  @override
  Widget build(context){

    final baseP = ref.watch(baseProvider);
    final isEdit = baseP.model.isEdit;

    return !isEdit ?  ListView(
      children: [
        for(var i=0;i<10;i++)...[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 7),
            child: ListTile(
              title: Text("タイトル"),
              subtitle: Text("サブタイトル"),
              onTap: (){
                
              },
            ),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey))
            ),
          ),
          
        ]
      ],
    ) :
    EditPage()
    ;
  }

  
}