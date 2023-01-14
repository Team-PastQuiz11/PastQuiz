import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../try_questions/try_questions.dart';
import 'edit_page.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() => ChatScreenState();
}

class ChatScreenState extends ConsumerState<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final baseP = ref.watch(baseProvider);
    final isEdit = baseP.model.isEdit;

    return !isEdit
        ? ListView(
            children: [
              for (var i = 0; i < 10; i++) ...[
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
              ]
            ],
          )
        : const EditPage();
  }
}
