import 'package:bloc/bloc.dart';
import 'package:flutter_math/math_event.dart';
import 'package:flutter_math/math_repository.dart';
import 'package:flutter_math/math_state.dart';

class MathBloc extends Bloc<MathEvent, MathState> {
  double firstLeg = 0;
  double secondLeg = 0;
  double hypotenuse = 0;

  MathRepository repository = MathRepository();

  @override
  get initialState => InitialMathState();

  @override
  Stream<MathState> mapEventToState(MathEvent event) async* {
    if (event is CalculateHypotenuse) {
      if (currentState is InitialMathState|| currentState is HypotenuseMathState) {
        var leg = await repository.calculateLeg(event.firstLeg);
        yield FirstLegMathState(firstLeg: leg);
      }
      if (currentState is FirstLegMathState) {
        var leg = await repository.calculateLeg(event.secondLeg);
        yield SecondLegMathState(
            firstLeg: currentState.firstLeg, secondLeg: leg);
      }
      if (currentState is SecondLegMathState) {
        var hypotenuse = await repository.calculateHypotenuse(
            currentState.firstLeg, currentState.secondLeg);
        yield HypotenuseMathState(
            firstLeg: currentState.firstLeg,
            secondLeg: currentState.secondLeg,
            hypotenuse: hypotenuse);
      }
    }
  }
}
