import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_claim/global/globalValues.dart';
import 'package:travel_claim/servieces/api_controller.dart';
import 'package:travel_claim/views/components/common.dart';
import 'package:travel_claim/views/const/appstring.dart';

import 'package:travel_claim/views/screens/dashboard/dashboard.dart';
import 'package:travel_claim/views/screens/newClaim/newclaim_controller/addExpenseController.dart';
import 'package:travel_claim/views/style/colors.dart';

class LoginController extends GetxController{

  TextEditingController txtempId= TextEditingController();
  TextEditingController txtpassword= TextEditingController();
  RxBool passWordView = true.obs;
  RxBool loginsts = true.obs;
  late Future <dynamic> futureform;
  final formKey = GlobalKey<FormState>();
  var g =Global();
  //=======================================================Functions

  fnLogin(context)async{
    dprint("LOOOOOOOOOOOOOOOOOOGGGIN");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (formKey.currentState!.validate()) {
      var empId =txtempId.text.trim();
      var password =txtpassword.text.trim();
      // TODO submit
        dprint("empId>>>> ${empId}");
        dprint("password>>>> ${password}");
        await prefs.setString(AppStrings.sp_empid, empId.toString());
        await prefs.setString(AppStrings.sp_password, password.toString());

        // await Prefs.setString(AppStrings.sp_password, password.toString());
      }
      // TODO submit
      dprint("apilooooooooooooogin");
      apiLogin();
    }


//=======================================================API
  apiLogin(){
    if(formKey.currentState!.validate()){
      dprint("usernameeeee ${txtempId.text.toString()}");
      dprint("passworddddd ${txtpassword.text.toString()}");
      loginsts.value = false;
      futureform = ApiCall().apiLogin(txtempId.text.toString().trim(),txtpassword.text.toString().trim());
      futureform.then((value) => apiLoginRes(value));
    }

  }
  apiLoginRes(value){
    try{
      dprint("Apiiiivaluee......................");
      dprint(value);
      loginsts.value = true;
      if(g.fnValCheck(value)){
        var sts  =  value["success"];
        var msg  =  value["message"]??"";
        if(sts=="success"){

          var data =  value["data"];
          var token =  value["token"];
          dprint("tokennnn > >> > ${token}");
          var aceessToken = token["original"]["access_token"];
          var emp_id = data["emp_id"]??"";
          var emp_name = data["emp_name"]??"";
          var emp_location = data["emp_baselocation"]??"";
          g.wstrToken  =  aceessToken;
          g.wstrEmpId  =  emp_id??"";
          g.wstrEmpName  =  emp_name??"";
          g.wstrempLocation  =  emp_location??"";

          Get.offAll(()=>const Dashboard());
        }
        else{
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
    }catch(e){
      dprint(e);
    }


  }


  }




