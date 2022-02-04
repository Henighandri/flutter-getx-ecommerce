import 'package:get/get.dart';
import 'package:get_x_ecommerce/core/viewmodel/auth_view_model.dart';
import 'package:get_x_ecommerce/core/viewmodel/control_view_model.dart';
import 'package:get_x_ecommerce/core/viewmodel/explore_view_model.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
     Get.lazyPut(() => ControlViewModel());
     Get.lazyPut(() => ExploreViewModel());
  }

}