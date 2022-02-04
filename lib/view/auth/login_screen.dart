import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_ecommerce/constant.dart';
import 'package:get_x_ecommerce/core/viewmodel/auth_view_model.dart';
import 'package:get_x_ecommerce/view/auth/register_view.dart';
import 'package:get_x_ecommerce/view/widgets/custom_button.dart';
import 'package:get_x_ecommerce/view/widgets/custom_button_social.dart';
import 'package:get_x_ecommerce/view/widgets/custom_text.dart';
import 'package:get_x_ecommerce/view/widgets/custom_text_form_field.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Welcome",
                      color: Colors.black,
                      fontSize: 30,
                    ),
                    CustomText(
                      text: "Sign Up",
                      color: primaryColor,
                      fontSize: 18,
                      onpress: (){
                        Get.offAll(RegisterView());
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: "Sign in to Continue",
                  color: Colors.grey,
                  fontSize: 14,
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  text: "Email",
                  hint: "abc@gmail.com",
                  onSave: (value) {

                    controller.email=value;
                  },
                  validator: (value) {
                     if(value==null){
                      print("error");
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  text: "Password",
                  hint: "********",
                  onSave: (value) {
                    controller.password=value;
                  },
                  validator: (value) {
                    if(value==null){
                      print("error");
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: "Forgot Password",
                  fontSize: 14,
                  alignment: Alignment.topRight,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                  text: 'SIGN IN',
                  onPress: () {

                    _formKey.currentState!.save();

                    if(_formKey.currentState!.validate()){
                      controller.signInWithEmailAndPassword();
                    }
                    
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: '--OR--',
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 40,
                ),
                CustomButtonSocial(
                  text: "Sign In with Facebook",
                  image: 'assets/images/fb.png',
                  onPress: () {
                    // controller.facebookSignINMethod();
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButtonSocial(
                  text: "Sign In with Google",
                  image: 'assets/images/google.jfif',
                  onPress: () {
                    controller.googleSignInMethod();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
