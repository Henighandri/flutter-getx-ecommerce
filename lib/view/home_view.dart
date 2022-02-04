import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_x_ecommerce/core/viewmodel/control_view_model.dart';


class HomeView extends StatelessWidget {


 
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) =>  Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: controller.currentScreen
          ),
        ),
      ),
    );
    
  }

  Widget CustomBottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            activeIcon: Text('Explore'),
            label: "",
            icon: SvgPicture.asset(
              "assets/images/Icon_Explore.svg",
              fit: BoxFit.contain,
              width: 20,
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Text('Cart'),
            label: "",
            icon: SvgPicture.asset(
              "assets/images/Icon_Cart.svg",
              //fit: BoxFit.contain,
              width: 20,
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Text('profile'),
            label: "",
            icon: SvgPicture.asset(
              "assets/images/Icon_profile.svg",
              fit: BoxFit.contain,
              width: 20,
            ),
          ),
        ],
        elevation: 0.0,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade50,
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.chandSelectedValue(index);
          
        },
      ),
    );
  }
}
