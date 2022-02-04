import 'package:flutter/material.dart';
import 'package:get_x_ecommerce/view/widgets/custom_text.dart';

class CartView extends StatelessWidget {
  const CartView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: CustomText(text: "CartView",fontSize: 25,),),
    );
  }
}