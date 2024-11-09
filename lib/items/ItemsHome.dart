
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ok/AppColors.dart';
import 'package:ok/CrudApi/handlingDataView.dart';
import 'package:ok/LinkApi.dart';
import 'package:ok/favourite/favouriteController.dart';

import 'package:ok/items/ItemsController.dart';
import 'package:ok/items/ModelProduct.dart';
import 'package:ok/items/itemsData.dart';
import 'package:ok/productdetails/product_view.dart';
import 'package:ok/routes.dart';
import '../CustomAppBar.dart';
import '../HomePage/model.dart';
import 'CustomListItems.dart';
import 'ListCategoriesItems.dart';

class ItemsHome extends StatelessWidget {
  const ItemsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controllerImp= Get.put(ItemsControllerImp());
    Products? products;
    FavouriteController controllerFav= Get.put(FavouriteController());
    return Scaffold(
      body:  GetBuilder<ItemsControllerImp>(
        builder:(controllerImp)=>
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: [
                CustomAppBar(
                  titleAppBar: "Find Product",
                  onPressedIcon: () {
                     controllerImp.GoToFavourite();
                  },
                  onPressedSearch: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
                //  ListCategoriesItems(),
                GetBuilder<ItemsControllerImp>(
                  builder: (controller) => handlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.data.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 0.7),
                      itemBuilder: (BuildContext context, int index) {
                      //  controllerFav.isFavourite[controller.data[index]["id"]]
                        return CustomListItems(
                          onTap:(){
                            controller.GoToProduct(
                          controller.data[index].id!,
                          controller.data[index],
                          ); 
                          },
                          active: false,
                          productModel: controllerImp.data[index],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
      ),

    );
  }
}
