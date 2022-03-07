// // ignore_for_file: file_names

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:whatsapp/Connection_Check/Connection_Check.dart';

// class NoConnectionScreen extends StatefulWidget {
//   NoConnectionScreen({Key? key}) : super(key: key);

//   @override
//   State<NoConnectionScreen> createState() => _NoConnectionScreenState();
// }

// class _NoConnectionScreenState extends State<NoConnectionScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         brightness: Brightness.light,
//       ),
//       body: Center(
//         child: Consumer<ConnectivityChangeNotifier>(
//           builder: (BuildContext context,
//               ConnectivityChangeNotifier connectivityChangeNotifier,
//               Widget child) {
//             return Column(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Flexible(
//                   child: Image.asset(
//                     connectivityChangeNotifier.svgUrl,
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//                 Flexible(
//                   child: Padding(
//                     padding: const EdgeInsets.fromLTRB(30.0, 20, 30, 100),
//                     child: Text(
//                       connectivityChangeNotifier.pageText,
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//                 if (connectivityChangeNotifier.connectivity !=
//                     ConnectivityResult.wifi)
//                   Flexible(
//                     child: RaisedButton(
//                       child: Text('Open Settings'),
//                       onPressed: () => AppSettings.openAppSettings(),
//                     ),
//                   )
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
