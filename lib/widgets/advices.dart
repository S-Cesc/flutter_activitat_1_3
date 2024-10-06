import 'package:flutter/material.dart';
import '../styles/app_styles.dart';
import '../fake_data/fake_data.dart';

class Advices extends StatefulWidget {
  const Advices({super.key});

  @override
  State<Advices> createState() => _AdvicesState();
}

class _AdvicesState extends State<Advices> {
  final SingletonFake fakeData = SingletonFake();
  int _index = 0;

  void _incrementIndex() {
    setState(() {
      _index = (_index + 1) % fakeData.advices.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: Text(
              fakeData.advices[_index],
              style: AppStyles.fonts.body,
              softWrap: true,
            ),
          ),
        Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: _incrementIndex,
                style: ButtonStyle(
                  foregroundColor: WidgetStatePropertyAll(
                      AppStyles.colors.chryslerBlue[400]),
                  textStyle:
                      WidgetStatePropertyAll(AppStyles.fonts.bodyUnderlined),
                ),
                child: const Text("Més detalls"),
              ),
            ]),
      ],
    );
  }

}
