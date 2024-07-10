import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:travel_claim/views/components/common.dart';

class TextinputfieldContainer extends StatelessWidget {
  final bool showIcon;
  final bool isEnable;
  final int ?maxline;
  final double ?verticalPadding;
  final bool isObscure;
  final String ?hintText;
  final TextEditingController? controller;
  final TextInputType ?keybordType;
  final IconData ? suffixIcon;
  final VoidCallback ? suffixIconOnclick;
  final VoidCallback ? onSubmitted;
  final TextInputAction ? textInputAction;
  final FormFieldValidator ? validate;
  final double ? boxRadius;
  final Color ? boxRadiusColor;
  final FocusNode ? focusNode;
  final EdgeInsetsGeometry ? contentPadding;


  const TextinputfieldContainer({super.key, required this.showIcon,  this.hintText,  this.controller,  this.keybordType, required this.isEnable,    this.suffixIcon, this.suffixIconOnclick, this.validate, required this.isObscure,  this.maxline, this.verticalPadding, this.boxRadius, this.boxRadiusColor, this.contentPadding, this.focusNode, this.onSubmitted, this.textInputAction,});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isObscure,
      enabled: isEnable,
        textInputAction:textInputAction ,
      focusNode: focusNode,


      style: const TextStyle(color: Colors.black),
      maxLines: maxline,
      decoration: InputDecoration(
        contentPadding:contentPadding?? EdgeInsets.symmetric(
          horizontal: 10,
            vertical: verticalPadding??0.0
        ),
        suffixIcon:showIcon? Bounce(
          onTap: suffixIconOnclick,

          child: Icon(
             suffixIcon,
            color: Colors.grey.shade600,

          ),
        ):SizedBox(),
        hintText: hintText,
        hintStyle: hintTextStyle(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(boxRadius??10.0),
          borderSide:  BorderSide(color: Colors.grey.shade400),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(boxRadius?? 10.0),
          borderSide:  BorderSide(color:boxRadiusColor?? Colors.grey.shade500),
        ),
    ),
      keyboardType: keybordType,
      onSubmitted: (va){
        onSubmitted;
      }


    );
  }
}



