// DropdownButtonFormField<Country>(
//   value: selectedCountry,
//   hint: Text(
//     'Select a country',
//     style: TextStyle(
//       color: Colors.grey,
//     ),
//   ),
//   onChanged: (Country? newValue) {
//     setState(() {
//       selectedCountry = newValue;
//       // ...
//     });
//   },
//   items: countries.map<DropdownMenuItem<Country>>((Country country) {
//     return DropdownMenuItem<Country>(
//       value: country,
//       child: Text(country.name),
//     );
//   }).toList(),
// ),
