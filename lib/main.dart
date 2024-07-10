import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:travel_claim/views/screens/dashboard.dart';
import 'package:travel_claim/views/screens/draftScreen/draftscreen.dart';
import 'package:travel_claim/views/screens/history/viewd_Innerscreen.dart';
import 'package:travel_claim/views/screens/loginscreen.dart';
import 'package:travel_claim/views/screens/newClaim/add_expense_screen.dart';
import 'package:travel_claim/views/screens/newClaim/claimconfirmation.dart';
import 'package:travel_claim/views/screens/nodatainprofile_screen.dart';
import 'package:travel_claim/views/screens/notification/notification_screen.dart';
import 'package:travel_claim/views/screens/profilescreen.dart';
import 'package:travel_claim/views/screens/reqAdvance/allAdvancescreen.dart';
import 'package:travel_claim/views/screens/reqAdvance/reqadvance_screen.dart';
import 'package:travel_claim/views/screens/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      title: 'Travel Claim',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Splashscreen(),
    );
  }
}


