import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:travel_claim/model/expenseCategoryModel.dart';

class Addexpensecontroller extends GetxController{
    RxString lstrTypeofTrip = 'Inauguration'.obs;
    RxString lstrBranchName= 'Thrissure'.obs;
    RxString lstrTrainClass= 'AC 2 tier class'.obs;
     TextEditingController txtNoOfEmployee=TextEditingController(text: "1");
     RxBool airButtonTapped =false.obs;
    TextEditingController txtpurposeTrip = TextEditingController();
    Rx<DateTime> fromDate = DateTime.now().obs;
    RxList selectedChips = [].obs;
    RxList selectedCtegory = [].obs;

    RxList<String> chipsList = ['Abh(MYGX-1234)', 'Abh', 'Abhin', 'Abhin(MYGX-1234)'].obs;
    RxList<String> trainClassList = ['AC 2 tier class', 'AC 3 tier class', 'AC 2tier class/chainr class', 'Sleeper'].obs;



    void deleteChip(String chip) {

      selectedChips.remove(chip);

    }
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


    final RxList<Map<String, dynamic>> expenseCategory = [
      {"image":"assets/icons/flight.png",'label': 'Air', 'value': false,"expand":false},
      {"image":"assets/icons/train.png",'label': 'Train', 'value': false,"expand":false},
      {"image":"assets/icons/bedrom.png",'label': 'Lodging', 'value': false,"expand":false},
      {"image":"assets/icons/fastfood.png",'label': 'Food', 'value': false,"expand":false},
      {"image":"assets/icons/bus.png",'label': 'Bus', 'value': false,"expand":false},
      {"image":"assets/icons/fuel.png",'label': 'Fuel', 'value': false,"expand":false},
      {"image":"assets/icons/entertain.png",'label': 'Entertainment', 'value': false,"expand":false},
    ].obs;
    fnOnChnageTrip(val,mode) {
      if(mode=="Trip"){
        lstrTypeofTrip.value = val;
      }
      else if(mode=="Branch"){
        lstrBranchName.value = val;
      }
      else if(mode=="Train"){
        lstrTrainClass.value = val;
      }


    }
    Future<void> wSelectFromDate(BuildContext context) async {
      final DateTime? pickedDate = await showDatePicker(
          context: context,
          firstDate: DateTime(2023, 1),
          lastDate: DateTime(2050, 8),
          initialDate: DateTime.now());
      if (pickedDate != null && pickedDate != fromDate.value) {
        fromDate.value = pickedDate;


      }
    }



}