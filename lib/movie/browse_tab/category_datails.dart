// import 'package:flutter/material.dart';
// import 'package:movies/model/BrowseCategories.dart';
//
// import '../../api_manager.dart';
// import '../../my_theme.dart';
// import 'category.dart';
//
// class CategortDetails extends StatefulWidget {
//   // Category category;
//   // CategortDetails({required this.category});
//
//   @override
//   State<CategortDetails> createState() => _CategortDetailsState();
// }
//
// class _CategortDetailsState extends State<CategortDetails> {
//
//   @override
//   Widget build(BuildContext context) {
//     return
//
//       FutureBuilder<BrowseCategories>(
//       future: ApiManager.getBrowseCategories(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(
//             child: CircularProgressIndicator(
//               color: MyTheme.primaryLight,
//             ),
//           );
//         } else if (snapshot.hasError) {
//           return Column(
//             children: [
//               Text(
//                 'Something went wrong',
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   ApiManager.getBrowseCategories();
//                   setState(() {});
//                 },
//                 child: Text('Try again'),
//               ),
//             ],
//           );
//         }
//
//         /// response => (status) ok-error
//         if (snapshot.data?.page != 1) {
//           // code, message
//           return Column(
//             children: [
//               Text(snapshot.data?.status_message ?? ""),
//               ElevatedButton(
//                 onPressed: () {
//                   ApiManager.getBrowseCategories();
//                   setState(() {});
//                 },
//                 child: Text('Try again'),
//               ),
//             ],
//           );
//         }
//         var sourcesList = snapshot.data?.results ?? [];
//         return Column(
//           children: [
//             ListView.builder(
//                 itemCount: sourcesList.length,
//               itemBuilder: (context, index) {
//                 return Column(
//                   children: [
//                     Text('kN'),
//                     Text('kN'),
//                     Text('kN'),
//                   ],
//                 );
//               },
//             )
//           ],
//         );
//
//
//
//
//
//       });
//   }
// }
