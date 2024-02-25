import 'dart:convert';
import 'package:feedfriendlocator/country.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Application principale qui utilise le widget MaterialApp
class MapsApp extends StatelessWidget {
  const MapsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Country Maps',
      theme: ThemeData(
          primarySwatch: Colors.yellow, secondaryHeaderColor: Colors.grey),
      home: const MapScreen(),
    );
  }
  // ThemeData _builCustomTheme() {
  //   final ThemeData.light();
  //   final ColorScheme=ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 156, 56, 108) );
  //   return base.copyWith();

  // }
}

// Écran de la carte qui utilise le widget StatefulWidget
class MapScreen extends StatefulWidget {
  const MapScreen({super.key});
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  List<Country> countries = [];
  Country? selectedCountry;

  // @override
  // void initState() {
  //   super.initState();
  //   fetchCountries();
  // }

  @override
  void initState() {
    super.initState();
    // selectedCountry = countries.isNotEmpty ? countries.first : null;
    // Permet que selectedCountry soit initialisé à une valeur non-nulle.
    fetchCountries();
  }

  // Fonction asynchrone pour récupérer la liste des pays depuis une API
  Future<void> fetchCountries() async {
    final response = await http.get(Uri.parse(
        'https://restcountries.com/v3.1/all?fields=name,latlng,flags'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      List<Country> countryList =
          jsonResponse.map((json) => Country.fromJson(json)).toList();

      // Met à jour la liste des pays dans l'état
      setState(() {
        countries = countryList;
      });
    } else {
      // En cas d'échec, lève une exception
      throw Exception('Failed to load countries');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Country Maps'),
        backgroundColor: Colors.yellow,
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              onMapCreated: (controller) {
                mapController = controller;
              },
              initialCameraPosition: const CameraPosition(
                target: LatLng(0, 0),
                zoom: 6,
              ),
              markers: selectedCountry != null
                  ? {
                      Marker(
                        markerId: MarkerId(selectedCountry!.name),
                        position: LatLng(selectedCountry!.latlng[0].toDouble(),
                            selectedCountry!.latlng[1].toDouble()),
                        infoWindow: InfoWindow(
                          title: selectedCountry!.name,
                        ),
                        onTap: () {
                          // Navigation vers l'écran de détails du pays
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CountryDetailsScreen(
                                  country: selectedCountry!),
                            ),
                          );
                        },
                      ),
                    }
                  : {},
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors
                  .yellow[200], // Couleur d'arrière-plan du menu déroulant
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: DropdownButtonFormField<Country>(
              value: selectedCountry,
              hint: const Text(
                'Select a country',
                style: TextStyle(
                  color: Colors.grey, // Couleur du texte
                ),
              ),
              onChanged: (Country? newValue) {
                setState(() {
                  selectedCountry = newValue;
                  if (selectedCountry != null) {
                    // Anime la caméra vers la position du pays sélectionné
                    mapController.animateCamera(
                      CameraUpdate.newLatLng(
                        LatLng(
                          selectedCountry!.latlng[0].toDouble(),
                          selectedCountry!.latlng[1].toDouble(),
                        ),
                      ),
                    );
                  }
                });
              },
              items:
                  countries.map<DropdownMenuItem<Country>>((Country country) {
                return DropdownMenuItem<Country>(
                  value: country,
                  child: Text(country.name),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// Fonction principale qui exécute l'application
void main() {
  runApp(const MapsApp());
}
