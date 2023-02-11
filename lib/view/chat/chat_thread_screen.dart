// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../router/appbar/custom_appbar.dart';

// class ChatThreadScreen extends StatefulWidget {
//   const ChatThreadScreen({super.key});

//   @override
//   State<ChatThreadScreen> createState() => _ChatThreadScreenState();
// }

// class _ChatThreadScreenState extends State<ChatThreadScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CustomAppbar(),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView(
//               children: [
//                 for (var i = 0; i < 100; i++) ...[
//                   Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 7),
//                     decoration: const BoxDecoration(
//                       border: Border(bottom: BorderSide(color: Colors.grey)),
//                     ),
//                     child: ListTile(
//                       title: const Text('タイトル'),
//                       subtitle: const Text('サブタイトル'),
//                       onTap: () {},
//                     ),
//                   ),
//                 ],
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(20),
//             child: Row(
//               children: [
//                 const Flexible(
//                   child: TextField(
//                     decoration: InputDecoration(
//                       enabledBorder: OutlineInputBorder(),
//                       focusedBorder: OutlineInputBorder(),
//                     ),
//                     maxLines: 10,
//                     minLines: 1,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10),
//                   child: OutlinedButton(
//                     onPressed: () {},
//                     child: const Text('投稿'),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// ↓↓↓↓↓ まだ責務分離をしていない ↓↓↓↓↓

// スレッドタイルのモデル
class ChatTile {
  final User user;
  final String text;

  ChatTile({required this.user, required this.text});
}

class User {
  final String name;
  final String avatar;

  User({required this.name, required this.avatar});
}

// スレッド一覧画面のプロバイダー
final ChatThreadScreenProvider = StateNotifierProvider((ref) => MessagesController());

// ここでスレッド一覧画面の状態管理
class ChatThreadScreenController extends StateNotifier<List<ChatTile>> {
  ChatThreadScreenController() : super([]);

  @override
  // MessagesPageクラスで`state`を参照するためのgetterを定義
  List<ChatTile> get state => super.state;

  void addMessage(ChatTile message) {
    state = [...state, message];
  }
}

// 画面表示本体
class ChatThreadScreen extends ConsumerWidget {
  const ChatThreadScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messagesController = ref.watch(ChatThreadScreenProvider) as ChatThreadScreenController;
    final messages = messagesController.state;

    return Scaffold(
      appBar: const CustomAppbar(),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(message.user.avatar),
            ),
            title: Text(message.user.name),
            subtitle: Text(message.text),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add a message
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
