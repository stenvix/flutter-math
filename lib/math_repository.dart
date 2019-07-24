import 'dart:math';

class MathRepository {
  Future<double> calculateLeg(String value) {
    return Future.delayed(Duration(seconds: 1), () {
      var intLeg = double.parse(value);
      var leg = intLeg * intLeg;
      return leg;
    });
  }

  Future<double> calculateHypotenuse(double firstLeg, double secondLeg) {
    return Future.delayed(Duration(seconds: 1), () {
      var hypotenuse = sqrt(firstLeg + secondLeg);
      return hypotenuse;
    });
  }
}
