import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:travel_claim/views/const/appassets.dart';
import 'package:travel_claim/views/screens/loginscreen.dart';
import 'package:travel_claim/views/screens/test.dart';
import 'package:travel_claim/views/style/colors.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Future.delayed(Duration(
      seconds: 2
    ),()=>Get.offAll(LoginScreen()));

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          Container(
            width: 58,
            color: primaryColorLight,
            height: MediaQuery.of(context).size.height,
            alignment:
            new Alignment(0, 0),
            transform:
            new Matrix4.translationValues(MediaQuery.of(context).size.width * 0.59, -29.6, 0.0)
              ..rotateZ(-27 * 3.1415927 / 180),
          ),
          Center(
              child:  Image.asset(
                  AppAssets.appIcon,

              )
          ),
          Container(
            width: 58,
            color: primaryColorLight,
            height: MediaQuery.of(context).size.height,
            alignment:
            new Alignment(0, 0),
            transform:
            new Matrix4.translationValues(MediaQuery.of(context).size.width * -0.68, 139.6, 0.0)
              ..rotateZ(-27 * 3.1415927 / 180),
          ),



        ],

      ),
    );
  }
}
