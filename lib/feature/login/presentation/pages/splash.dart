// import 'package:e_store/config/routes/routes.dart';
// import 'package:e_store/feature/login/presentation/pages/login.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   @override
//   void initState() {
//     super.initState();
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
//     Future.delayed(Duration(seconds: 2,), () {
//       Navigator.of(context).pushReplacement(
//           MaterialPageRoute(builder: (_) => LoginScreen()
//           ));
//     });
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     SystemChrome.setEnabledSystemUIMode(
//         SystemUiMode.manual, overlays: SystemUiOverlay.values);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
