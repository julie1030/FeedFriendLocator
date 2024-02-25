import 'package:flutter/material.dart';

// Classe représentant les drapeaux du pays
class CountryFlags {
  final String png;

  // Constructeur prenant le chemin du fichier PNG
  CountryFlags({required this.png});

  // Fabrique pour créer une instance de CountryFlags à partir d'un objet JSON
  factory CountryFlags.fromJson(Map<String, dynamic> json) {
    return CountryFlags(
      png: json['png'] as String,
    );
  }
}

// Classe représentant un pays
class Country {
  final String name;
  final List<double> latlng;
  final CountryFlags flags;

  // Constructeur prenant le nom, la latitude/longitude et les drapeaux du pays
  Country({required this.name, required this.latlng, required this.flags});

  // Fabrique pour créer une instance de Country à partir d'un objet JSON
  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name']['common'],
      latlng: (json['latlng'] as List).cast<double>(),
      flags: CountryFlags.fromJson(json['flags']), // Parse l'objet flags
    );
  }
}

// Écran des détails du pays
class CountryDetailsScreen extends StatelessWidget {
  final Country country;

  // Constructeur prenant un objet Country pour afficher les détails
  const CountryDetailsScreen({required this.country, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Country Details'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Card(
            color: Colors.amber,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    country.flags.png, // Utilise la propriété png de flags
                    width: 100,
                    height:
                        60, // Ajuste la largeur et la hauteur selon les besoins
                  ),
                  Text('Name: ${country.name}'),
                  const SizedBox(height: 10),
                  Text('LatLng: ${country.latlng[0]}, ${country.latlng[1]}'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Retourne à l'écran de la carte
                    },
                    child: const Text('Go Back to Map'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
