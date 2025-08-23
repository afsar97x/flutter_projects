import 'package:flutter/material.dart';
import 'package:basics/dice_roller.dart';
// import 'package:basics/styled_text.dart';

//const vs final
// const is compile-time constant, final is runtime constant
// const is more restrictive than final
const startAlignment = Alignment.topLeft;
// can also be:
// Alignment? topLeft = Alignment.topLeft;
// Alignment? topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({required this.gradientColors, super.key});
  // or const GradientContainer({ key}) : super(key: key);
  final List<Color> gradientColors; //list can be edited even if it's final

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: startAlignment,
          end: endAlignment,
          // begin: Alignment.topLeft,
          // end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: DiceRoller(),
      ),
    );
  }
}
