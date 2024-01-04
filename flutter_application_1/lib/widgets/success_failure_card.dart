import 'package:flutter/material.dart';
import 'package:flutter_application_1/viewmodels/game_model.dart';
import 'package:flutter_application_1/widgets/failure_card.dart';
import 'package:flutter_application_1/widgets/success_card.dart';
import 'package:provider/provider.dart';

class SuccessFailureCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GameModel timerModel = Provider.of<GameModel>(context);

    if (timerModel.isSuccess) {
      return SuccessCard();
    } else if (timerModel.isFailure) {
      return FailureCard();
    } else {
      return const SizedBox.shrink(); // No card displayed if not in success or failure state
    }
  }
}