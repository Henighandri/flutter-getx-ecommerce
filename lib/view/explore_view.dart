import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:get_x_ecommerce/core/viewmodel/explore_view_model.dart';
import '../constant.dart';
import 'details_view.dart';
import 'widgets/custom_text.dart';

class ExploreView extends StatelessWidget {
   ExploreView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExploreViewModel>(
          init: Get.find<ExploreViewModel>(),
          builder:(controller)=>controller.loading.value ?
          Center(child: CircularProgressIndicator(),)
          : Container(
              margin: EdgeInsets.only(top: 50, left: 20, right: 20),
              child: Column(
                children: [
                  _searchTextFormField(),
                  SizedBox(
                    height: 20,
                  ),
                  //
                  CustomText(
                    text: "Categories",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  _listViewcategory(controller),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Best Selling",
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      CustomText(
                        text: "See all",
                        color: Colors.black,
                        fontSize: 18,
                        onpress: () {},
                      ),
                    ],
                  ),
                  _listViewProduct(controller),
                ],
              ),
            ),
    );
  }
   Widget _listViewcategory(ExploreViewModel controller) {
    return Container(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.listCategorie.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            width: 80,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
               // SvgPicture.network(controller.listCategorie[index].icon.toString(),),
                Image.network(controller.listCategorie[index].icon.toString()),
            
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: controller.listCategorie[index].label.toString(),
                  alignment: Alignment.center,
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 20,
          );
        },
      ),
    );
  }

  Widget _listViewProduct(ExploreViewModel controller) {
    return Container(
        height: 350,
        child: ListView.separated(
    scrollDirection: Axis.horizontal,
    itemCount: controller.listProducts.length,
    itemBuilder: (context, index) {
      return GestureDetector(
         onTap: (){
               Get.to(DetailsView(model: controller.listProducts[index]),);
            },
              child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Expanded(
                  child: Image.network(
                controller.listProducts[index].image.toString(),
                height: 250,
              )),
              SizedBox(
                height: 10,
              ),
              CustomText(
                text: controller.listProducts[index].name.toString(),
                color: Colors.black,
                fontSize: 16,
              ),
              CustomText(
                text: controller.listProducts[index].description.toString(),
                color: Colors.grey,
                fontSize: 12,
                maxLines: 1,
              ),
              CustomText(
                text: "\$${controller.listProducts[index].price.toString()}",
                color: primaryColor,
                fontSize: 16,
              ),
            ],
          ),
        ),
      );
    },
    separatorBuilder: (context, index) {
      return SizedBox(
        width: 20,
      );
    },
        ),
      );
  }

  Widget _searchTextFormField() {
    
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}