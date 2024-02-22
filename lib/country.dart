// country_details_screen.dart
import 'package:flutter/material.dart';

class CountryFlags {
  final String png;

  CountryFlags({required this.png});

  factory CountryFlags.fromJson(Map<String, dynamic> json) {
    return CountryFlags(
      png: json['png'] as String,
    );
  }
}

class Country {
  final String name;
  final List<double> latlng;
  final CountryFlags flags;

  Country({required this.name, required this.latlng, required this.flags});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name']['common'],
      latlng: (json['latlng'] as List).cast<double>(),
      flags: CountryFlags.fromJson(json['flags']), // Parse flags object
    );
  }
}

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
            Image.network(
              country.flags.png, // Use the png property from flags
              width: 100,
              height: 60, // Adjust width and height as needed
            ),
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
