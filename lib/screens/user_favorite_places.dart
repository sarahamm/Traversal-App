import 'package:favorite_places/generated/l10n.dart';
import 'package:favorite_places/screens/discover_places.dart';
import 'package:flutter/material.dart';

enum TravelType { adventure, discover, vacation, jobTrip }

class UserFavoritePlacesScreen extends StatefulWidget {
  const UserFavoritePlacesScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return UserFavoritePlacesState();
  }
}

class UserFavoritePlacesState extends State<UserFavoritePlacesScreen> {
  Set<TravelType> choices = {TravelType.adventure, TravelType.vacation};
  int counter = 2;
  //String Format = choices.map((type) => type.toString().split()));

  ValueNotifier<Set> interestSelected = ValueNotifier<Set>({});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 32),
              Text(S().welcome),
              Text(S().pickYourFavActivity),
              SizedBox(height: 24),
              SegmentedButton<TravelType>(
                segments: <ButtonSegment<TravelType>>[
                  ButtonSegment<TravelType>(
                    value: TravelType.adventure,
                    label: Text(S().adventure),
                    icon: const Icon(Icons.explore),
                  ),
                  ButtonSegment<TravelType>(
                    value: TravelType.discover,
                    label: Text(S().discoverNewCulture),
                    icon: Icon(Icons.travel_explore_rounded),
                  ),
                  ButtonSegment<TravelType>(
                    value: TravelType.vacation,
                    label: Text(S().vacation),
                    icon: Icon(Icons.beach_access_rounded),
                  ),
                  ButtonSegment<TravelType>(
                    value: TravelType.jobTrip,
                    label: Text(S().jobTrip),
                    icon: Icon(Icons.work_rounded),
                  ),
                ],

                selected: choices,
                multiSelectionEnabled: true,
                onSelectionChanged: (Set<TravelType> addChoice) {
                  setState(() {
                    counter = choices.length;
                    choices = addChoice;
                  });
                },
              ),
              Spacer(),

              ValueListenableBuilder<Set>(
                valueListenable: interestSelected,
                builder: (context, value, _) {
                  return Text("${S().interestSeleced} $choices");
                },
              ),

              Spacer(),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => DiscoverPlacesScreen()),
                  );
                },
                icon: Icon(Icons.arrow_right_rounded),
                label: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
