import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  TextEditingController txtempId= TextEditingController();
  TextEditingController txtpassword= TextEditingController();

  RxBool passWordView = true.obs;
}