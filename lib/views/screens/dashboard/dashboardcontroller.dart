import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:travel_claim/global/globalValues.dart';
import 'package:travel_claim/servieces/api_controller.dart';
import 'package:travel_claim/views/components/common.dart';
import 'package:travel_claim/views/screens/login/loginscreen.dart';
import 'package:travel_claim/views/style/colors.dart';

class Dashboardcontroller extends GetxController {
  late Future <dynamic> futureform;
  var g = Global();

  apiLogout() {
    futureform = ApiCall().apiLogOut();
    futureform.then((value) => apiLogoutRes(value));
  }

  apiLogoutRes(value) {
    try {
      dprint("Apiiiivaluee......................");
      dprint(value);

      if(g.fnValCheck(value)){
        var sts  =  value["success"];
        var msg  =  value["message"]??"";
        if(sts=="success"){
         Get.offAll(()=>const LoginScreen());
          Fluttertoast.showToast(
              msg: msg,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: primaryColor,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }else{
          Fluttertoast.showToast(
              msg: msg,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: primaryColor,
              textColor: Colors.white,
              fontSize: 16.0
          );
            }
      }
    } catch (e) {
      dprint(e);
    }
  }
}

