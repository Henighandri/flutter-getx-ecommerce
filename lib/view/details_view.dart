import 'package:flutter/material.dart';
import 'package:get_x_ecommerce/model/product_model.dart';
import 'package:get_x_ecommerce/view/widgets/custom_button.dart';
import 'package:get_x_ecommerce/view/widgets/custom_text.dart';

import '../constant.dart';

class DetailsView extends StatelessWidget {
  ProductModel? model;

  DetailsView({this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
              child: Container(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 270,
                        child: Image.network(
                          model!.image.toString(),
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: EdgeInsets.all(18),
                        child: Column(
                          children: [
                            CustomText(
                              text: model!.name.toString(),
                              fontSize: 26,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(16),
                                  width: MediaQuery.of(context).size.width * .4,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: Colors.grey,
                                      )),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CustomText(
                                        text: 'Size',
                                      ),
                                      CustomText(
                                        text: model!.size.toString(),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(16),
                                  width: MediaQuery.of(context).size.width * .44,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: Colors.grey,
                                      )),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CustomText(
                                        text: 'Color',
                                      ),
                                      Container(
                                        width: 30,
                                        height: 20,
                                        padding: EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.grey),
                                          borderRadius: BorderRadius.circular(20),
                                          color: model!.color,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            CustomText(
                              text: 'Details',
                              fontSize: 18,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CustomText(
                              text: model!.description.toString(),
                              fontSize: 18,
                              //height: 2.5,
                              color: Colors.black,
                              
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        CustomText(
                          text: "PRICE ",
                          fontSize: 22,
                          color: Colors.grey,
                        ),
                        CustomText(
                          text: ' \$' + model!.price.toString(),
                          color: primaryColor,
                          fontSize: 18,
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      width: 180,
                      height: 100,
                      child: CustomButton(
                        onPress: () {},
                        text: 'Add',
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
