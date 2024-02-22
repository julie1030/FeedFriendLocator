import 'dart:convert';
import 'package:feedfriendlocator/country.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Country Maps',
      theme: ThemeData(
        primarySwatch: Color.fromARGB(255, 237, 241, 124),
        secondaryHeaderColor: Color.fromARGB(255, 141, 142, 120),
      ),
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  List<Country> countries = [];
  Country? selectedCountry;

  @override
  void initState() {
    super.initState();
    fetchCountries();
  }

  Future<void> fetchCountries() async {
    final response = await http.get(Uri.parse(
        'https://restcountries.com/v3.1/all?fields=name,latlng,flags'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      List<Country> countryList =
          jsonResponse.map((json) => Country.fromJson(json)).toList();

      setState(() {
        countries = countryList;
      });
    } else {
      throw Exception('Failed to load countries');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country Maps'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              onMapCreated: (controller) {
                mapController = controller;
              },
              initialCameraPosition: CameraPosition(
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
          SizedBox(height: 10),
          DropdownButtonFormField<Country>(
            value: selectedCountry,
            hint: Text('Select a country'),
            onChanged: (Country? newValue) {
              setState(() {
                selectedCountry = newValue;
                if (selectedCountry != null) {
                  mapController.animateCamera(
                    CameraUpdate.newLatLng(
                      LatLng(selectedCountry!.latlng[0].toDouble(),
                          selectedCountry!.latlng[1].toDouble()),
                    ),
                  );
                }
              });
            },
            items: countries.map<DropdownMenuItem<Country>>((Country country) {
              return DropdownMenuItem<Country>(
                value: country,
                child: Text(country.name),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MapsApp());
}
