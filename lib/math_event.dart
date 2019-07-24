import 'package:equatable/equatable.dart';

abstract class MathEvent extends Equatable {
  MathEvent([List props = const []]) : super(props);
}

class FirstLegCalculated extends MathEvent {
  final double leg;

  FirstLegCalculated({this.leg}) : super([leg]);
}

class SecondLegCalculated extends MathEvent {
  final double leg;

  SecondLegCalculated({this.leg}) : super([leg]);
}

class HypotenuseCalculated extends MathEvent {
  final double hypotenuse;

  HypotenuseCalculated({this.hypotenuse}) : super([hypotenuse]);
}
