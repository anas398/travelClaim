import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_claim/views/components/common.dart';
import 'package:travel_claim/views/components/customButton.dart';
import 'package:travel_claim/views/const/appassets.dart';
import 'package:travel_claim/views/style/colors.dart';

Future<void> show(context,child,{contWidth,contHeight,autoDismiss}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      Size size = MediaQuery.of(context).size;
      autoDismiss?  Future.delayed(Duration(seconds: 2), () {
        Navigator.of(context).pop(); // Close the dialog
      }):false;

      return AlertDialog(contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.zero,
          content: Container(
            width: contWidth?? size.width*0.9,
            child: child,
            height:contHeight?? size.height*0.7,
            decoration: boxDecoration(Colors.white, 10),

          ));
    },
  );
}

Future bottomsheet(context,status,type, { VoidCallback ? ontap}) {
  String txtst = status=="approve"?"approve":status=="reject"?"reject":"";
  String buttontxtst = status=="approve"?"Approve":status=="reject"?"Reject":"";
  String types = type=="cmd"?"claim":type=="Adv"?"advance":"";
  return Get.bottomSheet(

    Container(
        height: MediaQuery.of(context).size.height/2,
        width: MediaQuery.of(context).size.width,

        decoration: boxBaseDecorationC(Colors.white, 20, 20, 0, 0),
        child:  Padding(
          padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: Column(
                //  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(status=="approve"? AppAssets.sentpng:AppAssets.reject),
                    gapHC(20),
                    tcCustomhead("Are you sure you want to \n"
                        "${txtst} the ${types}?", Colors.black87,
                        size: 21.0,
                        align: TextAlign.center, FontWeight.w500)
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child:Custombutton(onTap: (){
                        // bottomsheet(context);
                        Get.back();
                      }
                          , buttonName: "Cancel",
                          buttonColor: Colors.white,
                          buttonBorderColor:Colors.grey.shade400,
                          buttonTextColor: Colors.black)),
                  gapWC(20),
                  Expanded(
                      child:Custombutton(onTap:ontap!,
                          buttonName: buttontxtst,
                          buttonColor: primaryColor,
                          buttonTextColor: Colors.white)
                  ),
                ],
              ),

            ],
          ),
        )
    ),


    isDismissible: false,


    enableDrag: false,

  );
}