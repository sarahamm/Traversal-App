import 'package:favorite_places/models/data_base.dart';
import 'package:favorite_places/models/places_data.dart';
import 'package:favorite_places/screens/discover_places.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

final colorScheme = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: Color.fromARGB(255, 4, 102, 136),
  // ignore: deprecated_member_use
  background: const Color.fromARGB(255, 242, 242, 242),
);

final theme = ThemeData().copyWith(
  scaffoldBackgroundColor: colorScheme.onPrimaryContainer,
  colorScheme: colorScheme,
  textTheme: GoogleFonts.ubuntuCondensedTextTheme().copyWith(
    titleSmall: GoogleFonts.ubuntuCondensed(fontWeight: FontWeight.bold),
    titleMedium: GoogleFonts.ubuntuCondensed(fontWeight: FontWeight.bold),
    titleLarge: GoogleFonts.ubuntuCondensed(fontWeight: FontWeight.bold),
  ),
);

void savePlacesToDB() async {
  
  for (int i = 0; i < placesData.length; i++) {
    await DataBaseService.instance.insertPlace(
      placesData[i].title,
      placesData[i].subTitle!,
      placesData[i].imageUrl!,
      placesData[i].description!,
    );
  }
  /*
  await DataBaseService.instance.insertFlag(S().adventure);
  await DataBaseService.instance.insertFlag(S().discoverNewCulture);
  await DataBaseService.instance.insertFlag(S().vacation);
  await DataBaseService.instance.insertFlag(S().jobTrip);*/
/*
 print('🔵This is Places :');
  DataBaseService.instance.printPlacesTable();
  //DataBaseService.instance.printPlacesFlagsTable();
  print('🟡This is Tags With Places :');
  DataBaseService.instance.printPlacesTagsTable();*/
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: MyApp()));
  WidgetsFlutterBinding.ensureInitialized();
  //savePlacesToDB();
  //DataBaseService.instance.myDeleteDataBase();
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
      home: DiscoverPlacesScreen(),
    );
  }
}
