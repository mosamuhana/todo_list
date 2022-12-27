import 'dart:developer';

import 'package:flutter/material.dart';

class TodosTitle extends StatelessWidget {
  const TodosTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('### TodoTitle build');
    return const Text(
      'TODOS',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color.fromARGB(38, 47, 47, 247),
        fontSize: 60,
        fontWeight: FontWeight.w900,
        //fontFamily: 'Helvetica Neue',
      ),
    );
  }
}
