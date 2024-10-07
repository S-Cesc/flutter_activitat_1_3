import 'package:flutter_activitat_1_3/models/activities.dart';

import '../models/fitness_data.dart';
import '../models/units.dart';
import '../extensions/duration_extensions.dart' as ext;

class SingletonFake extends FitnessData {
  final advices = [
    "Recorda beure aigua regularment al llarg del dia per mantenir el teu cos hidratat i millorar el teu rendiment físic i mental.",
    "És important que t’hidratis, independentment de l’època de l’any en la que et trobis. La deshidratació és molt perjudicial per a l’esportista. No esperis a tenir set, hidrata’t abans, durant i després de fer esport. Un bon canvi també és substituir els refrescos ensucrats per aigua en els teus àpats.",
    "Pel que fa a l’alimentació, és important menjar bé sempre, no únicament el dia de la competició o l’entrenament. Adequant la teva alimentació al tipus d’esport i el nivell d’exigència. Encara que la salut i el rendiment estan condicionats, en part, per la genètica, l’adequada alimentació i un bon entrenament fan un paper molt important per aconseguir millorar la teva salut. Si tens dubtes sobre la teva alimentació o entrenament, el millor és que visitis el nostre nutricionista o preparador físic.",
    "No només entrenar és important, el descans i la recuperació són primordials per evitar lesions. El sobre-entrenament pot ser perjudicial, el millor és entrenar de forma gradual sense augmentar excessivament la teva càrrega setmanal.",
    "Sigui quin sigui l’esport que practiquis és important fer treballs de força per incrementar la teva massa muscular la qual cosa t’ajuda a recuperar-te i evitar lesions. Els exercicis de força específics per l’esport que practiques (Entrenament Funcional) et recomanem que te’l pauti el preparador físic.",
    "Un bon escalfament abans de la pràctica esportiva i fer estiraments després de l’entrenament són essencials donant prioritat al grup muscular més utilitzat durant la sessió.",
    "Entrenar no vol dir patir. Encara que siguis principiant és important distingir entre l’esforç del treball i el dolor d’alguna molèstia, utilitza el sentit comú i enfront un dolor atura’t i demana hora al fisioterapeuta o metge.",
    "Porta un control mèdic periòdicament, és important que un especialista en esport et realitzi controls regulars (Revisió Mèdica Esportiva) per prevenir possibles problemes de salut o evitar lesions.",
  ];

  static final SingletonFake _singleton = SingletonFake._internal();
  factory SingletonFake() {
    return _singleton;
  }
  SingletonFake._internal()
      : super.withData(
          profile: FakeProfile.profile,
          data: FakeProfile.data,
        );
}

class FakeProfile {
  static var profile = Profile(
    name: "Antònia",
    surname: "Font",
    registration: DateTime.parse("20220420"),
    distanceUnit: DistanceUnit.km,
    weighUnit: WeighUnit.kg,
    height: 150,
    weight: 55,
  );
  static var data = <DateTime, Datum>{
    DateTime.parse("20240927T20:04:21"): Datum(
        time: ext.DurationExtensions.parseDurationISOString("PT1H55M").duration,
        activity: Activities.activeRest),
    DateTime.parse("20240928T08:24:14"): Datum(
        time: ext.DurationExtensions.parseDurationISOString("PT3H25M").duration,
        distance: 12.350,
        activity: Activities.hiking),
    DateTime.parse("20240929T09:32:14"): Datum(
        time: ext.DurationExtensions.parseDurationISOString("PT3H45M").duration,
        distance: 14.727,
        activity: Activities.hiking),
    DateTime.parse("20240930T20:16:12"): Datum(
        time: ext.DurationExtensions.parseDurationISOString("PT21M").duration,
        distance: 2.450,
        activity: Activities.walkRun),
    DateTime.parse("20241001T20:24:57"): Datum(
        time: ext.DurationExtensions.parseDurationISOString("P15M").duration,
        distance: 1.420,
        activity: Activities.running),
    DateTime.parse("20241002T20:32:07"): Datum(
        time: ext.DurationExtensions.parseDurationISOString("PT29M").duration,
        distance: 3.252,
        activity: Activities.running),
    DateTime.parse("20241003T20:57:32"): Datum(
        time: ext.DurationExtensions.parseDurationISOString("PT32M").duration,
        distance: 4.412,
        activity: Activities.running),
    DateTime.parse("20241004T17:38:12"): Datum(
        time: ext.DurationExtensions.parseDurationISOString("PT1H25M").duration,
        activity: Activities.strengthTraining),
    DateTime.parse("20241004T18:27:43"): Datum(
        time: ext.DurationExtensions.parseDurationISOString("PT1H25M").duration,
        distance: 1.350,
        activity: Activities.swimming),
    DateTime.parse("20241004T19:57:14"): Datum(
        time: ext.DurationExtensions.parseDurationISOString("PT18M").duration,
        distance: 2.635,
        activity: Activities.walkRun),
    DateTime.parse("20241005T09:24:22"): Datum(
        time: ext.DurationExtensions.parseDurationISOString("PT5H25M").duration,
        distance: 24.059,
        activity: Activities.hiking),
    DateTime.parse("20241006T08:14:24"): Datum(
        time: ext.DurationExtensions.parseDurationISOString("PT1H07M").duration,
        distance: 6.523,
        activity: Activities.hiking),
  };
}
