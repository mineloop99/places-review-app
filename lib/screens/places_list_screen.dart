import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/add_place_screen.dart';
import '../providers/places_providers.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
              })
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<PlacesProvider>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (ctx, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<PlacesProvider>(
                    builder: (ctx, placesProvider, ch) =>
                        placesProvider.items.length <= 0
                            ? ch
                            : ListView.builder(
                                itemCount: placesProvider.items.length,
                                itemBuilder: (ctx, i) => ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: FileImage(
                                      placesProvider.items[i].image,
                                    ),
                                  ),
                                  title: Text(placesProvider.items[i].title),
                                  onTap: () {},
                                ),
                              ),
                    child: Center(
                      child: Text('Nothing added yet, Start add some!'),
                    ),
                  ),
      ),
    );
  }
}
