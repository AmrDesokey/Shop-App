import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ok/CrudApi/handlingDataView.dart';
import 'package:ok/Functions/handlingDataController.dart';
import 'package:ok/HomePage/ListCategoriesHome.dart';
import 'package:ok/SubItems/SubitemsController.dart';
import 'package:ok/const/imageasset.dart';

import '../AppColors.dart';

class SubItems extends GetView<SubItemsController> {
  const SubItems({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SubItemsController());
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 30, left: 10, right: 10),
        child: GetBuilder<SubItemsController>(
          builder: (controller) => handlingDataView(
            statusRequest: controller.statusRequest,
            widget: GridView.builder(
              shrinkWrap: true,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
              itemCount: controller.categoryId == 20
                  ? controller.typeOfElctronics.length
                  : controller.categoryId == 24
                      ? controller.typeOfClothes.length
                      : controller.categoryId == 35
                          ? controller.typeOfMens.length
                          : controller.categoryId == 38
                              ? controller.typeOfWomen.length
                              : null,
              itemBuilder: (context, index) => Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 200,
                child: InkWell(
                  onTap: () {
                    controller.goItems(
                      controller.categoryId == 20
                          ? controller.typeOfElctronics[index].id
                          : controller.categoryId == 24
                              ? controller.typeOfClothes[index].id
                              : controller.categoryId == 35
                                  ? controller.typeOfMens[index].id
                                  : controller.categoryId == 38
                                      ? controller.typeOfWomen[index].id
                                      : null,
                    );
                  },
                  child: Container(
                    child: ViewParentCategory(
                      image: controller.categoryId == 20
                          ? controller.imageOfElectronics[index]
                          : controller.categoryId == 24
                              ? controller.imageOfClothes[index]
                              : controller.categoryId == 35
                                  ? controller.imageOfMens[index]
                                  : controller.categoryId == 38
                                      ? controller.imageOfWomans[index]
                                      : "",
                      name: controller.categoryId == 20
                          ? controller.typeOfElctronics[index].name!
                          : controller.categoryId == 24
                              ? controller.typeOfClothes[index].name!
                              : controller.categoryId == 35
                                  ? controller.typeOfMens[index].name!
                                  : controller.categoryId == 38
                                      ? controller.typeOfWomen[index].name!
                                      : "",
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
