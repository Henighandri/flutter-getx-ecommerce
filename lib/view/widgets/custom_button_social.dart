
import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  const CustomButtonSocial({
    Key? key, required this.text, required this.image,  this.onPress,
  }) : super(key: key);
final String text,image;
final Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        padding: EdgeInsets.all(18),
        onPressed: onPress,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
        child: Row(
         
          children: [
            Image.asset(
             image,
              height: 20,
            ),
            SizedBox(
              width: 50,
            ),
            CustomText(
              text: text,
            )
          ],
        ));
  }
}
