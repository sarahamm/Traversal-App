import 'package:favorite_places/models/data_base.dart';
import 'package:favorite_places/models/places_data.dart';
import 'package:favorite_places/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

final colorScheme = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: const Color.fromARGB(255, 158, 202, 214),
  // ignore: deprecated_member_use
  background: const Color.fromARGB(255, 246, 246, 246),
);

final theme = ThemeData().copyWith(
  scaffoldBackgroundColor: colorScheme.background,
  colorScheme: colorScheme,
  textTheme: GoogleFonts.ubuntuCondensedTextTheme().copyWith(
    titleSmall: GoogleFonts.ubuntuCondensed(fontWeight: FontWeight.bold),
    titleMedium: GoogleFonts.ubuntuCondensed(fontWeight: FontWeight.bold),
    titleLarge: GoogleFonts.ubuntuCondensed(fontWeight: FontWeight.bold),
  ),
);

savePlacesToDB() async {
  print("Starting to save places to DB");
  for (int i = 0; i < placesData.length; i++) {
    await DataBaseService.instance.insertPlace(
      placesData[i].title,
      placesData[i].subTitle!,
      placesData[i].imageUrl!,
      placesData[i].description!,
    );
  }
  await DataBaseService.instance.insertFlag(S().adventure);
  await DataBaseService.instance.insertFlag(S().discoverNewCulture);
  await DataBaseService.instance.insertFlag(S().vacation);
  await DataBaseService.instance.insertFlag(S().jobTrip);
  try {
    await DataBaseService.instance.printPlacesTable();
    print("Finished saving places to DB");
  } catch (e) {
    print("Error in printPlacesTable: $e");
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await savePlacesToDB();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  final Locale? initialLocale;

  const MyApp({super.key, this.initialLocale});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: initialLocale,
      localizationsDelegates: const [
        S.delegate,
        //tells Flutter how to load and handle localized resources
        GlobalMaterialLocalizations
            .delegate, //Provides built-in Material widgets localization.
        GlobalWidgetsLocalizations
            .delegate, //Provides widget-level localization. (LTR RTL) | Text Layout
        GlobalCupertinoLocalizations
            .delegate, //For iOS-style (Cupertino) widgets
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      title: "Favorite Places",
      home: MainScreen(),
    );
  }
}
