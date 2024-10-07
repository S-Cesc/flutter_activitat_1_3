enum DistanceUnit {
  km("Km", "Kilometer", 0.621371192237),
  mil("mi", "Mile", 1.609344);

  const DistanceUnit(this.abbrev, this.name, this._convert);

  final String abbrev;
  final String name;

  // as there are only two units,
  // convert is the coeficient used to convert to the other unit
  final double _convert;

  static DistanceUnit _toggleUnit(DistanceUnit unit) =>
      unit == DistanceUnit.km ? DistanceUnit.mil : DistanceUnit.mil;

  static DistanceUnit _toggleToDistance(ShortDistanceUnit unit) =>
      unit == ShortDistanceUnit.m ? DistanceUnit.km : DistanceUnit.mil;

  static double _valueToShortDistance(double value, DistanceUnit unit) {
    switch (unit) {
      case DistanceUnit.km:
        return value * ShortDistanceUnit.m.factor;
      case DistanceUnit.mil:
        return value * ShortDistanceUnit.yard.factor;
    }
  }

  static double _convertValueUnit(double value, DistanceUnit unit) {
    switch (unit) {
      case DistanceUnit.km:
        return value * DistanceUnit.km._convert;
      case DistanceUnit.mil:
        return value * DistanceUnit.mil._convert;
    }
  }
}

enum ShortDistanceUnit {
  // TODO switch factors (m -> 1000 => km = 1000m), and then valueToDistance
  m("m", "metres", 0.001),
  yard("yd", "yardes", 0.000568181818);

  const ShortDistanceUnit(this.abbrev, this.name, this.factor);

  final String abbrev;
  final String name;
  // factor to equivalent DistanceUnit
  final double factor;

  static ShortDistanceUnit _toggleUnit(ShortDistanceUnit unit) =>
      unit == ShortDistanceUnit.m
          ? ShortDistanceUnit.yard
          : ShortDistanceUnit.m;

  static ShortDistanceUnit _toggleToShortDistance(DistanceUnit unit) =>
      unit == DistanceUnit.km ? ShortDistanceUnit.m : ShortDistanceUnit.yard;

  static double _valueToDistance(double value, ShortDistanceUnit unit) {
    switch (unit) {
      case ShortDistanceUnit.m:
        return value / ShortDistanceUnit.m.factor;
      case ShortDistanceUnit.yard:
        return value / ShortDistanceUnit.yard.factor;
    }
  }

  // TODO review convertValueUnit for ShortDistanceUnit
  static double _convertValueUnit(double value, ShortDistanceUnit unit) {
    switch (unit) {
      case ShortDistanceUnit.m:
        return DistanceUnit._valueToShortDistance(
          DistanceUnit._convertValueUnit(
            _valueToDistance(value, ShortDistanceUnit.m),
            DistanceUnit.mil,
          ),
          DistanceUnit.mil,
        );
      case ShortDistanceUnit.yard:
        return DistanceUnit._valueToShortDistance(
          DistanceUnit._convertValueUnit(
            _valueToDistance(value, ShortDistanceUnit.yard),
            DistanceUnit.km,
          ),
          DistanceUnit.km,
        );
    }
  }
}

// TODO same as Distance (toggle unit, and value class)
enum WeighUnit {
  kg(0.687950776741),
  lb(0.4535923699993531);

  const WeighUnit(this.convert);

  final double convert;
}

class Distance {
  final double value;
  final DistanceUnit unit;

  Distance(this.value, this.unit);

  factory Distance.toggleUnit(Distance value) {
    return Distance(
      DistanceUnit._convertValueUnit(value.value, value.unit),
      DistanceUnit._toggleUnit(value.unit),
    );
  }

  factory Distance.toDistance(ShortDistance value) {
    return Distance(
      ShortDistanceUnit._valueToDistance(value.value, value.unit),
      DistanceUnit._toggleToDistance(value.unit),
    );
  }
}

class ShortDistance {
  double value;
  ShortDistanceUnit unit;

  ShortDistance(this.value, this.unit);

  factory ShortDistance.toggleUnit(ShortDistance value) {
    return ShortDistance(
      ShortDistanceUnit._convertValueUnit(value.value, value.unit),
      ShortDistanceUnit._toggleUnit(value.unit),
    );
  }

  factory ShortDistance.toShortDistance(Distance value) {
    return ShortDistance(
      DistanceUnit._valueToShortDistance(value.value, value.unit),
      ShortDistanceUnit._toggleToShortDistance(value.unit),
    );
  }
}
