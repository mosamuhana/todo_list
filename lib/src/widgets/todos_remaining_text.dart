import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers.dart';

class TodosRemainingText extends ConsumerWidget {
  const TodosRemainingText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log('### TodoRemainingCountText build');
    final remaining = ref.watch(uncompletedTodosCount);
    return Text(
      '$remaining items left',
      overflow: TextOverflow.ellipsis,
    );
  }
}
