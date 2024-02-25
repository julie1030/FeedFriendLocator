

// DropdownButtonFormField<Country>(
//   value: selectedCountry,
//   hint: const Text(
//     'Select a country',
//     style: TextStyle(
//       color: Colors.grey, // Vous pouvez utiliser une couleur de votre choix
//     ),/   onChanged: (Country? newValue) {
//     setState(() {
//       selectedCountry = newValue;
//       if (selectedCountry != null) {
//         // Anime la caméra vers la position du pays sélectionné
//         mapController.animateCamera(
//           CameraUpdate.newLatLng(
//             LatLng(
//               selectedCountry!.latlng[0].toDouble(),
//               selectedCountry!.latlng[1].toDouble(),
//             ),
//           ),
//         );
//       }
//     });
//   },
//   items: countries.map<DropdownMenuItem<Country>>((Country country) {
//     return DropdownMenuItem<Country>(
//       value: country,
//       child: Text(
//         country.name,
//         style: TextStyle(
//           color: Theme.of(context).textTheme.bodyText1!.color,
//           // Utilisez la couleur du texte du thème pour le style du texte
//         ),
//       ),
//     );
//   }).toList(),
// ),
