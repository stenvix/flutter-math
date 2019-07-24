import 'package:equatable/equatable.dart';

abstract class MathState extends Equatable {
  final firstLeg;
  final secondLeg;
  final hypotenuse;

  MathState({this.firstLeg, this.secondLeg, this.hypotenuse})
      : super([firstLeg, secondLeg, hypotenuse]);
}

class InitialMathState extends MathState {
  InitialMathState() : super(firstLeg: 0, secondLeg: 0, hypotenuse: 0);
}

class FirstLegMathState extends MathState {
  FirstLegMathState({firstLeg}) : super(firstLeg: firstLeg);
}

class SecondLegMathState extends MathState {
  SecondLegMathState({double firstLeg, double secondLeg})
      : super(firstLeg: firstLeg, secondLeg: secondLeg);
}

class HypotenuseMathState extends MathState {
  HypotenuseMathState({firstLeg, secondLeg, hypotenuse})
      : super(firstLeg: firstLeg, secondLeg: secondLeg, hypotenuse: hypotenuse);
}