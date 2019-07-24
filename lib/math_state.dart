import 'package:equatable/equatable.dart';

abstract class MathState extends Equatable {
  /*
  final firstLeg;
  final secondLeg;
  final hypotenuse;

  MathState({this.firstLeg, this.secondLeg, this.hypotenuse})
      : super([firstLeg, secondLeg, hypotenuse]);
  */
}

class InitialMathState extends MathState {
  //InitialMathState() : super(firstLeg: 0, secondLeg: 0, hypotenuse: 0);
}

class FirstLegMathState extends MathState {
  final double _leg;
  double get leg => this._leg;
  FirstLegMathState({double leg})
    : assert(leg is double && leg > 0)
    , this._leg = leg;
  //FirstLegMathState({firstLeg}) : super(firstLeg: firstLeg);
}

class SecondLegMathState extends MathState {
  final double _leg;
  double get leg => this._leg;
  SecondLegMathState({double leg})
    : assert(leg is double && leg > 0)
    , this._leg = leg;
  /*
  SecondLegMathState({double firstLeg, double secondLeg})
      : super(firstLeg: firstLeg, secondLeg: secondLeg);
  */
}

class HypotenuseMathState extends MathState {
  final double _hypotenuse;
  double get hypotenuse => this._hypotenuse;
  HypotenuseMathState({double hypotenuse})
    : assert(hypotenuse is double && hypotenuse > 0)
    , this._hypotenuse = hypotenuse;
  /*
  HypotenuseMathState({firstLeg, secondLeg, hypotenuse})
      : super(firstLeg: firstLeg, secondLeg: secondLeg, hypotenuse: hypotenuse);
  */
}