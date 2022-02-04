

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_ecommerce/view/account.dart';
import 'package:get_x_ecommerce/view/cart_view.dart';
import 'package:get_x_ecommerce/view/explore_view.dart';

class ControlViewModel extends GetxController {
  int _navigatorValue=0;
  int get navigatorValue=>_navigatorValue;

   Widget _currentScreen = ExploreView();
   Widget get currentScreen=>_currentScreen;

  
  void chandSelectedValue(int index){
      _navigatorValue=index;

      switch (index) {
            case 0:
              {
                _currentScreen = ExploreView();
                
                break;
              }
            case 1:
              {
                _currentScreen = CartView();
                
                break;
              }
              case 2:
              {
                _currentScreen = AccountScreen();
                
                break;
              }
          }
      update();
  }
  
}