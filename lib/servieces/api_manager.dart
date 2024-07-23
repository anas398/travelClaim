
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:travel_claim/model/branchDropdownModel.dart';
import 'package:travel_claim/servieces/app_exception.dart';
import 'package:travel_claim/views/components/common.dart';


import '../global/globalValues.dart';


class ApiManager {

  var baseUrl = "https://info91.co.in"; //Test



  var token =   Global().wstrToken;

  var g =Global();
  var postloding =false;

  fnLoading(){
    return Get.dialog(
      barrierDismissible: false, // user must tap button!
      barrierColor: Colors.transparent,
      const AlertDialog (
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: CupertinoActivityIndicator(
          animating: true,
          radius: 20,
        ),
      ),
    );
  }


  //==================================================================GET
  Future<dynamic> get(String api,[header]) async {

    var uri = Uri.parse(baseUrl + api);
    try {
      dprint("uriuriuri>>> ${uri}");
      var response = await http.get(uri,headers: header);
      return _processResponse(response,false);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('API not responded in time', uri.toString());
    }
  }

  //==================================================================POST
  Future<dynamic> post(String api, dynamic body) async {
    dprint("Endpointtt.............. ${api}");

      var url="${baseUrl+'/'+ api}";
      var uri = Uri.parse(url);
      dprint("Uriiiddd......... ${uri}");
      var payload = body;
      try {
        var response = await http.post(uri,
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'TOKEN': g.wstrToken
            },
            body: payload);

        dprint("postLodingpostLoding>>> ${postloding}");


        return _processResponse(response,false);
      } on SocketException {
        throw FetchDataException('No Internet connection', uri.toString());
      } on TimeoutException {
        throw ApiNotRespondingException('API not responded in time', uri.toString());
      }
  }


  Future<dynamic> postLoading(String api, dynamic body) async {
    fnLoading();
    dprint("Endpointtt.............. ${api}");


      var url="${baseUrl+'/'+ api}";
      var uri = Uri.parse(url);
      dprint("Uriiiddd......... ${uri}");


      var payload = body;
      try {
        var response = await http.post(uri,
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
             // 'COMPANY' : g.wstrCompany,
             // 'YEARCODE' : g.wstrYearcode,
              'TOKEN': g.wstrToken
            },
            body: payload);

        dprint(payload);

        return _processResponse(response,true);
      } on SocketException {
        Get.back();
        throw FetchDataException('No Internet connection', uri.toString());
      } on TimeoutException {
        Get.back();
        throw ApiNotRespondingException('API not responded in time', uri.toString());
      }


  }
  Future<dynamic> getLoADING(String api,[header]) async {
    fnLoading();
    var uri = Uri.parse(baseUrl + api);
    try {
      dprint("uriuriuri>>> ${uri}");
      var response = await http.get(uri,headers: header);
      return _processResponse(response,true);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('API not responded in time', uri.toString());
    }
  }

  //==================================================================RESPONSE
  dynamic _processResponse(http.Response response,bool isLoading) {
    dprint("responseeeeeeeeeeeee");
    dprint(response.statusCode);
    dprint("POST___LOADING>>> ${isLoading}");
    if(isLoading){
      Get.back();
    }
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body);
        return responseJson;
        break;
      case 201:
        var responseJson = jsonDecode(response.body);
        return responseJson;
        break;
      case 204:
        var responseJson = jsonDecode(response.body);
        return responseJson;
        break;
      case 400:
        throw BadRequestException(utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 401:
        throw UnAuthorizedException(utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 403:
        throw UnAuthorizedException(utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 422:
        throw BadRequestException(utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
        throw BadRequestException(utf8.decode(response.bodyBytes), response.request!.url.toString());
      default:
        throw FetchDataException('BE100', response.request!.url.toString());
    }
  }


  Future getBranches(url)async{
    try{
      final response = await http.get(url);
      final body =json.decode(response.body) ;

      if(response.statusCode==200){
        return body.map((e){
          final map = e as Map<String,dynamic>;
          return BranchDropdownModel(
            branchID:map["branchID"],
            branchCode: map["branchCode"],
            branchName: map["branchName"],
          );
        }
        ).toList();
      }
    }on SocketException {
      throw FetchDataException('No Internet connection', url.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('API not responded in time', url.toString());
    }
  }



  //==========================================================================image

  Future<File> getFileFromUrl(String url, {name}) async {
    dprint("urllllllllll ${url}");
    var fileName = 'testonline';
    if (name != null) {
      fileName = name;
    }
    try {
      var data = await http.get(Uri.parse(url));
      dprint("detttttt>${data.bodyBytes}");
      var bytes = data.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/" + fileName + ".pdf");
      print("PAATHH>>>>> ${dir.path}");
      File urlFile = await file.writeAsBytes(bytes);
      return urlFile;
    } catch (e) {
      throw Exception("Error opening url file");
    }
  }


}