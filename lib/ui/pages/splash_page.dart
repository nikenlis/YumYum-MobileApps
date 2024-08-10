// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:yumyum_amicta/shared/theme.dart';
// import 'package:yumyum_amicta/ui/auth/core/auth_manager_controller.dart';
// import 'package:yumyum_amicta/ui/pages/on_board_check.dart';


// class SplashPage extends StatefulWidget {
//   const SplashPage({super.key});

//   @override
//   State<SplashPage> createState() => _SplashPageState();
// }

// class _SplashPageState extends State<SplashPage> {
//  final AuthenticationManager _authManager = Get.put(AuthenticationManager());

//   Future<void> initializeSettings() async {
//     _authManager.checkLoginStatus();
//     await Future.delayed(const Duration(seconds: 2));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: initializeSettings(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           print("dijalankan");
//           return splashView();
//         } else {
//           if (snapshot.hasError) {
//             return errorView(snapshot);
//           } else {
//             return OnBoardCheck();
//           }
//         }
//       },
//     );
//   }

//   Scaffold waitingView() {
//     return const Scaffold(
//         body: Center(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Padding(
//             padding: EdgeInsets.all(16.0),
//             child: CircularProgressIndicator(),
//           ),
//           Text('Loading...'),
//         ],
//       ),
//     ));
//   }

//   Scaffold splashView() {
//     var size = MediaQuery.of(context).size.width * 1.5;
//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned(
//             left: -size / 2,
//             top: -size / 2,
//             child: Container(
//               width: size,
//               height: size,
//               decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   gradient: RadialGradient(colors: [
//                     purpleColor.withOpacity(0.8),
//                     whiteColor.withOpacity(0.5)
//                   ])),
//             ),
//           ),
//           Positioned(
//             right: -size / 2,
//             bottom: -size / 6,
//             child: Container(
//               width: size,
//               height: size,
//               decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   gradient: RadialGradient(colors: [
//                     purpleColor.withOpacity(0.8),
//                     whiteColor.withOpacity(0.5)
//                   ])),
//             ),
//           ),
//           Center(
//             child: Container(
//               width: 337,
//               height: 262,
//               decoration: const BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage('assets/img_logo_splash.png'))),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
//     return Scaffold(body: Center(child: Text('Error: ${snapshot.error}')));
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumyum_amicta/controllers/pages/splash/splash_page_controller.dart';




class SplashPage extends GetView<SplashPageController> {
  const SplashPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'SplashView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}