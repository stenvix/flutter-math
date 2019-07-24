import 'package:equatable/equatable.dart';

abstract class MathEvent extends Equatable {
  MathEvent([List props = const []]) : super(props);
}

class CalculateHypotenuse extends MathEvent {
  final String firstLeg;
  final String secondLeg;

  CalculateHypotenuse({this.firstLeg, this.secondLeg});
}