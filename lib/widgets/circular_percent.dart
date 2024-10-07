import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../styles/app_styles.dart';
import '../fake_data/fake_data.dart';

class CircularPercent extends StatefulWidget {
  final SingletonFake fakeData;
  const CircularPercent({super.key, required this.fakeData});

  @override
  State<CircularPercent> createState() => _CircularPercentState();
}

class _CircularPercentState extends State<CircularPercent> {
  bool _toggleState = false;

  double get _coefValue {
    if (_toggleState) {
      return widget.fakeData.goalReached(
          widget.fakeData.heuristicCoefs(widget.fakeData.goalCoefs));
    } else {
      return widget.fakeData.goalReached(widget.fakeData.goalCoefs);
    }
  }

  Color get progressColor {
    return _toggleState
        ? AppStyles.colors.heliotrope[500]!
        : AppStyles.colors.chryslerBlue[500]!;
  }

  void _altState() {
    setState(() {
      _toggleState = !_toggleState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapDown: (_) => _toggleState ? null : _altState.call(),
      onTapUp: (_) => _toggleState ? _altState.call() : null,
      child: Padding(
          padding: const EdgeInsets.only(top: 32),
          child: CircularPercentIndicator(
            radius: 80.0,
            lineWidth: 13.0,
            percent: _coefValue,
            center: Text(
              "${(_coefValue * 100).round()}%",
              style: AppStyles.fonts.display(),
            ),
            footer: Text(
              "Objectiu mensual",
              style: AppStyles.fonts.labelLarge(),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: progressColor,
          )),
    );
  }
}
