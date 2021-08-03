import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review_places_app/screens/add_place_screen.dart';

import './providers/places_providers.dart';
import './screens/places_list_screen.dart';

void main() => runApp(ReviewPlaceApp());

class ReviewPlaceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: PlacesProvider(),
      child: MaterialApp(
          title: 'Review Places',
          theme: ThemeData(
              primarySwatch: Colors.indigo, accentColor: Colors.amber),
          home: PlacesListScreen(),
          routes: {
            AddPlaceScreen.routeName: (ctx) => AddPlaceScreen(),
          }),
    );
  }
}
