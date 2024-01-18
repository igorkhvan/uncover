// import 'package:uncover/logic/services/shared_prefs_service.dart';
// import 'package:flutter/material.dart';
//
//
//
// class SideDrawer extends StatelessWidget {
//   final SharedPrefs sharedPrefs = SharedPrefs();
//
//   SideDrawer({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Theme.of(context).primaryColor.withAlpha(240),
//       width: MediaQuery.of(context).size.width * 0.8,
//       height: MediaQuery.of(context).size.height,
//       child: Column(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height * 0.07,
//           ),
//           Text(
//             // 'UserName',
//             Provider.of<AccountProvider>(context).account.firstName,
//             style: Theme.of(context).textTheme.headline1,
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Divider(),
//           Expanded(
//             child: ListView(
//               children: <Widget>[
//                 ListTile(
//                   title: Text(
//                     "Мой гараж",
//                     style: Theme.of(context).textTheme.caption,
//                   ),
//                   trailing: Icon(
//                     Icons.arrow_forward,
//                     size: 20,
//                   ),
//                   onTap: () {
//                     Navigator.of(context).pop();
//                     Navigator.pushNamed(context, GarageScreen.id);
//                   },
//                 ),
//                 ListTile(
//                   title: Text(
//                     "Услуги",
//                     style: Theme.of(context).textTheme.caption,
//                   ),
//                   trailing: Icon(
//                     Icons.arrow_forward,
//                     size: 20,
//                   ),
//                   onTap: () {
//                     Navigator.of(context).pop();
//                     Navigator.pushNamed(context, GarageScreen.id);
//                   },
//                 ),
//                 ListTile(
//                   title: Text(
//                     "Избранное",
//                     style: Theme.of(context).textTheme.caption,
//                   ),
//                   trailing: Icon(
//                     Icons.arrow_forward,
//                     size: 20,
//                   ),
//                   onTap: () {
//                     Navigator.of(context).pop();
//                     Navigator.pushNamed(context, GarageScreen.id);
//                   },
//                 ),
//                 ListTile(
//                   title: Text(
//                     "Новая машина",
//                     style: Theme.of(context).textTheme.caption,
//                   ),
//                   trailing: Icon(
//                     Icons.arrow_forward,
//                     size: 20,
//                   ),
//                   onTap: () {
//                     Navigator.of(context).pop();
//                     Navigator.pushNamed(context, AddCarScreen.id);
//                   },
//                 ),
//               ],
//             ),
//           ),
//           Divider(),
//           ListTile(
//             title: Text(
//               "Выход",
//               style: Theme.of(context).textTheme.caption,
//             ),
//             trailing: Icon(
//               Icons.arrow_forward,
//               size: 20,
//             ),
//             onTap: () {
//               sharedPrefs.deleteAccount();
//               Navigator.of(context).pop();
//               Navigator.pushNamed(context, LoginScreen.id);
//             },
//           ),
//           Container(
//             height: MediaQuery.of(context).size.height * 0.06,
//           ),
//         ],
//       ),
//     );
//   }
// }
