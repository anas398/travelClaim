import 'dart:io';

import 'package:bounce/bounce.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_claim/global/globalValues.dart';
import 'package:travel_claim/views/components/bg.dart';
import 'package:travel_claim/views/components/common.dart';
import 'package:travel_claim/views/components/customButton.dart';
import 'package:travel_claim/views/components/textInputField.dart';
import 'package:travel_claim/views/const/appassets.dart';
import 'package:travel_claim/views/screens/newClaim/claimconfirmation.dart';
import 'package:travel_claim/views/screens/newClaim/newclaim_controller/addExpenseController.dart';

import 'package:travel_claim/views/style/colors.dart';
import 'package:travel_claim/views/widgets.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final Addexpensecontroller addexpensecontroller =
  Get.put(Addexpensecontroller());

  File? filee;
  // final FocusNode remark_focusNode = FocusNode();
  // final FocusNode amount_focusNode = FocusNode();
  final FocusNode purpose_focusNode = FocusNode();
  // final FocusNode fromfocusNode = FocusNode();
  // final FocusNode to_focusNode = FocusNode();
  final FocusNode odometer_reading_after = FocusNode();
  final FocusNode odometer_reading_before = FocusNode();
  @override
  void initState() {
    dprint(
        "############################   >${addexpensecontroller.lstrbranchName}");
    dprint(
        "########wstrBranchList####################   >${addexpensecontroller.branchList.value}");
    addexpensecontroller.apiGetCategories();
    // addexpensecontroller.apiGetListofTypeTrip();
    addexpensecontroller.selectedCtegory.value = [];
    addexpensecontroller.amountfocusNode = FocusNode();
    addexpensecontroller.filteredEmployees.value =
        addexpensecontroller.chipsList;

    // Add listener to the FocusNode
    addexpensecontroller.amountfocusNode.addListener(() {
      if (!addexpensecontroller.amountfocusNode.hasFocus) {
        // Perform action when keyboard is dismissed
        print('Keyboard dismissed');
        addexpensecontroller.formatNumber();
        // You can replace this with any action you want to perform
      }
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the focus node when the widget is disposed
    // remark_focusNode.dispose();
    // amount_focusNode.dispose();
    purpose_focusNode.dispose();
    addexpensecontroller.amountfocusNode.dispose();
    // fromfocusNode.dispose();
    // to_focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // addexpensecontroller.apiGetListofBranches();
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: customAppBar("Add Expense"),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              //         mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        gapHC(28),
                        Container(
                          decoration: boxDecoration(primaryColor, 5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ts("Employee ID", Colors.white,
                                      weight: FontWeight.w400),
                                  gapHC(3),
                                  tssb(
                                    '${addexpensecontroller.g.wstrEmpName}(${addexpensecontroller.g.wstrEmpId})',
                                    Colors.white,
                                    FontWeight.w600,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ts("Base Location", Colors.white,
                                      weight: FontWeight.w400),
                                  gapHC(3),
                                  tssb(
                                    addexpensecontroller.g.wstrempLocation,
                                    Colors.white,
                                    FontWeight.w600,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        gapHC(8),
                        tssb("Claim Form", Colors.black, FontWeight.bold),
                        gapHC(8),
                        const Divider(),
                        gapHC(5),
                        ts("Type of trip", Colors.black),
                        gapHC(3),

                        Obx(() => Container(
                          height: 45,
                          padding:
                          const EdgeInsets.symmetric(horizontal: 10),
                          decoration: boxOutlineCustom(
                              Colors.white, 10, Colors.grey.shade400),
                          child: DropdownButton(
                            focusColor: Colors.white,
                            dropdownColor: Colors.white,
                            underline: const SizedBox(),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                            // Initial Value
                            value: addexpensecontroller.lstrTypeofTrip.value
                                .toString(),
                            isExpanded: true,
                            // Down Arrow Icon
                            icon: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 13),

                            // Array list of items
                            items: addexpensecontroller.typeOfTripList
                                .map((items) {
                              return DropdownMenuItem(
                                value: items["TripTypeName"],
                                child: ts(
                                  items["TripTypeName"],
                                  Colors.black,
                                ),
                              );
                            }).toList(),
                            onChanged: (dynamic value) {
                              addexpensecontroller.fnOnChnageTrip(
                                  value, "Trip");
                            },
                          ),
                        )),
                        // GestureDetector(
                        //   onTap: (){
                        //     print("33333333333333");
                        //     Container(
                        //       height: 35,
                        //       padding: const EdgeInsets.only(
                        //         right: 10,
                        //         left: 10,
                        //       ),
                        //       child:
                        //     );
                        //   },
                        //   child: Container(
                        //     height: 45,
                        //     decoration: boxOutlineCustom(Colors.white, 10, Colors.grey.shade400)
                        //   ),
                        // ),

                        gapHC(15),
                        ts("Branch name", Colors.black),
                        gapHC(3),
                        Obx(() => Container(
                          height: 45,
                          padding:
                          const EdgeInsets.symmetric(horizontal: 10),
                          decoration: boxOutlineCustom(
                              Colors.white, 10, Colors.grey.shade400),
                          child: DropdownButton(
                            focusColor: Colors.white,
                            dropdownColor: Colors.white,
                            underline: const SizedBox(),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                            // Initial Value
                            hint: ts("Branch", Colors.grey.shade400),
                            value: addexpensecontroller.lstrbranchName.value
                                .toString(),
                            isExpanded: true,
                            // Down Arrow Icon
                            icon: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 13),

                            // Array list of items
                            items: addexpensecontroller.branchList.value
                                .map((items) {
                              return DropdownMenuItem(
                                value: items["BranchName"].toString(),
                                child: ts(
                                  items["BranchName"].toString(),
                                  Colors.black,
                                ),
                              );
                            }).toList(),
                            onChanged: (dynamic value) {
                              addexpensecontroller.fnOnChnageTrip(
                                  value, "Branch");
                            },
                          ),
                        )),
                        gapHC(15),
                        ts("Purpose of trip", Colors.black),
                        gapHC(3),
                        TextinputfieldContainer(
                            showIcon: false,
                            focusNode: purpose_focusNode,
                            onSubmitted: () {
                              purpose_focusNode.unfocus();
                            },
                            verticalPadding: 6,
                            textInputAction: TextInputAction.done,
                            controller: addexpensecontroller.txtpurposeTrip,
                            maxline: 3,
                            hintText: "Enter your purpose",
                            isEnable: true,
                            isObscure: false),
                        gapHC(20),

                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          decoration: boxBaseDecoration(greyLight, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              tssb("Categories", Colors.black, FontWeight.bold),
                              gapHC(12),
                              GetBuilder<Addexpensecontroller>(
                                  builder: (controller) {
                                    return GridView.builder(
                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2, // 2 columns
                                          crossAxisSpacing: 10.0,
                                          mainAxisSpacing: 10.0,
                                          childAspectRatio: 7.7 / 2,
                                        ),
                                        shrinkWrap: true,
                                        physics: const ScrollPhysics(),
                                        itemCount:
                                        controller.expenseCategory.value.length,
                                        itemBuilder: (context, index) {
                                          var image = controller.expenseCategory
                                              .value[index]["ImageUrl"]
                                              .toString();
                                          bool isCheck = controller.expenseCategory
                                              .value[index]["Oncheck"];

                                          var title = controller.expenseCategory
                                              .value[index]["CategoryName"]
                                              .toString();
                                          return GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                controller.expenseCategory
                                                    .value[index]["Oncheck"] =
                                                !controller.expenseCategory
                                                    .value[index]["Oncheck"];
                                              });

                                              if (controller.expenseCategory.value[index]["Oncheck"] == true) {
                                                var selectedList = controller
                                                    .expenseCategory.value
                                                    .where((element) =>
                                                element["Oncheck"] == true)
                                                    .toList();
                                                dprint(
                                                    "selectedList>> ${selectedList}");
                                                controller.selectedCtegory.value =
                                                    selectedList;
                                              }
                                              // if (controller.selectedCtegory
                                              //         .value[index]["Expand"] ==
                                              //     true) {
                                              //   controller.selectedCtegory
                                              //       .value[index]["Expand"] = false;
                                              // }
                                            },
                                            child: Container(
                                              height: 44,
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 4),
                                              decoration: boxBaseDecoration(
                                                  Colors.white, 6),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  SizedBox(
                                                    height: 24.0,
                                                    width: 24.0,
                                                    child: Checkbox(
                                                      activeColor: Colors.green,
                                                      value: controller
                                                          .expenseCategory
                                                          .value[index]["Oncheck"],
                                                      hoverColor: Colors.black,
                                                      focusColor: Colors.black,
                                                      onChanged: (bool? value) {
                                                        // controller.fnCheckCategory(
                                                        //     index, value ?? false);
                                                      },
                                                    ),
                                                  ),
                                                  gapWC(6),
                                                  Image.network(
                                                    image,
                                                    height: 18,
                                                    width: 18,
                                                  ),
                                                  gapWC(4),
                                                  Expanded(
                                                      child: tchcus(
                                                          title, Colors.black, 12.0,
                                                          height: 0.99)),
                                                  gapWC(10),
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  })
                            ],
                          ),
                        ),//Category

                        gapHC(10),
                        ListView.builder(
                            itemCount: addexpensecontroller
                                .selectedCtegory.value.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              dprint(
                                  "SELECETD CATEGORYLIST >>>>>> ::: ${addexpensecontroller.selectedCtegory}");
                              var name = addexpensecontroller.selectedCtegory
                                  .value[index]["CategoryName"] ==
                                  "Air"
                                  ? "Flight"
                                  : addexpensecontroller.selectedCtegory
                                  .value[index]["CategoryName"];
                              var catId = addexpensecontroller.selectedCtegory.value[index]["CategoryID"];
                              var isTripFrom = addexpensecontroller.selectedCtegory.value[index]["TripFrom"];
                              var isTripTo= addexpensecontroller.selectedCtegory.value[index]["TripTo"];
                              var isFromDate= addexpensecontroller.selectedCtegory.value[index]["FromDate"];
                              var isToDate= addexpensecontroller.selectedCtegory.value[index]["ToDate"];
                              var isDocumentDate= addexpensecontroller.selectedCtegory.value[index]["DocumentDate"];
                              var isStartMeter= addexpensecontroller.selectedCtegory.value[index]["StartMeter"];
                              var isEndMeter= addexpensecontroller.selectedCtegory.value[index]["EndMeter"];
                              var ImageUrl= addexpensecontroller.selectedCtegory.value[index]["ImageUrl"];

                              return Obx(()=>Column(
                                children: [
                                  Bounce(
                                      onTap: (){
                                        setState(() {
                                          addexpensecontroller.selectedCtegory
                                              .value[index]["Expand"] =
                                          !addexpensecontroller
                                              .selectedCtegory
                                              .value[index]["Expand"];
                                        });
                                        dprint("sdcsdcsfcgrge>>> ${ addexpensecontroller.selectedCtegory
                                            .value[index]["Expand"]}");
                                      },
                                      child:addexpensecontroller
                                          .selectedCtegory.value[index]["Oncheck"]? Padding(
                                        padding:
                                        const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: expansionTile(
                                            addexpensecontroller
                                                .selectedCtegory
                                                .value[index]
                                            ["ImageUrl"]!,
                                            addexpensecontroller
                                                .selectedCtegory
                                                .value[index]
                                            ["CategoryName"]),
                                      )
                                          :SizedBox()),
                                  addexpensecontroller.selectedCtegory
                                      .value[index]["Expand"]
                                      ? Column(
                                    children: [
                                      //
                                      // for(int i = 0 ; i < addexpensecontroller.selectedCtegory[index]["addmore"] ; i++)
                                      insideScreen(name),

                                      Bounce(
                                        onTap: () {
                                          dprint(
                                              "Adddmoooooooooooooer>>  ${addexpensecontroller.selectedCtegory[index]["addmore"]++}");
                                          addexpensecontroller
                                              .addmoreList.value
                                              .add(addexpensecontroller
                                              .selectedCtegory
                                              .value[index]);
                                          dprint(
                                              "!!!!>> > > > >> ${addexpensecontroller.addmoreList.value}");
                                        },
                                        child: Container(
                                          decoration: boxOutlineCustom(
                                              Colors.white,
                                              10.0,
                                              primaryColor),
                                          padding: const EdgeInsets
                                              .symmetric(
                                              vertical: 9,
                                              horizontal: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              tssb(
                                                  "Add more",
                                                  Colors.black,
                                                  FontWeight.w500),
                                              gapWC(2),
                                              const Icon(
                                                Icons.add,
                                                color: Colors.black,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      gapHC(10)
                                    ],
                                  )
                                      : const SizedBox(),
                                ],
                              ));






                            }),


                        gapHC(10),

                        const Divider(),

                        gapHC(10),
                      ],
                    ),
                  ),
                ),

                // Row(
                //   children: [
                //     Expanded(
                //         child: Custombutton(
                //             onTap: () {
                //               dprint("save draftsssssss");
                //             },
                //             buttonName: "Save draft",
                //             buttonColor: Colors.white,
                //             buttonBorderColor: Colors.grey.shade400,
                //             buttonTextColor: primaryColor)),
                //     gapWC(20),
                //     Expanded(
                //         child: Custombutton(
                //             onTap: () {
                //               dprint("contineueeee");
                //               Get.to(() => const Claimconfirmation());
                //             },
                //             buttonName: "Continue",
                //             buttonColor: primaryColor,
                //             buttonTextColor: Colors.white)),
                //   ],
                // ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            padding:
            const EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 6,
                  blurRadius: 6,
                  offset: const Offset(5, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                    child: Custombutton(
                        onTap: () {
                          dprint("save draftsssssss");
                        },
                        buttonName: "Save draft",
                        buttonColor: Colors.white,
                        buttonBorderColor: Colors.grey.shade400,
                        buttonTextColor: primaryColor)),
                gapWC(20),
                Expanded(
                    child: Custombutton(
                        onTap: () {
                          dprint("contineueeee");
                          Get.to(() => const Claimconfirmation());
                        },
                        buttonName: "Continue",
                        buttonColor: primaryColor,
                        buttonTextColor: Colors.white)),
              ],
            ),
          )),
    );
  }

  Widget categoryChips(title, image, bool checkerValue) {
    dprint("checkerValue?>>> ${title}>>>>>>>>>> ${checkerValue}");
    return Container(
      height: 35,
      decoration: boxBaseDecoration(Colors.white, 6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
              activeColor: Colors.green,
              value: checkerValue,
              onChanged: (bool? value) {
                print("onchangeeee  ${value}");
                setState(() {
                  checkerValue = value!;
                });

                dprint("VAA   ${title}  AAAAL >>${checkerValue}");
              }),
          Image.asset(
            image,
            height: 25,
            width: 25,
          ),
          gapWC(7),
          tss(title, Colors.black, 15.0),
          gapWC(20),
        ],
      ),
    );
  }

  void itemChange(bool val, e, contr) {
    setState(() {
      e.isCheck = val;
    });
  }

  getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      final file = File(result.files.single.path!);
      filee = file;
      setState(() {});
      dprint("FIIII>>>> ${filee!.path.split("/").last}");
    } else {
      // User canceled the picker
      // You can show snackbar or fluttertoast
      // here like this to show warning to user
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please select file'),
      ));
    }
  }

  Widget checkinOut(size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ts("Check-In", Colors.black),
            gapHC(3),
            GestureDetector(
              onTap: () {
                addexpensecontroller.wSelectCheckInDate(context);
              },
              child: Container(
                height: 45,
                width: size.width * 0.4,
                decoration:
                boxOutlineCustom(Colors.white, 10, Colors.grey.shade400),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ts(
                          setDate(
                              6,
                              addexpensecontroller.checkInDate.value),
                          Colors.black),
                      const Icon(
                        Icons.calendar_month,
                        color: primaryColor,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ts("Check-Out", Colors.black),
            gapHC(3),
            GestureDetector(
              onTap: () {
                addexpensecontroller.wSelectCheckOutDate(context);
              },
              child: Container(
                height: 45,
                width: size.width * 0.4,
                decoration:
                boxOutlineCustom(Colors.white, 10, Colors.grey.shade400),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ts(setDate(6, addexpensecontroller.checkOutDate.value),
                          Colors.black),
                      const Icon(
                        Icons.calendar_month,
                        color: primaryColor,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget odooMeterReading(size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ts("Odometer reading before", Colors.black),
              gapHC(3),
              TextinputfieldContainer(
                  showIcon: false,
                  boxRadiusColor: primaryColor,
                  verticalPadding: 6,
                  maxline: 1,
                  textInputAction: TextInputAction.done,
                  focusNode: odometer_reading_before,
                  onSubmitted: () {
                    odometer_reading_before.unfocus();
                  },
                  hintText: "",
                  isEnable: true,
                  isObscure: false),
            ],
          ),
        ),
        gapWC(20),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ts("Odometer reading after", Colors.black),
              gapHC(3),
              TextinputfieldContainer(
                  showIcon: false,
                  boxRadiusColor: primaryColor,
                  verticalPadding: 6,
                  maxline: 1,
                  textInputAction: TextInputAction.done,
                  focusNode: odometer_reading_after,
                  onSubmitted: () {
                    odometer_reading_after.unfocus();
                  },
                  hintText: "",
                  isEnable: true,
                  isObscure: false),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> innerWidegt = [];

  // List<Widget>insidWidget(itemList){
  //   Size size =MediaQuery.of(context).size;
  //
  //   List<Widget>rtnList=[];
  //   for(var e in itemList){
  //     dprint("eeeeeeeeeeeeee>>>> ${e}");
  //     var catId=(e["CategoryID"]??"");
  //     var index = e;
  //     dynamic items=e;
  //     var isTripFrom=(e["CategoryID"]??"");
  //     var name=(e["CategoryName"]??"");
  //     var isTripTo=(e["CategoryID"]??"");
  //     var isFromDate=(e["CategoryID"]??"");
  //     var isToDate=(e["CategoryID"]??"");
  //     var isDocumentDate=(e["CategoryID"]??"");
  //     var isStartMeter=(e["CategoryID"]??"");
  //     var isEndMeter=(e["CategoryID"]??"");
  //     rtnList.add(
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             gapHC(20),
  //             Row(
  //               mainAxisAlignment:
  //               // innerWidegt.length>=1?
  //               MainAxisAlignment.spaceBetween,
  //               // MainAxisAlignment.start,
  //               children: [
  //                 ts("${1}.${name??""} details", primaryColor,
  //                     weight: FontWeight.w500),
  //                 // innerWidegt.length>=1 ?   Bounce(
  //                 //   onTap: (){
  //                 //     setState(() {
  //                 //       items?.removeAt(index!);
  //                 //     });
  //                 //   },
  //                 //   child: ts(" Remove", Colors.black,
  //                 //       weight: FontWeight.w500),
  //                 // ):SizedBox(),
  //               ],
  //             ),
  //             const Divider(),
  //             gapHC(10),
  //             isTripFrom=="1"?   Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 ts("From", Colors.black),
  //                 gapHC(3),
  //                 const TextinputfieldContainer(
  //                     showIcon: false,
  //                     verticalPadding: 6,
  //                     maxline: 1,
  //                     textInputAction: TextInputAction.done,
  //
  //                     // focusNode: fromfocusNode,
  //                     // onSubmitted:  (){
  //                     //   fromfocusNode.unfocus();
  //                     // } ,
  //                     hintText: "From",
  //                     isEnable: true,
  //                     isObscure: false),
  //               ],
  //             ):SizedBox(),
  //             gapHC(10),
  //             isTripTo=="1"? Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 ts("To", Colors.black),
  //                 gapHC(3),
  //                 const TextinputfieldContainer(
  //                     showIcon: false,
  //                     verticalPadding: 6,
  //                     maxline: 1,
  //                     textInputAction: TextInputAction.done,
  //
  //                     // focusNode: to_focusNode,
  //                     // onSubmitted:  (){
  //                     //   to_focusNode.unfocus();
  //                     // } ,
  //                     hintText: "To",
  //                     isEnable: true,
  //                     isObscure: false),
  //               ],
  //             ):SizedBox(),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 isStartMeter=="1"?    Flexible(
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       ts("Odometer reading before", Colors.black),
  //                       gapHC(3),
  //                       TextinputfieldContainer(
  //                           showIcon: false,
  //                           boxRadiusColor: primaryColor,
  //                           verticalPadding: 6,
  //                           maxline: 1,
  //                           textInputAction: TextInputAction.done,
  //                           focusNode: odometer_reading_before,
  //                           onSubmitted: () {
  //                             odometer_reading_before.unfocus();
  //                           },
  //                           hintText: "",
  //                           isEnable: true,
  //                           isObscure: false),
  //                     ],
  //                   ),
  //                 ):SizedBox(),
  //                 gapWC(20),
  //                 isEndMeter=="1" ?Flexible(
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       ts("Odometer reading after", Colors.black),
  //                       gapHC(3),
  //                       TextinputfieldContainer(
  //                           showIcon: false,
  //                           boxRadiusColor: primaryColor,
  //                           verticalPadding: 6,
  //                           maxline: 1,
  //                           textInputAction: TextInputAction.done,
  //                           focusNode: odometer_reading_after,
  //                           onSubmitted: () {
  //                             odometer_reading_after.unfocus();
  //                           },
  //                           hintText: "",
  //                           isEnable: true,
  //                           isObscure: false),
  //                     ],
  //                   ),
  //                 ):SizedBox(),
  //               ],
  //             ),
  //             gapHC(10),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 isFromDate=="1"? Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     ts("Check-In", Colors.black),
  //                     gapHC(3),
  //                     GestureDetector(
  //                       onTap: () {
  //                         addexpensecontroller.wSelectCheckInDate(context);
  //                       },
  //                       child: Container(
  //                         height: 45,
  //                         width: size.width * 0.4,
  //                         decoration:
  //                         boxOutlineCustom(Colors.white, 10, Colors.grey.shade400),
  //                         child: Center(
  //                           child: Row(
  //                             crossAxisAlignment: CrossAxisAlignment.center,
  //                             mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                             children: [
  //                               ts(
  //                                   setDate(
  //                                       6,
  //                                       addexpensecontroller.checkInDate.value),
  //                                   Colors.black),
  //                               const Icon(
  //                                 Icons.calendar_month,
  //                                 color: primaryColor,
  //                               )
  //                             ],
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ):SizedBox(),
  //                 isToDate=="1" ?Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     ts("Check-Out", Colors.black),
  //                     gapHC(3),
  //                     GestureDetector(
  //                       onTap: () {
  //                         addexpensecontroller.wSelectCheckOutDate(context);
  //                       },
  //                       child: Container(
  //                         height: 45,
  //                         width: size.width * 0.4,
  //                         decoration:
  //                         boxOutlineCustom(Colors.white, 10, Colors.grey.shade400),
  //                         child: Center(
  //                           child: Row(
  //                             crossAxisAlignment: CrossAxisAlignment.center,
  //                             mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                             children: [
  //                               ts(setDate(6, addexpensecontroller.checkOutDate.value),
  //                                   Colors.black),
  //                               const Icon(
  //                                 Icons.calendar_month,
  //                                 color: primaryColor,
  //                               )
  //                             ],
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ):SizedBox(),
  //               ],
  //             ),
  //             isDocumentDate=="1"? Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 ts("Date", Colors.black),
  //                 gapHC(3),
  //                 GestureDetector(
  //                   onTap: () {
  //                     addexpensecontroller.wSelectFromDate(context);
  //                   },
  //                   child: Container(
  //                     height: 45,
  //                     width: size.width * 0.4,
  //                     decoration: boxOutlineCustom(
  //                         Colors.white, 10, Colors.grey.shade400),
  //                     child: Center(
  //                       child: Row(
  //                         crossAxisAlignment: CrossAxisAlignment.center,
  //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                         children: [
  //                           ts(setDate(6, addexpensecontroller.fromDate.value),
  //                               Colors.black),
  //                           const Icon(
  //                             Icons.calendar_month,
  //                             color: primaryColor,
  //                           )
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ):SizedBox(),
  //             gapHC(10),
  //             tcustom("Number of employee", Colors.black, 14.0, FontWeight.w500),
  //             gapHC(3),
  //             Row(
  //               children: [
  //                 Bounce(
  //                   onTap: () {
  //                     FocusScope.of(context).requestFocus(new FocusNode());
  //                     var txtVal = mfnInt(addexpensecontroller.txtNoOfEmployee.text);
  //                     txtVal = txtVal == 0 ? 0 : txtVal - 1;
  //                     addexpensecontroller.txtNoOfEmployee.text = txtVal.toString();
  //                   },
  //                   child: Container(
  //                     height: 45,
  //                     padding: const EdgeInsets.all(12),
  //                     decoration: boxBaseDecorationC(primaryColor, 10, 0.0, 10, 0.0),
  //                     child: const Center(
  //                         child: Icon(
  //                           Icons.remove,
  //                           color: Colors.white,
  //                         )),
  //                   ),
  //                 ),
  //                 gapWC(8),
  //                 Container(
  //                   width: 80,
  //                   child: Center(
  //                     child: TextFormField(
  //                       enabled: true,
  //                       inputFormatters: mfnInputDecFormatters(),
  //                       controller: addexpensecontroller.txtNoOfEmployee,
  //                       textAlign: TextAlign.center,
  //                       // keyboardType:keybordType=="txtKeybrd"?TextInputType.text: TextInputType.number,
  //                       keyboardType: const TextInputType.numberWithOptions(
  //                           signed: true, decimal: true),
  //
  //                       decoration: InputDecoration(
  //                         contentPadding:
  //                         const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
  //                         //focusColor:Colors.grey.shade100 ,
  //                         focusedBorder: OutlineInputBorder(
  //                           borderRadius: BorderRadius.circular(1.0),
  //                           borderSide: BorderSide(
  //                               width: 1, color: Colors.grey.shade300), //<-- SEE HERE
  //                         ),
  //
  //                         border: OutlineInputBorder(
  //                           borderRadius: BorderRadius.circular(1.0),
  //                           borderSide: BorderSide(
  //                               width: 1, color: Colors.grey.shade300), //<-- SEE HERE
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 gapWC(8),
  //                 Bounce(
  //                   onTap: () {
  //                     FocusScope.of(context).requestFocus(new FocusNode());
  //                     print("adddddddddddddddddddddd");
  //                     //  addexpensecontroller.noOfEmployee++;
  //                     addexpensecontroller.txtNoOfEmployee.text =
  //                         (mfnInt(addexpensecontroller.txtNoOfEmployee.text) + 1)
  //                             .toString();
  //                   },
  //                   child: Container(
  //                     height: 45,
  //                     padding: const EdgeInsets.all(12),
  //                     decoration: boxBaseDecorationC(primaryColor, 0, 10.0, 0, 10.0),
  //                     child: const Center(
  //                         child: Icon(
  //                           Icons.add,
  //                           color: Colors.white,
  //                         )),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             gapHC(10),
  //             name == "Flight" || addexpensecontroller.selectedChips.isNotEmpty
  //                 ? Obx(
  //                   () => Column(
  //                 children: [
  //                   TextinputfieldContainer(
  //                       showIcon: false,
  //                       verticalPadding: 6,
  //                       maxline: 1,
  //                       textInputAction: TextInputAction.done,
  //                       hintText: "",
  //                       controller: addexpensecontroller.txtSuggestionEmpCode,
  //                       isEnable: true,
  //                       isObscure: false,
  //                       onchange: (value) {
  //                         addexpensecontroller.fnOnChnageSuggestionValue(value);
  //                       }),
  //                   Container(
  //                     width: double.infinity,
  //                     padding: const EdgeInsets.symmetric(
  //                       horizontal: 10,
  //                     ),
  //                     decoration: boxOutlineCustom(
  //                         Colors.white, 10, Colors.grey.shade400),
  //                     child: Wrap(
  //                       spacing: 9.0,
  //                       runSpacing: -7,
  //                       children: addexpensecontroller.selectedChips.value
  //                           .map((chip) {
  //                         return Chip(
  //                           //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  //                           padding: EdgeInsets.zero,
  //                           backgroundColor: primaryColor,
  //                           deleteIconColor: Colors.white,
  //
  //                           side: const BorderSide(color: Colors.white),
  //                           shape: RoundedRectangleBorder(
  //                               borderRadius: BorderRadius.circular(30)),
  //                           label: Text(
  //                             chip,
  //                             style: const TextStyle(color: Colors.white),
  //                           ),
  //                           onDeleted: () =>
  //                               addexpensecontroller.deleteChip(chip),
  //                         );
  //                       }).toList(),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             )
  //                 : const SizedBox(),
  //             name== "Train"
  //                 ? Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 ts("Class", Colors.black),
  //                 gapHC(3),
  //                 Obx(() => Container(
  //                   height: 45,
  //                   padding: const EdgeInsets.symmetric(horizontal: 10),
  //                   decoration: boxOutlineCustom(
  //                       Colors.white, 10, Colors.grey.shade400),
  //                   child: DropdownButton(
  //                     focusColor: Colors.white,
  //                     dropdownColor: Colors.white,
  //                     underline: const SizedBox(),
  //                     borderRadius:
  //                     const BorderRadius.all(Radius.circular(10)),
  //                     // Initial Value
  //                     value: addexpensecontroller.lstrTrainClass.value
  //                         .toString(),
  //                     isExpanded: true,
  //                     // Down Arrow Icon
  //                     icon: const Icon(Icons.arrow_forward_ios_rounded,
  //                         size: 13),
  //
  //                     // Array list of items
  //                     items: addexpensecontroller.trainClassList
  //                         .map((String items) {
  //                       return DropdownMenuItem(
  //                         value: items,
  //                         child: ts(
  //                           items,
  //                           Colors.black,
  //                         ),
  //                       );
  //                     }).toList(),
  //                     onChanged: (dynamic value) {
  //                       addexpensecontroller.fnOnChnageTrip(value, "Train");
  //                     },
  //                   ),
  //                 ))
  //               ],
  //             )
  //                 :   name == "Bus"
  //                 ? Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 ts("Class", Colors.black),
  //                 gapHC(3),
  //                 Obx(() => Container(
  //                   height: 45,
  //                   padding: const EdgeInsets.symmetric(horizontal: 10),
  //                   decoration: boxOutlineCustom(
  //                       Colors.white, 10, Colors.grey.shade400),
  //                   child: DropdownButton(
  //                     focusColor: Colors.white,
  //                     dropdownColor: Colors.white,
  //                     underline: const SizedBox(),
  //                     borderRadius:
  //                     const BorderRadius.all(Radius.circular(10)),
  //                     // Initial Value
  //                     value: addexpensecontroller.lstrBusClass.value
  //                         .toString(),
  //                     isExpanded: true,
  //                     // Down Arrow Icon
  //                     icon: const Icon(Icons.arrow_forward_ios_rounded,
  //                         size: 13),
  //
  //                     // Array list of items
  //                     items: addexpensecontroller.busClassList
  //                         .map((String items) {
  //                       return DropdownMenuItem(
  //                         value: items,
  //                         child: ts(
  //                           items,
  //                           Colors.black,
  //                         ),
  //                       );
  //                     }).toList(),
  //                     onChanged: (dynamic value) {
  //                       addexpensecontroller.fnOnChnageTrip(
  //                           value, "Bus");
  //                     },
  //                   ),
  //                 ))
  //               ],
  //             )
  //                 :  name== "Flight"
  //                 ? Container(
  //               height: 100,
  //               padding: const EdgeInsets.symmetric(
  //                   horizontal: 10, vertical: 10),
  //               decoration: boxOutlineShadowCustom(
  //                   Colors.white, 10.0, Colors.grey.shade400),
  //               child: ListView.builder(
  //                   itemCount: addexpensecontroller
  //                       .filteredEmployees.value.length,
  //                   // itemCount:  addexpensecontroller.chipsList.where((p0) => p0 == addexpensecontroller.txtSuggestionEmpCode.text).length,
  //                   physics: const ScrollPhysics(),
  //                   itemBuilder: (context, index) {
  //                     var name = addexpensecontroller
  //                         .filteredEmployees.value[index];
  //
  //                     return Padding(
  //                       padding: const EdgeInsets.only(bottom: 10),
  //                       child: Bounce(
  //                           onTap: () {
  //                             addexpensecontroller
  //                                 .txtSuggestionEmpCode.text = "";
  //                             addexpensecontroller
  //                                 .filteredEmployees.value =
  //                                 addexpensecontroller.chipsList.value;
  //                             if (addexpensecontroller.selectedChips
  //                                 .contains(name)) {
  //                               dprint("containeeeeeeeeeeeeddd");
  //                             } else {
  //                               addexpensecontroller.selectedChips
  //                                   .add(name);
  //                             }
  //                           },
  //                           child: Text(name)),
  //                     );
  //                   }),
  //             )
  //                 : const SizedBox(),
  //             gapHC(10),
  //             ts("Remarks", Colors.black),
  //             gapHC(3),
  //             const TextinputfieldContainer(
  //                 showIcon: false,
  //                 verticalPadding: 6,
  //                 maxline: 3,
  //                 textInputAction: TextInputAction.done,
  //
  //                 // focusNode: remark_focusNode,
  //                 // onSubmitted:  (){
  //                 //   remark_focusNode.unfocus();
  //                 // } ,
  //                 hintText: "Enter your remarks",
  //                 isEnable: true,
  //                 isObscure: false),
  //             gapHC(10),
  //             ts("Amount", Colors.black),
  //             gapHC(3),
  //             Row(
  //               children: [
  //                 Expanded(
  //                   child: TextField(
  //                     controller: addexpensecontroller.txtAmount.value,
  //                     obscureText: false,
  //                     enabled: true,
  //                     focusNode: addexpensecontroller.amountfocusNode,
  //                     textInputAction: TextInputAction.done,
  //                     style: const TextStyle(color: Colors.black),
  //                     maxLines: 1,
  //                     decoration: InputDecoration(
  //                       contentPadding:
  //                       const EdgeInsets.symmetric(horizontal: 10, vertical: 0.0),
  //                       hintText: 'Amount',
  //                       hintStyle: hintTextStyle(),
  //                       enabledBorder: OutlineInputBorder(
  //                         borderRadius: BorderRadius.circular(10.0),
  //                         borderSide: BorderSide(color: Colors.grey.shade400),
  //                       ),
  //                       focusedBorder: OutlineInputBorder(
  //                         borderRadius: BorderRadius.circular(10.0),
  //                         borderSide: BorderSide(color: Colors.grey.shade500),
  //                       ),
  //                     ),
  //                     keyboardType: TextInputType.number,
  //                     inputFormatters: mfnInputDecFormatters(),
  //                     onSubmitted: (v) {
  //                       dprint("ONSUBMITTTTTTTTTTTTTTTT");
  //                       addexpensecontroller.formatNumber();
  //                     },
  //                     onChanged: (va) {
  //                       dprint("OncHNGEEEEEEEEEEEE");
  //                     },
  //                   ),
  //                 ),
  //                 gapWC(15),
  //                 Expanded(
  //                     child: Custombutton(
  //                         onTap: () {
  //                           getFile();
  //                         },
  //                         buttonName: "Choose file",
  //                         buttonColor: primaryColor,
  //                         buttonTextColor: Colors.white))
  //               ],
  //             ),
  //             gapHC(10),
  //             filee == null
  //                 ? const SizedBox()
  //                 : Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 ts("Files", Colors.black),
  //                 gapHC(5),
  //                 Row(
  //                   children: [
  //                     Image.asset(AppAssets.file),
  //                     gapWC(10),
  //                     Expanded(
  //                         child: ts(
  //                             filee != null ? filee!.path.split("/").last : "",
  //                             Colors.black)),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //             gapHC(10),
  //           ],
  //         )
  //     );
  //   }
  //   return rtnList;
  // }


  Widget insideScreen(name) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        gapHC(20),
        ts("1.${name} details", primaryColor,
            weight: FontWeight.w500),
        const Divider(),
        gapHC(10),
        name == "Lodging" ||
            name == "Food" ||
            name == "Fuel" ||
            name == "Entertainment"
            ? const SizedBox()
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ts("From", Colors.black),
            gapHC(3),
            const TextinputfieldContainer(
                showIcon: false,
                verticalPadding: 6,
                maxline: 1,
                textInputAction: TextInputAction.done,

                // focusNode: fromfocusNode,
                // onSubmitted:  (){
                //   fromfocusNode.unfocus();
                // } ,
                hintText: "From",
                isEnable: true,
                isObscure: false),
            gapHC(10),
            ts("To", Colors.black),
            gapHC(3),
            const TextinputfieldContainer(
                showIcon: false,
                verticalPadding: 6,
                maxline: 1,
                textInputAction: TextInputAction.done,

                // focusNode: to_focusNode,
                // onSubmitted:  (){
                //   to_focusNode.unfocus();
                // } ,
                hintText: "To",
                isEnable: true,
                isObscure: false),
          ],
        ),
        name == "Fuel" ? odooMeterReading(size) : const SizedBox(),
        gapHC(10),
        name == "Lodging"
            ? checkinOut(size)
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ts("Date", Colors.black),
            gapHC(3),
            GestureDetector(
              onTap: () {
                addexpensecontroller.wSelectFromDate(context);
              },
              child: Container(
                height: 45,
                width: size.width * 0.4,
                decoration: boxOutlineCustom(
                    Colors.white, 10, Colors.grey.shade400),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ts(setDate(6, addexpensecontroller.fromDate.value),
                          Colors.black),
                      const Icon(
                        Icons.calendar_month,
                        color: primaryColor,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        gapHC(10),
        tcustom("Number of employee", Colors.black, 14.0, FontWeight.w500),
        gapHC(3),
        Row(
          children: [
            Bounce(
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
                var txtVal = mfnInt(addexpensecontroller.txtNoOfEmployee.text);
                txtVal = txtVal == 0 ? 0 : txtVal - 1;
                addexpensecontroller.txtNoOfEmployee.text = txtVal.toString();
              },
              child: Container(
                height: 45,
                padding: const EdgeInsets.all(12),
                decoration: boxBaseDecorationC(primaryColor, 10, 0.0, 10, 0.0),
                child: const Center(
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                    )),
              ),
            ),
            gapWC(8),
            Container(
              width: 80,
              child: Center(
                child: TextFormField(
                  enabled: true,
                  inputFormatters: mfnInputDecFormatters(),
                  controller: addexpensecontroller.txtNoOfEmployee,
                  textAlign: TextAlign.center,
                  // keyboardType:keybordType=="txtKeybrd"?TextInputType.text: TextInputType.number,
                  keyboardType: const TextInputType.numberWithOptions(
                      signed: true, decimal: true),

                  decoration: InputDecoration(
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
                    //focusColor:Colors.grey.shade100 ,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1.0),
                      borderSide: BorderSide(
                          width: 1, color: Colors.grey.shade300), //<-- SEE HERE
                    ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1.0),
                      borderSide: BorderSide(
                          width: 1, color: Colors.grey.shade300), //<-- SEE HERE
                    ),
                  ),
                ),
              ),
            ),
            gapWC(8),
            Bounce(
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
                print("adddddddddddddddddddddd");
                //  addexpensecontroller.noOfEmployee++;
                addexpensecontroller.txtNoOfEmployee.text =
                    (mfnInt(addexpensecontroller.txtNoOfEmployee.text) + 1)
                        .toString();
              },
              child: Container(
                height: 45,
                padding: const EdgeInsets.all(12),
                decoration: boxBaseDecorationC(primaryColor, 0, 10.0, 0, 10.0),
                child: const Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    )),
              ),
            ),
          ],
        ),
        gapHC(10),
        name == "Flight" || addexpensecontroller.selectedChips.isNotEmpty
            ? Obx(
              () => Column(
            children: [
              TextinputfieldContainer(
                  showIcon: false,
                  verticalPadding: 6,
                  maxline: 1,
                  textInputAction: TextInputAction.done,
                  hintText: "",
                  controller: addexpensecontroller.txtSuggestionEmpCode,
                  isEnable: true,
                  isObscure: false,
                  onchange: (value) {
                    addexpensecontroller.fnOnChnageSuggestionValue(value);
                  }),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                decoration: boxOutlineCustom(
                    Colors.white, 10, Colors.grey.shade400),
                child: Wrap(
                  spacing: 9.0,
                  runSpacing: -7,
                  children: addexpensecontroller.selectedChips.value
                      .map((chip) {
                    return Chip(
                      //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      padding: EdgeInsets.zero,
                      backgroundColor: primaryColor,
                      deleteIconColor: Colors.white,

                      side: const BorderSide(color: Colors.white),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      label: Text(
                        chip,
                        style: const TextStyle(color: Colors.white),
                      ),
                      onDeleted: () =>
                          addexpensecontroller.deleteChip(chip),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        )
            : const SizedBox(),
        name == "Train"
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ts("Class", Colors.black),
            gapHC(3),
            Obx(() => Container(
              height: 45,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: boxOutlineCustom(
                  Colors.white, 10, Colors.grey.shade400),
              child: DropdownButton(
                focusColor: Colors.white,
                dropdownColor: Colors.white,
                underline: const SizedBox(),
                borderRadius:
                const BorderRadius.all(Radius.circular(10)),
                // Initial Value
                value: addexpensecontroller.lstrTrainClass.value
                    .toString(),
                isExpanded: true,
                // Down Arrow Icon
                icon: const Icon(Icons.arrow_forward_ios_rounded,
                    size: 13),

                // Array list of items
                items: addexpensecontroller.trainClassList
                    .map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: ts(
                      items,
                      Colors.black,
                    ),
                  );
                }).toList(),
                onChanged: (dynamic value) {
                  addexpensecontroller.fnOnChnageTrip(value, "Train");
                },
              ),
            ))
          ],
        )
            : name == "Bus"
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ts("Class", Colors.black),
            gapHC(3),
            Obx(() => Container(
              height: 45,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: boxOutlineCustom(
                  Colors.white, 10, Colors.grey.shade400),
              child: DropdownButton(
                focusColor: Colors.white,
                dropdownColor: Colors.white,
                underline: const SizedBox(),
                borderRadius:
                const BorderRadius.all(Radius.circular(10)),
                // Initial Value
                value: addexpensecontroller.lstrBusClass.value
                    .toString(),
                isExpanded: true,
                // Down Arrow Icon
                icon: const Icon(Icons.arrow_forward_ios_rounded,
                    size: 13),

                // Array list of items
                items: addexpensecontroller.busClassList
                    .map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: ts(
                      items,
                      Colors.black,
                    ),
                  );
                }).toList(),
                onChanged: (dynamic value) {
                  addexpensecontroller.fnOnChnageTrip(
                      value, "Bus");
                },
              ),
            ))
          ],
        )
            : name == "Flight"
            ? Container(
          height: 100,
          padding: const EdgeInsets.symmetric(
              horizontal: 10, vertical: 10),
          decoration: boxOutlineShadowCustom(
              Colors.white, 10.0, Colors.grey.shade400),
          child: ListView.builder(
              itemCount: addexpensecontroller
                  .filteredEmployees.value.length,
              // itemCount:  addexpensecontroller.chipsList.where((p0) => p0 == addexpensecontroller.txtSuggestionEmpCode.text).length,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                var name = addexpensecontroller
                    .filteredEmployees.value[index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Bounce(
                      onTap: () {
                        addexpensecontroller
                            .txtSuggestionEmpCode.text = "";
                        addexpensecontroller
                            .filteredEmployees.value =
                            addexpensecontroller.chipsList.value;
                        if (addexpensecontroller.selectedChips
                            .contains(name)) {
                          dprint("containeeeeeeeeeeeeddd");
                        } else {
                          addexpensecontroller.selectedChips
                              .add(name);
                        }
                      },
                      child: Text(name)),
                );
              }),
        )
            : const SizedBox(),
        gapHC(10),
        ts("Remarks", Colors.black),
        gapHC(3),
        const TextinputfieldContainer(
            showIcon: false,
            verticalPadding: 6,
            maxline: 3,
            textInputAction: TextInputAction.done,

            // focusNode: remark_focusNode,
            // onSubmitted:  (){
            //   remark_focusNode.unfocus();
            // } ,
            hintText: "Enter your remarks",
            isEnable: true,
            isObscure: false),
        gapHC(10),
        ts("Amount", Colors.black),
        gapHC(3),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: addexpensecontroller.txtAmount.value,
                obscureText: false,
                enabled: true,
                focusNode: addexpensecontroller.amountfocusNode,
                textInputAction: TextInputAction.done,
                style: const TextStyle(color: Colors.black),
                maxLines: 1,
                decoration: InputDecoration(
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 0.0),
                  hintText: 'Amount',
                  hintStyle: hintTextStyle(),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey.shade500),
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: mfnInputDecFormatters(),
                onSubmitted: (v) {
                  dprint("ONSUBMITTTTTTTTTTTTTTTT");
                  addexpensecontroller.formatNumber();
                },
                onChanged: (va) {
                  dprint("OncHNGEEEEEEEEEEEE");
                },
              ),
            ),
            gapWC(15),
            Expanded(
                child: Custombutton(
                    onTap: () {
                      getFile();
                    },
                    buttonName: "Choose file",
                    buttonColor: primaryColor,
                    buttonTextColor: Colors.white))
          ],
        ),
        gapHC(10),
        filee == null
            ? const SizedBox()
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ts("Files", Colors.black),
            gapHC(5),
            Row(
              children: [
                Image.asset(AppAssets.file),
                gapWC(10),
                Expanded(
                    child: ts(
                        filee != null ? filee!.path.split("/").last : "",
                        Colors.black)),
              ],
            ),
          ],
        ),
        gapHC(10),
      ],
    );
  }
  void _addNewWidget(name,index) {
    dprint("NAME >                >>>>>>>>>>>>>>>>>   ${name}");
    // setState(() {
    //   if (name == name) innerWidegt.add(insideScreen(name,index));
    // });
  }

  Widget checkBoxDatas(String title, String image, bool isCheck) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isCheck = !isCheck;
        });

        //  addexpensecontroller.update();
        dprint("DDDDdfgdgDDDDDD  >>>>   ${isCheck}");
      },
      child: Container(
        height: 44,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
        decoration: boxBaseDecoration(Colors.white, 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 24.0,
              width: 24.0,
              child: Checkbox(
                  activeColor: Colors.green,
                  value: isCheck,
                  hoverColor: Colors.black,
                  focusColor: Colors.black,
                  onChanged: (value) {
                    if (mounted) {
                      setState(() {
                        isCheck = !isCheck;
                      });
                    }
                  }),
            ),
            gapWC(6),
            Image.network(
              image,
              height: 18,
              width: 18,
            ),
            gapWC(4),
            Expanded(child: tchcus(title, Colors.black, 12.0, height: 0.99)),
            gapWC(10),
          ],
        ),
      ),
    );
  }
}
