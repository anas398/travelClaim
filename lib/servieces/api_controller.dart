import 'dart:convert';

import 'package:get/get.dart';
import 'package:travel_claim/global/globalValues.dart';
import 'package:travel_claim/model/branchDropdownModel.dart';
import 'package:travel_claim/servieces/api_manager.dart';
import 'package:travel_claim/servieces/api_params.dart';
import 'package:travel_claim/servieces/app_exception.dart';
import 'package:travel_claim/servieces/base_controller.dart';
import 'package:travel_claim/views/components/common.dart';
import 'package:travel_claim/views/const/appstring.dart';



class ApiCall  extends  BaseController{

  var g =Global();



  //============================================LOGIN
  Future<dynamic> apiLogin(empid,password) async{
    var request = jsonEncode(<dynamic, dynamic>{
      'emp_id':empid,
      'password':password,

    });
    dprint('myg/api/auth/login');
    dprint(request);
    var response = await ApiManager().post('myg/api/auth/login',request).catchError((error){
      if (error is BadRequestException) {
      } else {
        handleError(error);
      }
    });
    dprint("response,,,,,,,");
    dprint(response);
    if (response == null) return;

    return response;

  }

  Future<dynamic> apiLogOut() async{
    // var request = jsonEncode(<dynamic, dynamic>{
    //   'emp_id':empid,
    //   'password':password,
    //
    // });
    var request='';
    dprint('myg/api/auth/logout');
    // dprint(request);
    var response = await ApiManager().post('myg/api/auth/logout',request).catchError((error){
      if (error is BadRequestException) {
      } else {
        handleError(error);
      }
    });
    dprint("response,,,,,,,");
    dprint(response);
    if (response == null) return;

    return response;

  }
  Future<dynamic> apiGetBranches() async{
    dprint('myg/api/branches');
    Map<String, String> header = {
      AppStrings.authorization: AppStrings.bearer + g.wstrToken,
    };
    var response = await ApiManager().get('/myg/api/branches',header).catchError((error){
      if (error is BadRequestException) {
      } else {
        handleError(error);
      }
    });
    dprint("response,,,,,,,");
    dprint(response);
    if (response == null) return;

    return response;

  }

  Future<dynamic> apiGettypeTrip() async{
    dprint('myg/api/tripTypes');
    Map<String, String> header = {
      AppStrings.authorization: AppStrings.bearer + g.wstrToken,
    };
    var response = await ApiManager().get('/myg/api/tripTypes',header).catchError((error){
      if (error is BadRequestException) {
      } else {
        handleError(error);
      }
    });
    dprint("response,,,,,,,");
    dprint(response);
    if (response == null) return;

    return response;

  }
  Future<dynamic> apiGetCategorys() async{
    dprint('myg/api/categories');
    Map<String, String> header = {
      AppStrings.authorization: AppStrings.bearer + g.wstrToken,
    };
    var response = await ApiManager().get('/myg/api/categories',header).catchError((error){
      if (error is BadRequestException) {
      } else {
        handleError(error);
      }
    });
    dprint("response,,,,,,,");
    dprint(response);
    if (response == null) return;

    return response;

  }
  Future<dynamic> apiGetProfileDatas() async{
    dprint('myg/api/user-profile');
    Map<String, String> header = {
      AppStrings.authorization: AppStrings.bearer + g.wstrToken,
    };
    var response = await ApiManager().get('/myg/api/user-profile',header).catchError((error){
      if (error is BadRequestException) {
      } else {
        handleError(error);
      }
    });
    dprint("response,,,,,,,");
    dprint(response);
    if (response == null) return;

    return response;

  }


}