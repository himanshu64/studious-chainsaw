import 'package:flutter/material.dart';
import 'package:flutter_application_1/viewmodels/game_model.dart';
import 'package:provider/provider.dart';

class FailureCard extends StatelessWidget {
  const FailureCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Failure! ${Provider.of<GameModel>(context).failureMessage}',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}