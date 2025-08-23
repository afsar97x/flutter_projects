import 'package:flutter/material.dart';
import 'dart:math';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key}); //we can use const here
  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var activeDiceRoll = 2;
  void rollDice() {
    setState(() {
      // setState is used to update the UI when the state changes. (){} refers to an anonymous function.
      var diceRoll =
          randomizer.nextInt(6) +
          1; // generates a random number between 1 and 6
      activeDiceRoll = diceRoll;
      print('Button pressed!');
    });

    // activeDice =
    //     'assets/images/dice-${(1 + (6 * (new DateTime.now().millisecondsSinceEpoch % 1000) / 1000)).floor()}.png';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/dice-$activeDiceRoll.png',
          width: 200,
        ),
        const SizedBox(
          // adds space between widgets, even if child is null.
          height: 20,
        ),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            // padding: const EdgeInsets.only(top: 20),
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 24),
          ),
          child: const Text("Roll Dice"),
        ),
      ],
    );
  }
}
