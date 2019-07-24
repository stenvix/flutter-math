import 'package:bloc/bloc.dart';
import 'package:flutter_math/math_event.dart';
import 'package:flutter_math/math_state.dart';

class MathBloc extends Bloc<MathEvent, MathState> {
  double firstLeg = 0;
  double secondLeg = 0;
  double hypotenuse = 0;

  @override
  get initialState => MathState.initial();

  @override
  Stream<MathState> mapEventToState(MathEvent event) async* {
    if (event is FirstLegCalculated) {
      firstLeg = event.leg;
    }

    if (event is SecondLegCalculated) {
      secondLeg = event.leg;
    }
    if (event is HypotenuseCalculated) {
      hypotenuse = event.hypotenuse;
    }

    yield MathState(
        firstLeg: firstLeg, secondLeg: secondLeg, hypotenuse: hypotenuse);
  }
}
