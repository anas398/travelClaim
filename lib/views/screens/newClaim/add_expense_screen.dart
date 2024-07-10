


import 'dart:io';

import 'package:bounce/bounce.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
  List<Widget> _widgetList = [];
  File? filee;
  final FocusNode remark_focusNode = FocusNode();
  final FocusNode amount_focusNode = FocusNode();
  final FocusNode purpose_focusNode = FocusNode();
  final FocusNode from_focusNode = FocusNode();
  final FocusNode to_focusNode = FocusNode();
  @override
  void dispose() {
    // Clean up the focus node when the widget is disposed
    remark_focusNode.dispose();
    amount_focusNode.dispose();
    purpose_focusNode.dispose();
    from_focusNode.dispose();
    to_focusNode.dispose();
    super.dispose();
  }
  @override
  void initState() {
    addexpensecontroller.selectedCtegory.value=[];
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                        padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                                  "Basil(MYGX-123)",
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
                                  "Kozhikode",
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
                          value: addexpensecontroller.lstrTypeofTrip.value
                              .toString(),
                          isExpanded: true,
                          // Down Arrow Icon
                          icon: const Icon(Icons.arrow_forward_ios_rounded,
                              size: 13),

                          // Array list of items
                          items: addexpensecontroller.typeOfTripList
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
                            addexpensecontroller.fnOnChnageTrip(value, "Trip");
                          },
                        ),
                      )),


                      gapHC(15),
                      ts("Branch name", Colors.black),
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
                          value: addexpensecontroller.lstrBranchName.value
                              .toString(),
                          isExpanded: true,
                          // Down Arrow Icon
                          icon: const Icon(Icons.arrow_forward_ios_rounded,
                              size: 13),

                          // Array list of items
                          items:
                          addexpensecontroller.branchList.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: ts(
                                items,
                                Colors.black,
                              ),
                            );
                          }).toList(),
                          onChanged: (dynamic value) {
                            addexpensecontroller.fnOnChnageTrip(value, "Branch");
                          },
                        ),
                      )),
                      gapHC(15),
                      ts("Purpose of trip", Colors.black),
                      gapHC(3),
                      Container(
                        child: TextinputfieldContainer(
                            showIcon: false,
                            focusNode: purpose_focusNode,
                            onSubmitted:  (){
                              purpose_focusNode.unfocus();
                            } ,
                            verticalPadding: 6,
                            textInputAction: TextInputAction.done,
                            controller: addexpensecontroller.txtpurposeTrip,
                            maxline: 3,
                            hintText: "Enter your purpose",
                            isEnable: true,
                            isObscure: false),
                      ),
                      gapHC(20),
                      Obx(()=>  Container(

                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        decoration: boxBaseDecoration(greyLight, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            tssb("Categories", Colors.black, FontWeight.bold),
                            gapHC(12),
                            GridView.builder(
                                padding: EdgeInsets.zero,

                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, // 2 columns
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                  childAspectRatio: 7.7 / 2,

                                ),
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                itemCount:addexpensecontroller.expenseCategory.value.length ,
                                itemBuilder: (ontext,index){
                                  var image=addexpensecontroller.expenseCategory.value[index]["image"];
                                  var oncheck=addexpensecontroller.expenseCategory.value[index]["value"];
                                  var title=addexpensecontroller.expenseCategory.value[index]["label"];
                                  return Container(
                                    height: 44,
                                    padding: EdgeInsets.symmetric(horizontal: 5,vertical: 4),

                                    decoration: boxBaseDecoration(Colors.white, 6),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          height: 24.0,
                                          width: 24.0,
                                          child: Checkbox(
                                            activeColor: Colors.green,
                                            value: oncheck,
                                            hoverColor: Colors.black,
                                            focusColor: Colors.black,
                                            onChanged: (curValue) {
                                              dprint("curValue>>> ${curValue}");
                                              setState(() {
                                                addexpensecontroller.expenseCategory.value[index]["value"] = curValue;
                                              });
                                              if(  addexpensecontroller.expenseCategory.value[index]["value"]==true){
                                                addexpensecontroller.selectedCtegory.value = addexpensecontroller.expenseCategory.value;
                                                dprint("### addexpensecontroller.selectedCtegory#  >>>  ${  addexpensecontroller.selectedCtegory}");
                                              }

                                            },

                                          ),
                                        ),
                                        gapWC(6),
                                        Image.asset(
                                          image,
                                          height: 18,
                                          width: 18,
                                        ),
                                        gapWC(4),
                                        Expanded(child: tchcus(title, Colors.black,12.0,height: 0.99)),
                                        gapWC(10),
                                      ],
                                    ),
                                  );
                                })



                            //   Obx(()=>Wrap(
                            //     direction: Axis.horizontal,
                            //   spacing: 20,
                            //   runSpacing: 15,
                            //   crossAxisAlignment: WrapCrossAlignment.end,
                            //   alignment: WrapAlignment.start,
                            //   clipBehavior: Clip.antiAliasWithSaveLayer,
                            //   runAlignment: WrapAlignment.start,
                            //   children: addexpensecontroller.expenseCategory.value.map((item) {
                            //     var image = item["image"];
                            //     var title = item["label"];
                            //     var oncheck =item["value"];
                            //     return   Container(
                            //       height: 35,
                            //       decoration: boxBaseDecoration(Colors.white, 6),
                            //       child: Row(
                            //         mainAxisSize: MainAxisSize.min,
                            //         children: [
                            //           Checkbox(
                            //             activeColor: Colors.green,
                            //             value: item["value"],
                            //             hoverColor: Colors.black,
                            //             focusColor: Colors.black,
                            //             onChanged: (curValue) {
                            //               setState(() {
                            //                 oncheck = curValue!;
                            //               });
                            //               dprint("####  >>>  ${  item["value"]  }  ${  item["label"] }");
                            //             },
                            //
                            //
                            //
                            //           ),
                            //           Image.asset(
                            //             image,
                            //             height: 25,
                            //             width: 25,
                            //           ),
                            //           gapWC(7),
                            //           tss(title, Colors.black, 15.0),
                            //           gapWC(20),
                            //         ],
                            //       ),
                            //     );
                            //
                            //   }).toList(),
                            // ))




                          ],
                        ),
                      ),),
                      gapHC(10),
                      ListView.builder(
                          itemCount:  addexpensecontroller.selectedCtegory.value.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: ScrollPhysics(),
                          itemBuilder: (context,index){
                            dprint("!!1>>>>   ${addexpensecontroller.selectedCtegory}");
                            return Obx(()=>Column(
                              children: [
                                Bounce(
                                    onTap: (){
                                      setState(() {
                                        addexpensecontroller.selectedCtegory.value[index]["expand"] =! addexpensecontroller.selectedCtegory.value[index]["expand"];

                                      });
                                      dprint("DDDD>> ${addexpensecontroller.selectedCtegory.value[index]["expand"]}");

                                    },
                                    child: addexpensecontroller.selectedCtegory.value[index]["value"]? Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 5),
                                      child: expansionTile(  addexpensecontroller.selectedCtegory.value[index]["image"]!, addexpensecontroller.selectedCtegory.value[index]["label"]),
                                    )
                                        :SizedBox()
                                ),

                                addexpensecontroller.selectedCtegory.value[index]["expand"]?
                                Column(
                                  children: [
                                    categoryExpanded(indexxx: index),
                                    Bounce(
                                      onTap: (){
                                        setState(() {
                                          _widgetList.add(categoryExpanded());
                                        });
                                        },
                                      child: Container(
                                        decoration: boxOutlineCustom(Colors.white,10.0,primaryColor),
                                        padding: const EdgeInsets.symmetric(vertical: 9,horizontal: 20),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            tssb("Add more", Colors.black, FontWeight.w500),
                                            gapWC(2),
                                            Icon(Icons.add,color: Colors.black,)
                                          ],
                                        ),
                                      ),
                                    ),
                                    gapHC(10)
                                  ],
                                )
                                    :const SizedBox(),
                              ],
                            ),);
                          }),
                      gapHC(20),


                      gapHC(3),
                      const Divider(),

                      gapHC(50),
                    ],
                  ),
                ),
              ),
              gapHC(20),















              Row(
                children: [
                  Expanded(
                      child:Custombutton(onTap: (){
                        dprint("save draftsssssss");
                      }
                          , buttonName: "Save draft",
                          buttonColor: Colors.white,
                          buttonBorderColor:Colors.grey.shade400,
                          buttonTextColor: primaryColor)),
                  gapWC(20),
                  Expanded(
                      child:Custombutton(onTap: (){
                        dprint("contineueeee");
                        Get.to(()=>Claimconfirmation());
                      }
                          , buttonName: "Continue",
                          buttonColor: primaryColor,
                          buttonTextColor: Colors.white)
                  ),
                ],
              ),
              gapHC(20)
            ],
          ),
        ),
      ),
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
              onChanged: (bool ?value) {
                print("onchangeeee  ${value}");
                setState(() {
                  checkerValue  = value!;
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


  void itemChange(bool val, e,contr) {
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


  Widget categoryExpanded({indexxx}){
    Size size =MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        gapHC(20),
        ts("1.${addexpensecontroller.selectedCtegory.value[indexxx]["label"]=="Air"?"Flight":addexpensecontroller.selectedCtegory.value[indexxx]["label"]} details", primaryColor, weight: FontWeight.w500),
        const Divider(),
        gapHC(10),
        ts("From", Colors.black),
        gapHC(3),
        TextinputfieldContainer(
            showIcon: false,
            verticalPadding: 6,
            maxline: 1,
            keybordType: TextInputType.name,
            focusNode: from_focusNode,
            onSubmitted:  (){
              from_focusNode.unfocus();
            } ,
            hintText: "From",
            isEnable: true,
            isObscure: false),
        gapHC(10),
        ts("To", Colors.black),
        gapHC(3),
        TextinputfieldContainer(
            showIcon: false,
            verticalPadding: 6,
            maxline: 1,
            keybordType: TextInputType.name,
            focusNode: to_focusNode,
            onSubmitted:  (){
              to_focusNode.unfocus();
            } ,
            hintText: "To",
            isEnable: true,
            isObscure: false),
        gapHC(10),
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
                  ts(
                      setDate(
                          6,
                          addexpensecontroller.fromDate.value
                          as DateTime),
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
        gapHC(10),
        tcustom(
            "Number of employee", Colors.black, 14.0, FontWeight.w500),
        gapHC(3),
        Row(
          children: [
            Bounce(
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
                var txtVal=mfnInt(addexpensecontroller.txtNoOfEmployee.text);
                txtVal  = txtVal == 0?0:txtVal-1;
                addexpensecontroller.txtNoOfEmployee.text =  txtVal.toString();
              },
              child: Container(
                height: 45,
                padding: const EdgeInsets.all(12),
                decoration: boxBaseDecorationC(
                    primaryColor, 10, 0.0, 10, 0.0),
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
                child:  TextFormField(
                  enabled: true,
                  inputFormatters: mfnInputDecFormatters(),
                  controller:addexpensecontroller.txtNoOfEmployee,
                  textAlign: TextAlign.center,
                  // keyboardType:keybordType=="txtKeybrd"?TextInputType.text: TextInputType.number,
                  keyboardType:const TextInputType.numberWithOptions(signed: true,decimal: true),

                  decoration:  InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 4,
                        horizontal: 2),
                    focusColor:Colors.grey.shade100 ,
                    focusedBorder:
                    OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1.0),
                      borderSide: BorderSide(
                          width:1, color: Colors.grey.shade400), //<-- SEE HERE
                    ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1.0),
                      borderSide: BorderSide(
                          width: 1, color: Colors.grey.shade400), //<-- SEE HERE
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
                addexpensecontroller.txtNoOfEmployee.text =  (mfnInt(addexpensecontroller.txtNoOfEmployee.text)+1).toString();
              },
              child: Container(
                height: 45,
                padding: const EdgeInsets.all(12),
                decoration: boxBaseDecorationC(
                    primaryColor, 0, 10.0, 0, 10.0),
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
        addexpensecontroller.selectedChips.isNotEmpty && addexpensecontroller.selectedCtegory.value[indexxx]["label"]=="Air"? Obx(
              () => Column(
            children: [
              Container(
                width: double.infinity,
                padding:
                const EdgeInsets.symmetric(horizontal: 10,),
                decoration: boxOutlineCustom(
                    Colors.white, 10, Colors.grey.shade400),
                child: Wrap(
                  spacing: 9.0,
                  runSpacing: -7,
                  children:
                  addexpensecontroller.selectedChips.value.map((chip) {
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
        ):SizedBox(),
        addexpensecontroller.selectedCtegory.value[indexxx]["label"]=="Air"? Container(
          height: 100,
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          decoration: boxOutlineShadowCustom(Colors.white, 10.0,Colors.grey.shade400),
          child: ListView.builder(
              itemCount: addexpensecontroller.chipsList.value.length,
              physics: ScrollPhysics(),
              itemBuilder: (context,index){
                var name = addexpensecontroller.chipsList.value[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Bounce(
                      onTap: (){
                        if(addexpensecontroller.selectedChips.contains(name)){
                          dprint("containeeeeeeeeeeeeddd");
                        }else{
                          addexpensecontroller.selectedChips.add(name);
                        }

                      },
                      child: Text(name)),
                );
              }),
        ):
        addexpensecontroller.selectedCtegory.value[indexxx]["label"]=="Train"?
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
    )):SizedBox(),

        gapHC(10),
        ts("Remarks", Colors.black),
        gapHC(3),
        TextinputfieldContainer(
            showIcon: false,
            verticalPadding: 6,
            maxline: 3,
            textInputAction: TextInputAction.done,

            focusNode: remark_focusNode,
            onSubmitted:  (){
              remark_focusNode.unfocus();
            } ,
            hintText: "Enter your remarks",
            isEnable: true,
            isObscure: false),
        gapHC(10),
        ts("Amount", Colors.black),
        gapHC(3),
        Row(
          children: [
            Expanded(
              child: TextinputfieldContainer(
                  showIcon: false,
                  verticalPadding: 6,
                  maxline: 1,
                  keybordType: TextInputType.number,
                  focusNode: amount_focusNode,
                  onSubmitted:  (){
                    amount_focusNode.unfocus();
                  } ,
                  hintText: "Amount",
                  isEnable: true,
                  isObscure: false),
            ),
            gapWC(15),
            Expanded(
              child: Bounce(
                onTap: (){
                  dprint("Asssssssssssss");
                  getFile();
                },
                child: Center(
                  child: Container(
                    height: 45,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: boxOutlineCustom(
                        primaryColor, 20, Colors.grey.withOpacity(0.5)),
                    child: Center(
                        child: ts("Choose file", Colors.white,
                            align: TextAlign.start)),
                  ),
                ),
              ),
            )
          ],
        ),
        gapHC(10),

        filee==null?SizedBox(): Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ts("Files", Colors.black),
            gapHC(5),
            Row(
              children: [
                Image.asset(AppAssets.file),
                gapWC(10),
                Expanded(child: ts(filee != null ? filee!.path.split("/").last : "", Colors.black)),
              ],
            ),
          ],
        ),
        gapHC(10),

      ],
    );
  }

}
