/*import 'package:favorite_places/provider/fetch_internet_data.dart';
import 'package:favorite_places/screens/add_place.dart';
import 'package:favorite_places/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DevicesScreen extends ConsumerStatefulWidget {
  const DevicesScreen({super.key});

  @override
  ConsumerState<DevicesScreen> createState() {
    return PlacesScreenState();
  }
}

class PlacesScreenState extends ConsumerState<DevicesScreen> {
  late Future<List<PhoneData>> futueFetchData;

  @override
  void initState() {
    super.initState();
    futueFetchData = fetchedData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text('Your Devices'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (ctx) => const AddPlace()));
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),

      body: FutureBuilder(
        future: futueFetchData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            throw Exception('${snapshot.error}');
          } else {
            final itemData = snapshot.data!;
            return ListView.builder(
              itemCount: itemData.length,
              itemBuilder: (context, index) {
                final item = itemData[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    foregroundColor: Colors.white70,
                    child: Text(item.id),
                  ),
                  title: Text(item.name),
                  subtitle: Text(item.data.toString()),
                );
              },
            );
          }
        },
      ),
    );
  }
}*/
