import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hello`
  String get hello {
    return Intl.message('Hello', name: 'hello', desc: '', args: []);
  }

  /// `Welcome to Traversal`
  String get welcome {
    return Intl.message(
      'Welcome to Traversal',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `DISCOVER NEW PLACES`
  String get discover {
    return Intl.message(
      'DISCOVER NEW PLACES',
      name: 'discover',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Greece`
  String get greece {
    return Intl.message('Greece', name: 'greece', desc: '', args: []);
  }

  /// `Iceland`
  String get iceland {
    return Intl.message('Iceland', name: 'iceland', desc: '', args: []);
  }

  /// `Indonesia`
  String get indonesia {
    return Intl.message('Indonesia', name: 'indonesia', desc: '', args: []);
  }

  /// `Australia`
  String get australia {
    return Intl.message('Australia', name: 'australia', desc: '', args: []);
  }

  /// `Jordan`
  String get jordan {
    return Intl.message('Jordan', name: 'jordan', desc: '', args: []);
  }

  /// `France`
  String get france {
    return Intl.message('France', name: 'france', desc: '', args: []);
  }

  /// `City of love, lights, and timeless art`
  String get franceSubtitle {
    return Intl.message(
      'City of love, lights, and timeless art',
      name: 'france_subTitle',
      desc: '',
      args: [],
    );
  }

  /// `Japan`
  String get japan {
    return Intl.message('Japan', name: 'japan', desc: '', args: []);
  }

  /// `A fusion of tradition and cutting-edge technology`
  String get japanSubTitle {
    return Intl.message(
      'A fusion of tradition and cutting-edge technology',
      name: 'japan_subTitle',
      desc: '',
      args: [],
    );
  }

  /// `South Africa`
  String get southAfrica {
    return Intl.message(
      'South Africa',
      name: 'south_africa',
      desc: '',
      args: [],
    );
  }

  /// `Stunning mountains meet the ocean`
  String get southAfricaSubTitle {
    return Intl.message(
      'Stunning mountains meet the ocean',
      name: 'southAfrica_subTitle',
      desc: '',
      args: [],
    );
  }

  /// `Brazil`
  String get brazil {
    return Intl.message('Brazil', name: 'brazil', desc: '', args: []);
  }

  /// `Carnivals, beaches, and rainforest adventures`
  String get brazilSubTitle {
    return Intl.message(
      'Carnivals, beaches, and rainforest adventures',
      name: 'brazil_subTitle',
      desc: '',
      args: [],
    );
  }

  /// `Italy`
  String get italy {
    return Intl.message('Italy', name: 'italy', desc: '', args: []);
  }

  /// `Romantic canals and Renaissance charm`
  String get italySubTitle {
    return Intl.message(
      'Romantic canals and Renaissance charm',
      name: 'italy_subTitle',
      desc: '',
      args: [],
    );
  }

  /// `Thailand`
  String get thailand {
    return Intl.message('Thailand', name: 'thailand', desc: '', args: []);
  }

  /// `Tropical beaches and vibrant street life`
  String get thailandSubTitle {
    return Intl.message(
      'Tropical beaches and vibrant street life',
      name: 'thailand_subTitle',
      desc: '',
      args: [],
    );
  }

  /// `Favourite_Places`
  String get favouritePlaces {
    return Intl.message(
      'Favourite_Places',
      name: 'favourite_places',
      desc: '',
      args: [],
    );
  }

  /// `Want To Visit`
  String get wantToVisit {
    return Intl.message(
      'Want To Visit',
      name: 'want_to_visit',
      desc: '',
      args: [],
    );
  }

  /// `Visited`
  String get visited {
    return Intl.message('Visited', name: 'visited', desc: '', args: []);
  }

  /// `Planned`
  String get planned {
    return Intl.message('Planned', name: 'Planned', desc: '', args: []);
  }

  /// `Adventure`
  String get adventure {
    return Intl.message('Adventure', name: 'adventure', desc: '', args: []);
  }

  /// `Discover New Culture`
  String get discoverNewCulture {
    return Intl.message(
      'Discover New Culture',
      name: 'discover_new_culture',
      desc: '',
      args: [],
    );
  }

  /// `Vacation`
  String get vacation {
    return Intl.message('Vacation', name: 'vacation', desc: '', args: []);
  }

  /// `Job Trip`
  String get jobTrip {
    return Intl.message('Job Trip', name: 'job_trip', desc: '', args: []);
  }

  String get travel {
    return Intl.message(
      "Travel Around The World",
      name: 'travel',
      desc: '',
      args: [],
    );
  }

  String get fieldNotFilled {
    return Intl.message(
      "❌You haven't filled the required field",
      name: 'fieldNotFilled',
      desc: '',
      args: [],
    );
  }

  String get fieldFilled {
    return Intl.message("has added ✅", name: 'fieldFilled', desc: '', args: []);
  }

  get aboutplaceTap {
    return Intl.message(
      "About The Place",
      name: 'aboutplaceTap',
      desc: '',
      args: [],
    );
  }

  get gallaryplaceTap {
    return Intl.message("Gallary", name: 'gallaryplaceTap', desc: '', args: []);
  }

  get pickLandplaceTap {
    return Intl.message(
      "Pick a land",
      name: 'pickLandplaceTap',
      desc: '',
      args: [],
    );
  }

  String get franceDesciption {
    return Intl.message(
      "France is sophistication embodied — a place where art, fashion, history, and gastronomy flourish. Stroll down Parisian boulevards, marvel at the Eiffel Tower, and savor croissants in quaint cafés. Beyond the capital, you'll find lavender fields in Provence, vineyards in Bordeaux, castles in the Loire Valley, and snow-capped peaks in the Alps. Every region is unique, yet connected by a timeless elegance that defines France.",
      name: 'france_desciption',
      desc: '',
      args: [],
    );
  }

  String get japanDescription {
    return Intl.message(
      "Japan is a land of contrasts and harmony — a place where ancient temples coexist with neon-lit cities. Whether you're wandering through Kyoto’s peaceful bamboo forests, experiencing Tokyo’s tech-powered energy, or catching the cherry blossoms in full bloom, every moment feels intentional and graceful. Its culture is rich in respect and tradition, from samurai heritage to the meticulous art of sushi. Japan offers a travel experience that's as serene as it is futuristic.",
      name: 'japan_description',
      desc: '',
      args: [],
    );
  }

  String get southAfricaDescription {
    return Intl.message(
      "South Africa is a dream destination for adventurers and nature lovers. It boasts diverse wildlife, stunning coastlines, vibrant cities, and a deep cultural legacy. Go on a Big Five safari in Kruger National Park, hike the iconic Table Mountain, or visit the bustling neighborhoods of Cape Town and Johannesburg. South Africa is more than a place — it's a journey through landscapes and legacies that leave a lasting impression.",
      name: 'southAfrica_description',
      desc: '',
      args: [],
    );
  }

  String get brazilDescription {
    return Intl.message(
      "Brazil is color, rhythm, and untamed beauty. Home to the Amazon rainforest, the roaring Iguazu Falls, and the iconic Christ the Redeemer, it's a place of natural wonders and cultural richness. Dance to samba beats at Carnival, lounge on Copacabana Beach, or explore the historic towns of the interior. With its warm people and infectious spirit, Brazil pulses with life and welcomes all who visit with open arms.",
      name: 'brazil_description',
      desc: '',
      args: [],
    );
  }

  String get italyDescription {
    return Intl.message(
      "Italy is a country steeped in history, art, and elegance. From the ancient ruins of Rome and the romantic gondolas of Venice to the Renaissance masterpieces of Florence, it offers a timeless experience. Explore sun-drenched coastlines, charming hill towns, and a culinary scene that has inspired the world — pizza, pasta, espresso, and more. Whether you're sipping wine in Tuscany or hiking the cliffs of Cinque Terre, Italy blends beauty, culture, and passion like no other.",
      name: 'italy_description',
      desc: '',
      args: [],
    );
  }

  String get thailandDescription {
    return Intl.message(
      "Thailand is a vibrant tapestry of spiritual tradition, exotic beauty, and warm hospitality. Wander through golden temples, bustling night markets, and lush jungles. Bask on tropical islands like Phuket and Koh Samui, or explore the rich culture and street food of Bangkok and Chiang Mai. Whether you’re seeking serenity or excitement, Thailand offers a journey that touches the soul and satisfies the senses.",
      name: 'thailand_description',
      desc: '',
      args: [],
    );
  }

  String get canada {
    return Intl.message("Canada", name: 'canada', desc: '', args: []);
  }

  String get canadaSubTitle {
    return Intl.message(
      "Breathtaking nature and vibrant cities",
      name: 'canada_subTitle',
      desc: '',
      args: [],
    );
  }

  String get canadaDescription {
    return Intl.message(
      "Canada is the land of majestic mountains, endless forests, and some of the friendliest people you'll ever meet. From the French charm of Quebec to the cosmopolitan vibe of Toronto and Vancouver, Canada balances city energy with untamed wilderness. Experience the breathtaking beauty of Banff and Jasper, paddle across glassy lakes, or chase the northern lights in Yukon. It’s a destination that feels peaceful, vast, and full of wonder.",
      name: 'canada_description',
      desc: '',
      args: [],
    );
  }

  String get explore {
    return Intl.message("Explore", name: 'explore', desc: '', args: []);
  }

  String get pickYourFavActivity {
    return Intl.message(
      "Explore",
      name: 'Pick your Favorite Travel Activity',
      desc: '',
      args: [],
    );
  }

  String get interestSeleced {
    return Intl.message(
      "the interest seleced is",
      name: 'interest_deleced',
      desc: '',
      args: [],
    );
  }

  String get next {
    return Intl.message("Next", name: 'next', desc: '', args: []);
  }

  String get devices {
    return Intl.message("Devices", name: 'devices', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
