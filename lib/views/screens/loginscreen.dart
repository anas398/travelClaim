// import 'package:bounce/bounce.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:travel_claim/controllers/login_controllers.dart';
// import 'package:travel_claim/views/components/bg.dart';
// import 'package:travel_claim/views/components/common.dart';
// import 'package:travel_claim/views/components/textFieldContainer.dart';
// import 'package:travel_claim/views/components/textInputField.dart';
// import 'package:travel_claim/views/const/appassets.dart';
// import 'package:travel_claim/views/screens/dashboard.dart';
// import 'package:travel_claim/views/screens/profilescreen.dart';
// import 'package:travel_claim/views/screens/test.dart';
//
// import '../style/colors.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//     final LoginController loginController = Get.put(LoginController());
//
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//
//
//       extendBody: true,
//
//
//       backgroundColor: primaryColor,
//       body: Container(
//         height: size.height,
//         width: size.width,
//         child: Column(
//           children: [
//             Container(
//               decoration: boxImageDecoration(AppAssets.backimg, 0),
//               width: size.width,
//               height: size.height*0.55,
//               child: Center(
//                 child:Image.asset(AppAssets.appIcon) ,
//               ),
//
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal:18, ),
//               decoration: boxDecorationC(greyLight, 30, 30, 0, 0),
//               width: size.width,
//
//               height: size.height*0.45,
//               child: Obx(()=>Column(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   gapHC(20),
//                   Expanded(
//                     child: SingleChildScrollView(
//                       child: Column(
//                         // / mainAxisSize: MainAxisSize.min,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           thb("Lets sign you in", Colors.black),
//                           gapHC(10),
//                           ts("Employee ID", Colors.black),
//                           gapHC(3),
//                           TextinputfieldContainer(
//                               showIcon: false,
//                               isEnable: true,
//                               isObscure: false,
//
//                               hintText: "Enter your employee ID",
//                               controller: loginController.txtempId,
//                               keybordType: TextInputType.text),
//                           gapHC(15),
//                           ts("Password", Colors.black),
//                           gapHC(5),
//                           TextinputfieldContainer(
//                               showIcon: true,
//                               suffixIcon:loginController.passWordView.value==true? Icons.visibility_outlined:Icons.visibility_off_outlined,
//                               suffixIconOnclick: (){
//                                 dprint( loginController.passWordView.value);
//                                 //loginController.passWordView.value =  loginController.passWordView.value? false:true;
//                                 loginController.passWordView.value =!  loginController.passWordView.value;
//                               },
//                               validate:(value){
//                                 if(value.isEmpty ||value==null){
//                                   return "Please Enter a Value";
//                                 }else{
//                                   return null;
//                                 }
//                               },
//                               isObscure: loginController.passWordView.value,
//                               isEnable: true,
//
//                               hintText: "Enter your password",
//                               controller: loginController.txtpassword,
//                               keybordType: TextInputType.text),
//                           gapHC(30),
//                           Bounce(
//                             duration: Duration(seconds: 110),
//                             onTap: (){
//                               Get.to(Dashboard());
//                             },
//                             child: Container(
//                               width: double.infinity,
//                               padding: EdgeInsets.symmetric(vertical: 12),
//
//                               decoration: boxBaseDecoration(primaryColor, 10),
//                               child: Center(child: tc("LOGIN", Colors.white,14)),
//
//                             ),
//                           )
//
//
//                         ],
//                       ),
//                     ),
//                   ),
//                   gapHC(10),
//                   tss("cc@2024myGtravelClaim", Colors.black, 13.0)
//                   ,gapHC(10),
//                 ],
//               )),
//
//             )
//           ],
//         ),
//       )
//     );
//   }
// }
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_claim/controllers/login_controllers.dart';
import 'package:travel_claim/views/components/bg.dart';
import 'package:travel_claim/views/components/common.dart';
import 'package:travel_claim/views/components/textFieldContainer.dart';
import 'package:travel_claim/views/components/textInputField.dart';
import 'package:travel_claim/views/screens/dashboard.dart';
import 'package:travel_claim/views/screens/test.dart';

import '../style/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController loginController = Get.put(LoginController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(


      extendBody: true,


      backgroundColor: primaryColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: 0.7,
            child: backgroundImg(context,-0.27, 0.51),

          ),
          FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.46,
            child: Container(
              decoration:boxBaseDecorationC(Colors.white,
                  30, 30, 0, 0),
              padding: EdgeInsets.symmetric(horizontal:16, ),

              child: Obx(()=>Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  gapHC(20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        // / mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          thb("Lets sign you in", Colors.black),
                          gapHC(10),
                          ts("Employee ID", Colors.black),
                          gapHC(3),
                          TextinputfieldContainer(
                              showIcon: false,
                              isEnable: true,
                              isObscure: false,

                              hintText: "Enter your employee ID",
                              controller: loginController.txtempId,
                              keybordType: TextInputType.text),
                          gapHC(15),
                          ts("Password", Colors.black),
                          gapHC(5),
                          TextinputfieldContainer(
                              showIcon: true,
                              maxline: 1,
                              suffixIcon:loginController.passWordView.value==true? Icons.visibility_outlined:Icons.visibility_off_outlined,
                              suffixIconOnclick: (){
                                dprint( loginController.passWordView.value);
                                //loginController.passWordView.value =  loginController.passWordView.value? false:true;
                                loginController.passWordView.value =!  loginController.passWordView.value;
                              },
                              validate:(value){
                                if(value.isEmpty ||value==null){
                                  return "Please Enter a Value";
                                }else{
                                  return null;
                                }
                              },
                              isObscure: loginController.passWordView.value,
                              isEnable: true,

                              hintText: "Enter your password",
                              controller: loginController.txtpassword,
                              keybordType: TextInputType.text),
                          gapHC(30),
                          Bounce(
                            duration: Duration(seconds: 110),
                            onTap: (){
                              Get.off(Dashboard());
                            },
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(vertical: 12),

                              decoration: boxBaseDecoration(primaryColor, 10),
                              child: Center(child: tc("LOGIN", Colors.white,14)),

                            ),
                          )


                        ],
                      ),
                    ),
                  ),
                  gapHC(10),
                  tss("cc@2024myGtravelClaim", Colors.black, 13.0)
                  ,gapHC(10),
                ],
              )),
            ),

          ),

        ],
      ),
    );
  }
}
