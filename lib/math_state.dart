class MathState{
  final firstLeg;
  final secondLeg;
  final hypotenuse;

  MathState({this.firstLeg, this.secondLeg, this.hypotenuse});

  static MathState initial() => MathState(firstLeg: 0, secondLeg: 0, hypotenuse: 0);
}
