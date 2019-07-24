import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_math/math_bloc.dart';
import 'package:flutter_math/math_event.dart';
import 'package:flutter_math/math_state.dart';

class MathPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MathPageState();
}

class _MathPageState extends State<MathPage> {
  final TextEditingController firstLegController = TextEditingController();
  final TextEditingController secondLegController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final MathBloc bloc = BlocProvider.of<MathBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Math BLoC"),
        ),
        body: BlocBuilder<MathBloc, MathState>(
          builder: (BuildContext context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 25),
                  Text("Длина катета №1"),
                  SizedBox(height: 5),
                  TextField(
                    controller: firstLegController,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  SizedBox(height: 20),
                  Text("Длина катета №2"),
                  SizedBox(height: 5),
                  TextField(
                    controller: secondLegController,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  RaisedButton(
                    child: Text("Посчитать гипотенузу"),
                    onPressed: () {
                      calculateFirstLeg(bloc)
                          .then((_) => calculateSecondLeg(bloc))
                          .then((_) => calculateHypotenuse(bloc));
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text("Результаты"),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Квадрат катета №1:  ${state.firstLeg}"),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Квадрат катета №2:  ${state.secondLeg}"),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Гипотенуза: ${state.hypotenuse}"),
                ],
              ),
            );
          },
        ));
  }

  Future calculateFirstLeg(MathBloc bloc) {
    return Future.delayed(Duration(seconds: 1), () {
      var intLeg = double.parse(firstLegController.text);
      var leg = intLeg * intLeg;
      bloc.dispatch(FirstLegCalculated(leg: leg));
    });
  }

  Future calculateSecondLeg(MathBloc bloc) {
    return Future.delayed(Duration(seconds: 1), () {
      var intLeg = double.parse(secondLegController.text);
      var leg = intLeg * intLeg;
      bloc.dispatch(SecondLegCalculated(leg: leg));
    });
  }

  Future calculateHypotenuse(MathBloc bloc) {
    return Future.delayed(Duration(seconds: 1), () {
      var hypotenuse = sqrt(bloc.firstLeg + bloc.secondLeg);
      bloc.dispatch(HypotenuseCalculated(hypotenuse: hypotenuse));
    });
  }
}
