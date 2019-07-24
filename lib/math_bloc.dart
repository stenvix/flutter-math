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

  get firstLegState => this
      .state
      .where((state) => state is FirstLegMathState)
      .cast<FirstLegMathState>();
  get secondLegState => this
      .state
      .where((state) => state is SecondLegMathState)
      .cast<SecondLegMathState>();
  get hypotenuseState => this
      .state
      .where((state) => state is HypotenuseMathState)
      .cast<HypotenuseMathState>();

  @override
  Stream<MathState> mapEventToState(MathEvent event) async* {
    if (event is CalculateHypotenuse) {
      var firstLeg = await repository.calculateLeg(event.firstLeg);
      yield FirstLegMathState(firstLeg: firstLeg);

      var secondLeg = await repository.calculateLeg(event.secondLeg);
      yield SecondLegMathState(
          firstLeg: currentState.firstLeg, secondLeg: secondLeg);

      var hypotenuse = await repository.calculateHypotenuse(
          currentState.firstLeg, currentState.secondLeg);
      yield HypotenuseMathState(
          firstLeg: currentState.firstLeg,
          secondLeg: currentState.secondLeg,
          hypotenuse: hypotenuse);
    }
  }
}
