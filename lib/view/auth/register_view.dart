import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_ecommerce/core/viewmodel/auth_view_model.dart';
import 'package:get_x_ecommerce/view/auth/login_screen.dart';
import 'package:get_x_ecommerce/view/widgets/custom_button.dart';
import 'package:get_x_ecommerce/view/widgets/custom_text.dart';
import 'package:get_x_ecommerce/view/widgets/custom_text_form_field.dart';

class RegisterView extends GetWidget<AuthViewModel>{
   RegisterView({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       appBar: AppBar(
         backgroundColor: Colors.white,
         elevation: 0,
         leading: InkWell(
           onTap: (){
             Get.offAll(LoginScreen());
           },
           child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
       ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
                      child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 SizedBox(height: 20,),
                CustomText(
                  text: "Sign Up",
                  color: Colors.black,
                  fontSize: 30,
                ),
               
                CustomTextFormField(
                  text: "Name",
                  hint: "Your Name",
                  onSave: (value) {
                     controller.name=value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print("error");
                    }
                  },
                ),
              
                CustomTextFormField(
                  text: "Email",
                  hint: "abc@gmail.com",
                  onSave: (value) {
                     controller.email=value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print("error");
                    }
                  },
                ),
               
                CustomTextFormField(
                  text: "Password",
                  hint: "********",
                  onSave: (value) {
                     controller.password=value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print("error");
                    }
                  },
                ),
                 CustomTextFormField(
                  text: "Phone",
                  hint: "12345678",
                  onSave: (value) {
                   controller.phone=value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print("error");
                    }
                  },
                ),
                CustomButton(text: 'Sign Up',onPress: (){
                   _formKey.currentState!.save();

                      if(_formKey.currentState!.validate()){
                        controller.createUserWithEmailAndPassword();
                      }
                      
                },),
                SizedBox(height: 30,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
