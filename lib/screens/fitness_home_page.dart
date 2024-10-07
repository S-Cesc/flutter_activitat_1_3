import 'package:flutter/material.dart';
import '../screens/fitness_profile_page.dart';
import '../screens/fitness_configuration_page.dart';
import '../styles/app_styles.dart';
import '../models/fitness_data.dart';
import '../fake_data/fake_data.dart';
import '../widgets/advices.dart';
import '../widgets/activity_card.dart';
import '../widgets/circular_percent.dart';

class FitnessHomePage extends StatelessWidget {
  FitnessHomePage({super.key});

  final fakeData = SingletonFake();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: const Icon(Icons.menu),
        title: Text(FitnessData.appTitle,
            style: AppStyles.fonts.headline(color: AppStyles.colors.white)),
        backgroundColor: AppStyles.colors.persianPink,
        foregroundColor: AppStyles.colors.white,
        centerTitle: true,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FitnessProfilePage(
                    fakeData: fakeData,
                  ),
                ),
              );
            },
            child: const Hero(
              tag: 'https://randomuser.me/api/portraits/women/44.jpg',
              child: CircleAvatar(
                foregroundImage: NetworkImage(
                    'https://randomuser.me/api/portraits/women/44.jpg'),
              ),
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppStyles.colors.persianPink[700],
              ),
              child:
                  Text(FitnessData.appTitle, style: AppStyles.fonts.headline()),
            ),
            ListTile(
              title: Text('Profile', style: AppStyles.fonts.labelLarge()),
              splashColor: AppStyles.colors.persianPink[700],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FitnessProfilePage(
                      fakeData: fakeData,
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Configuració', style: AppStyles.fonts.labelLarge()),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FitnessConfigurationPage(
                      fakeData: fakeData,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
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
                                  style: AppStyles.fonts.display(),
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
                                    style: AppStyles.fonts.headline(),
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
      ),
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
                  Text("Inici", style: AppStyles.fonts.body()),
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
                Text("Cercar", style: AppStyles.fonts.body()),
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
                  Text("Botiga", style: AppStyles.fonts.body()),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
