import 'package:favorite_places/generated/l10n.dart';
import 'package:favorite_places/widgets/card_widget.dart';
import 'package:favorite_places/widgets/drawer_widget.dart';
import 'package:favorite_places/widgets/image_crousel.dart';
import 'package:favorite_places/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class DiscoverPlacesScreen extends StatefulWidget {
  const DiscoverPlacesScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DiscoverPlaceScrenState();
  }
}

class _DiscoverPlaceScrenState extends State<DiscoverPlacesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.flight_takeoff_rounded),
            ),

            Text(
              "Traversal",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            Spacer(),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 15),

                    const Expanded(
                      child: Text(
                        "Discover a city",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: IconButton(
                        onPressed: () {
                          showSearch(
                            context: context,
                            delegate: CustomSearchDelegate(),
                          );
                        },
                        icon: const Icon(Icons.search),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            ImageCarousel(),

            const SizedBox(height: 10),

            Center(
              child: Text(
                S.of(context).discover,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w900),
              ),
            ),

            //const Divider(thickness: 1, color: Colors.grey),
            Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black87, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      Text(
                        "Explore Countries",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Spacer(),
                      IconButton(onPressed: () {}, icon: Icon(Icons.tune)),
                    ],
                  ),

                  // ListView.builder inside ListView must use shrinkWrap
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      final titles = [
                        S.of(context).italy,
                        S.of(context).japan,
                        S.of(context).southAfrica,
                        S.of(context).canada,
                        S.of(context).brazil,
                        S.of(context).france,
                        S.of(context).thailand,
                      ];

                      return CardWidget(title: titles[index]);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
