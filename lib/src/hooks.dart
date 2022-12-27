import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

bool useIsFocused(FocusNode node) {
  final isFocused = useState(node.hasFocus);

  useEffect(
    () {
      void listener() => isFocused.value = node.hasFocus;
      node.addListener(listener);
      return () => node.removeListener(listener);
    },
    [node],
  );

  return isFocused.value;
}

void useSelectAll(FocusNode node, TextEditingController controller) {
  useEffect(
    () {
      void listener() {
        if (node.hasFocus) {
          controller.selection = TextSelection(
            baseOffset: 0,
            extentOffset: controller.text.length,
          );
        }
      }

      node.addListener(listener);
      return () => node.removeListener(listener);
    },
    [node],
  );
}
