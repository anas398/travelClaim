import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:travel_claim/views/components/bg.dart';
import 'package:travel_claim/views/components/common.dart';
import 'package:travel_claim/views/const/appassets.dart';
import 'package:travel_claim/views/screens/profile/profile_controller.dart';
import 'package:travel_claim/views/style/colors.dart';
import 'package:travel_claim/views/widgets.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  final ProfileController profileController =
  Get.put(ProfileController());
  @override
  void initState() {
    Future.delayed(const Duration(
      seconds: 2
    ),(){
      profileController.apiGetProfile();
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Obx(()=>Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar("Profile"),
        body:profileController.isLoading.value ? Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                gapHC(25),
                Obx(()=>  CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(0.1),
                  radius: 45.0,
                  //       name.toString().isNotEmpty? thbAppbar(name[0], primaryColor)
                  child:
                  profileController.lstrEmpName.value.isNotEmpty?
                  tcustom(profileController.lstrEmpName.value[0].toString(),primaryColor,30.0,FontWeight.bold):SizedBox(),
                ),),
                gapHC(15),

                Divider(color: Colors.grey.shade300,),
                gapHC(10),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20
                  ),
                  decoration: boxBaseDecoration(greyLight, 8),
                  child: Obx(()=>Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      headTitle("Employee ID", profileController.lstrEmpId.value.toString()),
                      gapHC(10),
                      headTitle("Employee name",profileController.lstrEmpName.value.toString()),
                      gapHC(10),
                      headTitle("Department", profileController.lstrEmpDepartment.value.toString()),
                      gapHC(10),
                      headTitle("Branch", profileController.lstrEmpBranch.value.toString()),
                      gapHC(10),
                      headTitle("Base location", profileController.lstrEmpBaseLoc.value.toString()),
                      gapHC(10),
                      headTitle("Designation",profileController.lstrEmpDesignation.value.toString()),
                      gapHC(10),
                      headTitle("Grade", profileController.lstrEmpGrade.value.toString()),
                      gapHC(10),
                      headTitle("Reporting Person", profileController.lstrEmpReportingperson.value.toString()),
                      gapHC(10),
                      headTitle("Email", profileController.lstrEmpEmail.value.toString()),
                      gapHC(10),
                      headTitle("Mobile Number", profileController.lstrEmpMobileNo.value.toString()),


                    ],

                  )),
                )
              ],
            ),
          ),
        ):const Center(
          child:    SpinKitThreeBounce(color:primaryColor,size: 20,),
        ),

      ),)
    );
  }
}
