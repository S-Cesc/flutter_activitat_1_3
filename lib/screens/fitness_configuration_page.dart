import 'package:flutter/material.dart';
import '../styles/app_styles.dart';
import '../fake_data/fake_data.dart';

class FitnessConfigurationPage extends StatefulWidget {
  const FitnessConfigurationPage({super.key, required this.fakeData});

  final SingletonFake fakeData;

  @override
  State<FitnessConfigurationPage> createState() =>
      _FitnessConfigurationPageState();
}

class _FitnessConfigurationPageState extends State<FitnessConfigurationPage> {
  final List<Widget> _strings = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configuració",
            style: AppStyles.fonts.headline(color: AppStyles.colors.white)),
        backgroundColor: AppStyles.colors.persianPink,
        foregroundColor: AppStyles.colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _strings.length,
              itemBuilder: (context, index) => _strings[index],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(
                () {
                  _strings.add(
                    const Text('new text added'),
                  );
                },
              );
            },
            child: const Text('Add String'),
          )
        ],
      ),
    );
  }
}
