import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:past_questions/View/try_questions/try_questions.dart';

class CustomFloatButton extends ConsumerWidget {
  const CustomFloatButton({super.key});

  @override
  Widget build(context, ref) {
    final baseP = ref.watch(baseProvider);
    final drawerScreenManager = baseP.model.drawerScreenManager;
    final isEdit = baseP.model.isEdit;

    return (drawerScreenManager == 1 && !isEdit)
        ? FloatingActionButton(
            elevation: 7.0, // Add this line
            onPressed: () {
              baseP.editStateChange(true);
            },
            child: const Icon(Icons.add),
          )
        : const SizedBox.shrink();
  }
}
