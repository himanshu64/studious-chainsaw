import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/success_failure_card.dart';
import 'package:flutter_application_1/widgets/time_load_widget.dart';
import 'package:flutter_application_1/viewmodels/game_model.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text("Current Second"),
                      Text(' ${Provider.of<GameModel>(context).timerSeconds}')
                    ],
                  ),
                  Column(
                    children: [
                      const Text("Random Number"),
                      Text(
                          ' ${Provider.of<GameModel>(context).randomNumber}')
                    ],
                  )
                ],
              ),
            ),
            Text(
                ' Score ${Provider.of<GameModel>(context).score} / Attempts ${Provider.of<GameModel>(context).attempts}'),
            const SizedBox(
              height: 20.0,
            ),
            SuccessFailureCard(),
            const SizedBox(
              height: 20.0,
            ),
            const CircularTimer(),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<GameModel>(context, listen: false).onTap();
              },
              child: const Text('Click'),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
