import 'package:flutter/material.dart';

class CardDasTarefas extends StatelessWidget {
  const CardDasTarefas({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            color: Colors.white,
            width: 400,
            height: 100,
          ),
        )
      ],
    );
  }
}
