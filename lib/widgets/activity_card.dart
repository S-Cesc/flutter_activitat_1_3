import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_activitat_1_3/styles/app_styles.dart';
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
                    style: AppStyles.fonts.labelLarge),
                Text(
                  formatDate(data.key),
                  style: AppStyles.fonts.bodyItalic,
                ),
              ],
            ),
            SizedBox(
              width: 120,
              child: Text(
                data.value.distance == null
                    ? ""
                    : "${formater.format(data.value.distance)} ${profile.distanceUnit.abbrev}",
                style: AppStyles.fonts.headline,
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

  String formatDate(DateTime d) {
    final formatTime = DateFormat('Hm').format(d);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    if (d.isBefore(today)) {
      final dayBefore = today.add(const Duration(days: -1));
      if (d.isBefore(dayBefore)) {
        return "${DateFormat('yMMMd', 'ca_ES').format(d)}, $formatTime";
      } else {
        return "Ahir, $formatTime";
      }
    } else {
      return "Avui,  $formatTime";
    }
  }
}
