import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/activities.dart';
import '../styles/app_styles.dart';
import '../extensions/date_day_name.dart';
import '../fake_data/fake_data.dart';
import '../extensions/duration_format.dart';

class FitnessProfilePage extends StatefulWidget {
  const FitnessProfilePage({super.key, required this.fakeData});

  final SingletonFake fakeData;

  @override
  State<FitnessProfilePage> createState() => _FitnessProfilePageState();
}

class _FitnessProfilePageState extends State<FitnessProfilePage> {
  final formater = NumberFormat("#0.000");
  double _currentHeightSliderValue = 0.0;
  double _currentWeightSliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    Map<Activities, (double?, Duration, int)> totals = widget.fakeData.totals;
    _currentHeightSliderValue = widget.fakeData.profile.height.toDouble();
    _currentWeightSliderValue = widget.fakeData.profile.weight.toDouble();
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile",
            style: AppStyles.fonts.headline(color: AppStyles.colors.white)),
        backgroundColor: AppStyles.colors.persianPink,
        foregroundColor: AppStyles.colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column(
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: CircleAvatar(
                  radius: 84,
                  foregroundImage: NetworkImage(
                      'https://randomuser.me/api/portraits/women/44.jpg'),
                ),
              ),
            ),
            Center(
              child: Text(
                "${widget.fakeData.profile.name} ${widget.fakeData.profile.surname}",
                style: AppStyles.fonts.display(),
              ),
            ),
            Center(
              child: Text(
                "des del ${AppStyles.formatDate(widget.fakeData.profile.registration, !widget.fakeData.profile.registration.isBefore(DateDayName.getYesterday(DateTime.now())))}",
                style: AppStyles.fonts.body(),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 48, vertical: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppStyles.colors.heliotrope[400],
                      ),
                      child: Column(
                        children: [
                          const Icon(Icons.alarm),
                          Text(
                            "Time",
                            style: AppStyles.fonts.labelSmall(),
                          ),
                          Text(
                            DurationFormat.formatHM(
                                totals[Activities.running]?.$2 ??
                                    const Duration(seconds: 0)),
                            style: AppStyles.fonts.labelLarge(),
                          ),
                        ],
                      )),
                  Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppStyles.colors.heliotrope[400],
                      ),
                      child: Column(
                        children: [
                          const Icon(Icons.location_on),
                          Text(
                            widget.fakeData.profile.distanceUnit.abbrev,
                            style: AppStyles.fonts.labelSmall(),
                          ),
                          Text(
                            (formater
                                .format(totals[Activities.running]?.$1 ?? 0.0)),
                            style: AppStyles.fonts.labelLarge(),
                          ),
                        ],
                      )),
                  Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppStyles.colors.heliotrope[400],
                      ),
                      child: Column(
                        children: [
                          const Icon(Icons.house),
                          Text(
                            "Activities",
                            style: AppStyles.fonts.labelSmall(),
                          ),
                          Text(
                            (totals[Activities.running]?.$3 ?? 0).toString(),
                            style: AppStyles.fonts.labelLarge(),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            Row(
              children: [
                const Text("Height"),
                Slider(
                    value: _currentHeightSliderValue,
                    label: _currentHeightSliderValue.round().toString(),
                    max: 250,
                    divisions: 25,
                    onChanged: (double value) {
                      setState(() {
                        widget.fakeData.profile.height = value.round();
                        _currentHeightSliderValue = value;
                      });
                    }),
                Text("${_currentHeightSliderValue.round().toString()} cm"),
              ],
            ),
            Row(
              children: [
                const Text("Weight"),
                Slider(
                    value: _currentWeightSliderValue,
                    label: _currentWeightSliderValue.round().toString(),
                    max: 175,
                    divisions: 175,
                    onChanged: (double value) {
                      setState(() {
                        widget.fakeData.profile.weight = value.round();
                        _currentWeightSliderValue = value;
                      });
                    }),
                Text("${_currentWeightSliderValue.round().toString()} kg"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
