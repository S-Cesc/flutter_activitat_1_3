import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'styles/app_styles.dart';
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
    const appTitle = 'Fitness Time';
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        fontFamily: AppStyles.fonts.fontFamilyName,
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.menu),
          backgroundColor: AppStyles.colors.persianPink,
          foregroundColor: AppStyles.colors.white,
          title: Text(appTitle, style: AppStyles.fonts.headline),
          centerTitle: true,
          actions: const <Widget>[
            CircleAvatar(
              foregroundImage: NetworkImage(
                  'https://randomuser.me/api/portraits/women/44.jpg'),
            )
          ],
        ),
        body: FitnessHomePage(),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: null,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: SizedBox(
                  width: 56,
                  height: 48,
                  child: Column(children: [
                    const Icon(Icons.home, size: 24),
                    Text("Inici", style: AppStyles.fonts.body),
                  ]),
                ),
              ),
            ),
            TextButton(
              onPressed: null,
              child: SizedBox(
                width: 56,
                height: 48,
                child: Column(children: [
                  const Icon(Icons.search, size: 24),
                  Text("Cercar", style: AppStyles.fonts.body),
                ]),
              ),
            ),
            TextButton(
              onPressed: null,
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: SizedBox(
                  width: 56,
                  height: 48,
                  child: Column(children: [
                    const Icon(Icons.shopping_cart, size: 24),
                    Text("Botiga", style: AppStyles.fonts.body),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
