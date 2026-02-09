import 'package:favorite_places/models/places_data.dart';
import 'package:favorite_places/widgets/tap_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class CardWidget extends ConsumerStatefulWidget {
  const CardWidget({super.key, required this.title});
  final String title;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _CardWidgetState();
  }
}

class _CardWidgetState extends ConsumerState<CardWidget> {
  @override
  Widget build(BuildContext context) {
    //final dbPlace = DataBaseService.instance.returnPlace(widget.title);

    int getIndex() {
      return placesData.indexWhere((place) => widget.title == place.title);
    }

    final index = getIndex();
    final place = placesData[index];

    return Card(
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        leading: Container(
          width: 100,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(place.imageUrl!),
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => TapViewWidget(title: place.title),
            ),
          );
        },
        trailing: IconButton(onPressed: () {}, icon: Icon(Icons.star)),

        title: Text(
          place.title,
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          place.subTitle!,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
