import 'package:flutter/material.dart';
import 'package:flutter_activitat_1_3/models/activities.dart';

import 'units.dart';

class FitnessData {
  Profile profile;
  Map<DateTime, Datum> data;

  FitnessData({required this.profile}) : data = <DateTime, Datum>{};
  FitnessData.withData({required this.profile, required this.data});

  /// Add new activity data
  addData(DateTime date, Duration time, double? distance, Activities activity) {
    data[date] = Datum(
      time: time,
      distance: distance,
      activity: activity,
    );
  }

  /// Sum total grouped by activities
  Map<Activities, (double?, Duration)> get totals {
    Map<Activities, (double?, Duration)> result = {};
    for (MapEntry<DateTime, Datum> d in data.entries) {
      result.update(
          d.value.activity,
          (x) => (
                d.value.distance == null
                    ? x.$1
                    : (x.$1 ?? 0) + d.value.distance!,
                x.$2 + d.value.time
              ),
          ifAbsent: () => (d.value.distance, d.value.time));
    }
    return result;
  }

  /// Goal coeficient reached for each activity
  Map<Activities, double?> get goalCoefs {
    Map<Activities, double?> result = {};
    for (var total in totals.entries) {
      if (profile.goals.containsKey(total.key)) {
        f([x]) {
          if (total.value.$1 == null || profile.goals[total.key]!.$1 == null) {
            if (profile.goals[total.key]!.$1 == null &&
                profile.goals[total.key]!.$2 != null) {
              if (total.value.$2.inMinutes >=
                  profile.goals[total.key]!.$2!.inMinutes) {
                return 1.0;
              } else {
                return total.value.$2.inMinutes /
                    profile.goals[total.key]!.$2!.inMinutes;
              }
            } else {
              return 0.0;
            }
          } else {
            if (total.value.$1! >= profile.goals[total.key]!.$1!) {
              return 1.0;
            } else {
              return total.value.$1! / profile.goals[total.key]!.$1!;
            }
          }
        }

        result.update(total.key, (x) => f(x), ifAbsent: () => f());
      }
    }
    return result;
  }

  /// Some ectivities can add value to goals when they are not goals themselves
  /// Acts as a procedure, with side effect on goalCoefs parameter
  /// (which is returned)
  Map<Activities, double?> heuristicCoefs(Map<Activities, double?> goalCoefs) {
    for (var total in totals.entries) {
      if (!profile.goals.containsKey(total.key)) {
        switch (total.key) {
          case Activities.walkRun:
            if (total.value.$1 != null &&
                profile.goals.containsKey(Activities.running) &&
                profile.goals[Activities.running]!.$1 != null) {
              goalCoefs.update(Activities.running, (x) {
                double tmp = (goalCoefs[Activities.running] ?? 0.0) +
                    (2 * total.value.$1!) /
                        (3 * profile.goals[Activities.running]!.$1!);
                return tmp >= 1.0 ? 1.0 : tmp;
              });
            }
            break;
          case Activities.cycling:
            if (total.value.$1 != null &&
                profile.goals.containsKey(Activities.running) &&
                profile.goals[Activities.running]!.$1 != null) {
              goalCoefs.update(Activities.running, (x) {
                double tmp = (goalCoefs[Activities.running] ?? 0.0) +
                    total.value.$1! /
                        (10 * profile.goals[Activities.running]!.$1!);
                return tmp >= 1.0 ? 1.0 : tmp;
              });
            }
            break;
          case Activities.rowing:
          case Activities.swimming:
          case Activities.hiking:
            if (profile.goals.containsKey(Activities.strengthTraining) &&
                profile.goals[Activities.strengthTraining]!.$2 != null) {
              goalCoefs.update(Activities.strengthTraining, (x) {
                double tmp = (goalCoefs[Activities.strengthTraining] ?? 0.0) +
                    total.value.$2.inMinutes /
                        ((total.key == Activities.hiking ? 10 : 1) *
                            profile.goals[Activities.strengthTraining]!.$2!
                                .inMinutes);
                return tmp >= 1.0 ? 1.0 : tmp;
              });
            }
            break;
          case _:
            break;
        }
      }
    }
    return goalCoefs;
  }

  double goalReached(Map<Activities, double?> coefs) {
    double result = 0;
    for (var t in coefs.entries) {
      if (profile.goals.containsKey(t.key)) {
        result += (t.value ?? 0.0) * profile.goals[t.key]!.$3;
      } else {
        // the key should always be in goals, by correct construction from totals
        throw RangeError(
            "Total activity not in goals: incorrect map construction");
      }
    }
    return result;
  }

  /* TODO total getters
  totalTime
  totalDistance
  totalActivities
  dayCount
  */
}

class Profile {
  final String name;
  final String surname;
  final DateTime registration;
  DistanceUnit distanceUnit;
  WeighUnit weighUnit;
  // personal data
  int height;
  int weight;
  // goal: for the selected activities:
  // distance, time, and importance weigth of the activity
  Map<Activities, (double?, Duration?, double)> goals;

  Profile({
    required this.name,
    required this.surname,
    required this.registration,
    required this.distanceUnit,
    required this.weighUnit,
    required this.height,
    required this.weight,
    this.goals = const {
      Activities.running: (40, null, 0.9),
      Activities.strengthTraining: (null, Duration(hours: 4), 0.1)
    },
  });
}

class Datum {
  Duration time;
  double? distance;
  Activities activity;

  Datum({required this.time, this.distance, required this.activity})
      : assert(((activity == Activities.strengthTraining ||
                    activity == Activities.activeRest) &&
                distance == null) ||
            ((activity != Activities.strengthTraining &&
                activity != Activities.activeRest &&
                distance != null)));
}
