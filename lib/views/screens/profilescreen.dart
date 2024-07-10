import 'package:flutter/material.dart';
import 'package:travel_claim/views/components/bg.dart';
import 'package:travel_claim/views/components/common.dart';
import 'package:travel_claim/views/const/appassets.dart';
import 'package:travel_claim/views/style/colors.dart';
import 'package:travel_claim/views/widgets.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar("Profile"),
        body: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
      
              children: [
                gapHC(25),
                CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(0.1),
                  radius: 45.0,
                  child:tcustom("B",primaryColor,30.0,FontWeight.bold),
                ),
                gapHC(15),
      
                Divider(color: Colors.grey.shade300,),
                gapHC(10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20
                  ),
                 decoration: boxBaseDecoration(greyLight, 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
      
                    children: [
      
                      headTitle("Employee ID", "MY GX -0000"),
                      gapHC(10),
                      headTitle("Employee name", "Basil"),
                      gapHC(10),
                      headTitle("Department", "HR"),
                      gapHC(10),
                      headTitle("Branch", "Kozhikode(MYGKK01)"),
                      gapHC(10),
                      headTitle("Base location", "Kozhikode(MYGKK01)"),
                      gapHC(10),
                      headTitle("Designation", "Assistant Managers"),
                      gapHC(10),
                      headTitle("Grade", "Grade 1"),
                      gapHC(10),
                      headTitle("Reporting Person", "Adham"),
                      gapHC(10),
                      headTitle("Email", "basil@gmail.com"),
                      gapHC(10),
                      headTitle("Mobile Number", "9087654321"),
      
      
                    ],
      
                  ),
                )
              ],
            ),
          ),
        ),
      
      ),
    );
  }
}
