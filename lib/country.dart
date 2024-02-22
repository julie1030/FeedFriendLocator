// country_details_screen.dart
import 'package:feedfriendlocator/main.dart';
import 'package:flutter/material.dart';

class CountryDetailsScreen extends StatelessWidget {
  final Country country;

  CountryDetailsScreen({required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Name: ${country.name}'),
            SizedBox(height: 10),
            Text('LatLng: ${country.latlng[0]}, ${country.latlng[1]}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to the map screen
              },
              child: Text('Go Back to Map'),
            ),
          ],
        ),
      ),
    );
  }
}
