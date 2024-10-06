enum Activities {
  activeRest,
  strengthTraining,
  walkRun,
  running,
  cycling,
  rowing,
  hiking,
  swimming;

  @override
  toString() => switch (this) {
        Activities.activeRest => "Active Rest",
        Activities.strengthTraining => "Strength training",
        Activities.walkRun => "Walk/Run",
        Activities.running => "Running",
        Activities.cycling => "Cycling",
        Activities.rowing => "Rowing",
        Activities.hiking => "Hiking",
        Activities.swimming => "Swimming",
      };
}
