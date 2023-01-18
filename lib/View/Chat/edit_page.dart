import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditPage extends ConsumerStatefulWidget {
  const EditPage({super.key});

  @override
  ConsumerState<EditPage> createState() => EditPageState();
}

class EditPageState extends ConsumerState<EditPage> {
  final TextEditingController _targetTextController = TextEditingController();

  @override
  Widget build(context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: TextField(
          keyboardType: TextInputType.multiline,
          maxLines: null,
          controller: _targetTextController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'ここに入力',
            alignLabelWithHint: true,
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                _targetTextController.clear();
              },
            ),
          ),
          autofocus: true,
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        elevation: 7.0,
        onPressed: null,
        child: Text('投稿'),
      ),
    );
  }
}
