// import 'package:flutter/material.dart';
// import 'package:trackin_n_bingein/styling/styling.dart';
// // import 'package:trackin_n_bingein/screens/navigation.dart';
// import 'package:trackin_n_bingein/buttons/buttons.dart';

// class Interests extends StatefulWidget {
//   final String username; // Add a username parameter

//   const Interests({Key? key, required this.username}) : super(key: key);
  
//   @override
//   _InterestsState createState() => _InterestsState();
// }

// class _InterestsState extends State<Interests> {
//   final List<String> _interests = ['Books', 'Podcasts', 'Movies', 'Social Media', 'Games', 'Blogs'];
//   final List<String> _selectedInterests = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Choose your interests', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
//             Text('Choose as many as you want.', style: TextStyle(fontSize: 20)),
//             SizedBox(height: 16),
//             Expanded(
//               child: GridView.count(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 8,
//                 mainAxisSpacing: 8,
//                 children: _interests.map((interest) {
//                   final isSelected = _selectedInterests.contains(interest);
//                   return GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         if (isSelected) {
//                           _selectedInterests.remove(interest);
//                         } else {
//                           _selectedInterests.add(interest);
//                         }
//                       });
//                     },
//                     child: Card(
//                       color: isSelected ? Styling.textColor3 : Colors.white,
//                       child: Center(
//                         child: Text(
//                           interest,
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: isSelected ? Colors.white : Colors.black,
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),
//             SizedBox(
//               width: double.infinity,
//               child: Buttons.continueButton(context, _selectedInterests),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
