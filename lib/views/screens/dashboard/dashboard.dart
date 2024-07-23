import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:travel_claim/views/components/bg.dart';
import 'package:travel_claim/views/components/common.dart';
import 'package:travel_claim/views/const/appassets.dart';
import 'package:travel_claim/views/screens/advanceApprovel/advance_approvel_screen.dart';
import 'package:travel_claim/views/screens/claimApprovel/claim_Approvel_screen.dart';
import 'package:travel_claim/views/screens/cmdApproels/cmdapprovel_screen.dart';
import 'package:travel_claim/views/screens/draftScreen/draftscreen.dart';
import 'package:travel_claim/views/screens/history/historyscreen.dart';
import 'package:travel_claim/views/screens/newClaim/add_expense_screen.dart';
import 'package:travel_claim/views/screens/newClaim/newclaim_controller/addExpenseController.dart';
import 'package:travel_claim/views/screens/reqAdvance/reqadvance_screen.dart';
import 'package:travel_claim/views/screens/specialApprovel/specialapprovel_screen.dart';
import 'package:travel_claim/views/style/colors.dart';
import 'package:travel_claim/views/widgets.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final Addexpensecontroller addexpensecontroller =
  Get.put(Addexpensecontroller());

  @override
  void initState() {
     addexpensecontroller.apiGetListofBranches();
     addexpensecontroller.apiGetListofTypeTrip();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          bgDashBoard(context,addexpensecontroller.g.wstrEmpName.toString()),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 123,left: 20,right: 20),
              child: SingleChildScrollView(
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                
                  children: [
                    gapHC(26),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          tchead("Welcome to your dashboard,", Colors.white, 20.0,
                              FontWeight.w500),
                          gapHC(1),
                          tchead("${addexpensecontroller.g.wstrEmpName.toString()} - ${addexpensecontroller.g.wstrEmpId.toString()}", Colors.white, 20.0,
                              FontWeight.w500),

                        ],
                      ),
                    ),
                    gapHC(13),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                      children: [
                        Expanded(
                          child: Bounce(
                              duration: const Duration(milliseconds: 110),
                              onTap: (){
                                dprint("NewCliam");
                                Get.to(()=>AddExpenseScreen());
                
                              },
                
                              child: menuCard(30.0, 0.0, 0.0, 0.0, AppAssets.newClaim_img, "New Claim")),
                        ),
                        gapWC(10),
                        Expanded(
                            child: Bounce(
                                duration: const Duration(milliseconds: 110),
                                onTap: (){
                                  dprint("Request");
                                  Get.to(()=>ReqadvanceScreen());
                
                                },
                                child: menuCard(0.0, 30.0, 0.0, 0.0,AppAssets.reqAdv_img, "Request\nAdvance"))),
                      ],
                    ),
                    gapHC(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Bounce(
                              duration: const Duration(milliseconds: 110),
                              onTap: (){
                                Get.to(()=>DraftScreen());
                                dprint("Draft");
                
                              },
                              child: menuCard(0.0, 0.0, 0.0, 0.0, AppAssets.draft_img, "Draft")),
                        ),
                        gapWC(10),
                        Expanded(
                          child: Bounce(
                              duration: const Duration(milliseconds: 110),
                              onTap: (){
                                Get.to(()=>Historyscreen());
                                dprint("Hostory");
                
                              },
                              child: menuCard(0.0, 0.0, 0.0, 0.0,AppAssets.history_img, "History")),
                        ),
                      ],
                    ),
                    gapHC(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Bounce(
                              duration: const Duration(milliseconds: 110),
                              onTap: (){

                                Get.to(()=>ClaimApprovelScreen());
                
                              },
                              child: menuCard(0.0, 0.0, 0.0, 0.0, AppAssets.claimApprv_img, "Claim\nApprovals")),
                        ),
                        gapWC(10),
                        Expanded(
                          child: Bounce(
                              duration: const Duration(milliseconds: 110),
                              onTap: (){
                                dprint("advv");
                                Get.to(()=>AdvanceApprovelScreen());
                
                              },
                              child: menuCard(0.0, 0.0, 0.0, 0.0,AppAssets.advApprvl_img, "Advance\nApprovals")),
                        ),
                      ],
                    ),
                    gapHC(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Bounce(
                              duration: const Duration(milliseconds: 110),
                              onTap: (){
                                dprint("sped");
                                Get.to(()=>SpecialapprovelScreen());

                
                              },
                              child: menuCard(0.0, 0.0, 30.0, 0.0, AppAssets.speciaslApprvl_img, "Special\nApprovals")),
                        ),
                        gapWC(10),
                        Expanded(
                          child: Bounce(
                              duration: const Duration(milliseconds: 110),
                              onTap: (){
                                dprint("CM");
                                Get.to(()=>CmdapprovelScreen());
                
                              },
                              child: menuCard(0.0, 0.0, 0.0,30.0,AppAssets.cmdApprvl_img, "CMD\nApprovals")),
                        ),
                      ],
                    ),
                    // gapHC(20),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   mainAxisSize: MainAxisSize.min,
                    //   children: [
                    //     Expanded(
                    //       child: Bounce(
                    //           duration: const Duration(milliseconds: 110),
                    //           onTap: (){
                    //             dprint("sped");
                    //             Get.to(()=>SpecialapprovelScreen());
                    //
                    //
                    //           },
                    //           child: menuCard(0.0, 0.0, 30.0, 0.0, AppAssets.speciaslApprvl_img, "Special\nApprovals")),
                    //     ),
                    //     gapWC(10),
                    //     Expanded(
                    //       child: Bounce(
                    //           duration: const Duration(milliseconds: 110),
                    //           onTap: (){
                    //             dprint("CM");
                    //             Get.to(()=>CmdapprovelScreen());
                    //
                    //           },
                    //           child: menuCard(0.0, 0.0, 0.0,30.0,AppAssets.cmdApprvl_img, "CMD\nApprovals")),
                    //     ),
                    //   ],
                    // ),


                    gapHC(20),
                
                
                
                
                
                
                
                
                
                
                
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


