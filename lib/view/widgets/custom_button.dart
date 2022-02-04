
import 'package:flutter/material.dart';

import '../../constant.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function()? onPress;
  
 CustomButton({
   required this.text,
 this.onPress});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(18),
        onPressed: onPress,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
        color: primaryColor,
        child: CustomText(
          text: text,
          alignment: Alignment.center,
          color: Colors.white,
        ));
  }
}
