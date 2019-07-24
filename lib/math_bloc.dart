import 'package:bloc/bloc.dart';
import 'package:flutter_math/math_event.dart';
import 'package:flutter_math/math_repository.dart';
import 'package:flutter_math/math_state.dart';

class MathBloc extends Bloc<MathEvent, MathState> {
  /*
  double firstLeg = 0;
  double secondLeg = 0;
  double hypotenuse = 0;
  */

  //final MathRepository _repository = MathRepository();

  @override
  get initialState => InitialMathState();

  Stream<FirstLegMathState> get firstLegState => this
      .state
      .where((state) => state is FirstLegMathState)
      .cast<FirstLegMathState>();
  Stream<SecondLegMathState> get secondLegState => this
      .state
      .where((state) => state is SecondLegMathState)
      .cast<SecondLegMathState>();
  Stream<HypotenuseMathState> get hypotenuseState => this
      .state
      .where((state) => state is HypotenuseMathState)
      .cast<HypotenuseMathState>();

  @override
  Stream<MathState> mapEventToState(MathEvent event) async* {
    if (event is CalculateHypotenuse) {
      yield* _calculateHypotenuse(firstLegText: event.firstLeg, secondLegText: event.secondLeg,);
    }
  }

  Stream<MathState> _calculateHypotenuse({String firstLegText, String secondLegText}) async* {
    final double firstLeg = await MathRepository.calculateLeg(firstLegText);
    yield FirstLegMathState(leg: firstLeg);

    final double secondLeg = await MathRepository.calculateLeg(secondLegText);
    yield SecondLegMathState(leg: secondLeg);

    final double hypotenuse = await MathRepository.calculateHypotenuse(firstLeg, secondLeg);
    yield HypotenuseMathState(hypotenuse: hypotenuse);
  }

}
