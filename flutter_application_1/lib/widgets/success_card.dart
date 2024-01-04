import 'package:flutter/material.dart';
import 'package:flutter_application_1/viewmodels/game_model.dart';
import 'package:provider/provider.dart';

class SuccessCard extends StatelessWidget {
  const SuccessCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Success! Score: ${Provider.of<GameModel>(context).score}',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}