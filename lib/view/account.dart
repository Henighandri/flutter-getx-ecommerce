import 'package:flutter/material.dart';

import 'widgets/custom_text.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(child: CustomText(text: "Account",fontSize: 25,),),
    );
  }
}