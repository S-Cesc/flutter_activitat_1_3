import 'package:flutter/material.dart';
import '../widgets/advices.dart';
import '../styles/app_styles.dart';
import '../fake_data/fake_data.dart';
import '../widgets/activity_card.dart';
import '../widgets/circular_percent.dart';

class FitnessHomePage extends StatelessWidget {
  FitnessHomePage({super.key});

  final fakeData = SingletonFake();

  @override
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      // Salutació
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                "Hola ${fakeData.profile.name} ,",
                                style: AppStyles.fonts.display,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Advices
                      const Advices(),
                      // Activitats
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Darreres activitats",
                                  textAlign: TextAlign.left,
                                  style: AppStyles.fonts.headline,
                                ),
                              ),
                            ],
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: fakeData.data.length,
                            prototypeItem: ActivityCard(
                              profile: fakeData.profile,
                              data: fakeData.data.entries.first,
                            ),
                            itemBuilder: (context, index) {
                              return ActivityCard(
                                profile: fakeData.profile,
                                data: fakeData.data.entries.elementAt(index),
                              );
                            },
                          ),
                          // Contingut percent_indicator
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularPercent(fakeData: fakeData),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}
