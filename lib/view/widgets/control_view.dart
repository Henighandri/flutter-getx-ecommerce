import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_ecommerce/core/viewmodel/auth_view_model.dart';
import 'package:get_x_ecommerce/view/auth/login_screen.dart';
import 'package:get_x_ecommerce/view/home_view.dart';



class ContolView extends GetWidget<AuthViewModel> {
   ContolView({ Key? key }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Obx((){
      
      return (Get.find<AuthViewModel>().user==null)
             ?LoginScreen()
             :HomeView();
               
    }
      
    );
  }
 
}