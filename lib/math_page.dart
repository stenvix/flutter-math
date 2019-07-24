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
        body: StreamBuilder(
          stream: bloc.state,
          builder: (context, state) {
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
                      bloc.dispatch(CalculateHypotenuse(
                          firstLeg: firstLegController.text,
                          secondLeg: secondLegController.text));
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text("Результаты"),
                  SizedBox(
                    height: 5,
                  ),
                  buildFirstLeg(state),
                  SizedBox(
                    height: 5,
                  ),
                  buildSecondLeg(state),
                  SizedBox(
                    height: 5,
                  ),
                  buildHypotenuse(state)
                ],
              ),
            );
          },
        ));
  }

  Widget buildFirstLeg(AsyncSnapshot<MathState> snapshot) {
    if (snapshot.hasData && !(snapshot.data is InitialMathState)) {
      return Text("Квадрат катета №1:  ${snapshot.data.firstLeg}");
    } else {
      return SizedBox.shrink();
    }
  }

  Widget buildSecondLeg(AsyncSnapshot<MathState> snapshot) {
    if (snapshot.hasData &&
        !(snapshot.data is InitialMathState ||
            snapshot.data is FirstLegMathState)) {
      return Text("Квадрат катета №2:  ${snapshot.data.secondLeg}");
    } else {
      return SizedBox.shrink();
    }
  }

  Widget buildHypotenuse(AsyncSnapshot<MathState> snapshot) {
    if (snapshot.hasData && snapshot.data is HypotenuseMathState) {
      return Text("Гипотенуза: ${snapshot.data.hypotenuse}");
    } else {
      return SizedBox.shrink();
    }
  }
}
