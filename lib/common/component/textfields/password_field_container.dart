
import 'package:flutter/material.dart';
import 'package:gmc_erp/public/constant/color.dart';
import 'package:hexcolor/hexcolor.dart';

class PasswordTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Set<void> Function() onPress;
  final bool hidePassword;
  const PasswordTextField({
    Key key,
     this.hintText,
     this.controller,
     this.onPress,
     this.hidePassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: HexColor(kNornalTextFieldColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        obscureText: hidePassword,
        cursorColor: kCurso01,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: hintText,
          suffixIcon:  IconButton(icon: Icon(hidePassword ? Icons.visibility_outlined  : Icons.visibility_off_outlined , color: HexColor(kInvisible),),
            onPressed: onPress,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
