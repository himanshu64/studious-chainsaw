import 'package:flutter/material.dart';
import 'package:flutter_application_1/viewmodels/game_model.dart';
import 'package:provider/provider.dart';

class CircularTimer extends StatelessWidget {
  const CircularTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: CircularProgressIndicator(
            value: Provider.of<GameModel>(context).timerSeconds / 5,
            strokeWidth: 10,
            backgroundColor: Colors.grey,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        )
      ],
    );
  }
}
