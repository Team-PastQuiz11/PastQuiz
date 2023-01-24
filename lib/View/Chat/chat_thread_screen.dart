import 'package:flutter/material.dart';
import '../../view/router/appbar/custom_appbar.dart';

class ChatThreadScreen extends StatefulWidget {
  const ChatThreadScreen({Key? key}) : super(key: key);

  @override
  State<ChatThreadScreen> createState() => _ChatThreadScreenState();
}

class _ChatThreadScreenState extends State<ChatThreadScreen> {
  @override
  Widget build(context) {
    return Scaffold(
        appBar: const CustomAppbar(),
        body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                for (var i = 0; i < 100; i++) ...[
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 7),
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey)),
                    ),
                    child: ListTile(
                      title: const Text('タイトル'),
                      subtitle: const Text('サブタイトル'),
                      onTap: () {},
                    ),
                  ),
                ],
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                const Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                    ),
                    maxLines: 10,
                    minLines: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text('投稿'),
                  ),
                )
              ],
            ),
          ),
        ],
      )
    );
  }
}
