import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final Alignment alignment;
  final Function()? onpress;
  final FontWeight? fontWeight;
  final int? maxLines;
  

  const CustomText({
     required this.text, 
   this.color=Colors.black,
    this.fontSize=16, 
    this.alignment=Alignment.topLeft, this.onpress, this.fontWeight, this.maxLines, 
     }) ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onpress ,
          child: Container(
        alignment: alignment,
        
        child:  Text(
          text,
          style: TextStyle(color: color,fontSize: fontSize,fontWeight: fontWeight),
          maxLines: maxLines,
          ),
      ),
    );
  }
}