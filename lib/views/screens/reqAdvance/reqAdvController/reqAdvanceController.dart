import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestAdvancecontroller extends GetxController{
  Rx<DateTime> reqDate = DateTime.now().obs;
  RxString lstrTypeofTrip = 'Inauguration'.obs;
  RxString lstrBranchName= 'Thrissure'.obs;
  TextEditingController txtpurposeTrip = TextEditingController();
  TextEditingController txtRemark = TextEditingController();
  var typeOfTripList = [
    'Inauguration',
    'Branch Visit',
    'Others',

  ];
  var branchList = [
    'Thrissure',
    'Thiruvananthapuram',
    'Thamarassery',

  ];

  Future<void> wSelectFromDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        firstDate: DateTime(2023, 1),
        lastDate: DateTime(2050, 8),
        initialDate: DateTime.now());
    if (pickedDate != null && pickedDate != reqDate.value) {
      reqDate.value = pickedDate;


    }
  }
  fnOnChnageTripBranch(val,mode) {
    if(mode=="Trip"){
      lstrTypeofTrip.value = val;
    }else if(mode=="Branch"){
      lstrBranchName.value = val;
    }


  }

}