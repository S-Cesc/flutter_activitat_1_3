import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'styles/app_styles.dart';
import 'models/fitness_data.dart';
import 'screens/fitness_home_page.dart';

Future<void> main() async {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['fonts'], license);
  });
  await initializeDateFormatting('ca_ES');
  runApp(const FitnessTimeApp());
}

class FitnessTimeApp extends StatelessWidget {
  const FitnessTimeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: FitnessData.appTitle,
      theme: ThemeData(
        fontFamily: AppStyles.fonts.fontFamilyName,
        useMaterial3: true,
      ),
      home: FitnessHomePage(),
    );
  }
}
