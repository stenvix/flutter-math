//import 'dart:math';

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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 25),
              Text("Длина катета №1"),
              SizedBox(height: 5),
              TextField(
                controller: firstLegController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
              Text("Длина катета №2"),
              SizedBox(height: 5),
              TextField(
                controller: secondLegController,
                keyboardType: TextInputType.number,
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
              StreamBuilder(
                stream: bloc.firstLegState,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                        "Квадрат катета №1:  ${snapshot.data.leg}");
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
              // buildFirstLeg(state),
              SizedBox(
                height: 5,
              ),
              StreamBuilder(
                stream: bloc.secondLegState,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                        "Квадрат катета №2:  ${snapshot.data.leg}");
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
              // buildSecondLeg(state),
              SizedBox(
                height: 5,
              ),
              StreamBuilder(
                stream: bloc.hypotenuseState,
                builder: (context, snapshot) {
                  if (snapshot.hasData &&
                      snapshot.data is HypotenuseMathState) {
                    return Text("Гипотенуза: ${snapshot.data.hypotenuse}");
                  } else {
                    return SizedBox.shrink();
                  }
                },
              )
              // buildHypotenuse(state)
            ],
          ),
        ));
  }
}
