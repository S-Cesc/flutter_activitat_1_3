import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../styles/app_styles.dart';
import '../models/fitness_data.dart';
import '../models/activities.dart';
import 'cercled_icon.dart';

class ActivityCard extends StatelessWidget {
  final formater = NumberFormat("#0.000");
  final Profile profile;
  final MapEntry<DateTime, Datum> data;

  ActivityCard({super.key, required this.profile, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CercledIcon.cercledIcon(activityIcon(data.value.activity),
                externalColor: AppStyles.colors.chryslerBlue[700]!,
                iconColor: AppStyles.colors.chryslerBlue[700]!),
            Column(
              children: [
                Text(data.value.activity.toString(),
                    style: AppStyles.fonts.labelLarge()),
                Text(
                  AppStyles.formatDate(data.key),
                  style: AppStyles.fonts.body(fontStyle: FontStyle.italic),
                ),
              ],
            ),
            SizedBox(
              width: 120,
              child: Text(
                data.value.distance == null
                    ? ""
                    : "${formater.format(data.value.distance)} ${profile.distanceUnit.abbrev}",
                style: AppStyles.fonts.headline(),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData activityIcon(Activities activity) {
    return switch (activity) {
      Activities.activeRest => Icons.self_improvement,
      Activities.cycling => Icons.directions_bike,
      Activities.hiking => Icons.hiking,
      Activities.rowing => Icons.rowing,
      Activities.running => Icons.directions_run,
      Activities.swimming => Icons.pool,
      Activities.strengthTraining => Icons.fitness_center,
      Activities.walkRun => Icons.directions_walk,
    };
  }
}
