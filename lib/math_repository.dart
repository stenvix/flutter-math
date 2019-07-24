import 'dart:math';

abstract class MathRepository {
  static Future<double> calculateLeg(String value) {
    return Future.delayed(Duration(seconds: 1), () {
      final double intLeg = double.tryParse(value) ?? 0;
      final double leg = intLeg * intLeg;
      return leg;
    });
  }

  static Future<double> calculateHypotenuse(double firstLeg, double secondLeg) {
    return Future.delayed(Duration(seconds: 1), () => sqrt(firstLeg + secondLeg) );
  }
}
