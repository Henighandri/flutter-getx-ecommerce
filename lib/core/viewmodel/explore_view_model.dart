import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_x_ecommerce/core/services/explore_service.dart';
import 'package:get_x_ecommerce/helper/extenstion.dart';
import 'package:get_x_ecommerce/model/categorie_model.dart';
import 'package:get_x_ecommerce/model/product_model.dart';

class ExploreViewModel extends GetxController {
  List<CategorieModel> _listCategorie = [];
  List<CategorieModel> get listCategorie => _listCategorie;

 List<ProductModel> _listProducts = [];
  List<ProductModel> get listProducts => _listProducts;

  ValueNotifier<bool> _loading=ValueNotifier(false);
  ValueNotifier<bool> get loading=>_loading;

  ExploreViewModel() {
    getCategory();
    getBestSellingProducts();
  }

  getCategory() async {
    _loading.value=true;
  await  ExploreService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        
        _listCategorie.add(
            CategorieModel(icon: value[i]['icon'], label: value[i]['label'],idCategory: value[i].id));
      }
      
      _loading.value=false;
      update();
    });
  }
  getBestSellingProducts()async{
     _loading.value=true;
 await  ExploreService().getallProducts().then((value) {
      for (int i = 0; i < value.length; i++) {
        //print(value[i].data().toString());
        _listProducts.add(
            ProductModel(
              name: value[i]["name"],
              categoryId: value[i]["CategoryId"],
              color: HexColor.fromHex(value[i]["color"]),
              description: value[i]["description"],
              image: value[i]["image"],
              price: value[i]["price"],
              size: value[i]["size"]
            )
            );
          
      }
      
      _loading.value=false;
      update();
     
    });

  }
}
