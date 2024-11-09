import 'package:flutter/material.dart';
import 'package:ok/CrudApi/handlingDataView.dart';
import 'package:ok/HomePage/Customcarthome.dart';
import 'package:ok/HomePage/CustomtitleHome.dart';
import 'package:ok/HomePage/ListItemsHome.dart';
import 'package:ok/HomePage/homeController.dart';
import 'package:get/get.dart';
import 'package:ok/HomePage/model.dart';
import 'package:ok/routes.dart';
import '../CustomAppBar.dart';
import 'ListCategoriesHome.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => handlingDataView(
          statusRequest: controller.statusRequest, widget: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            CustomAppBar(
              titleAppBar: "Find Product",
              onPressedIcon: () {
                Get.toNamed(AppRoutes.Favourite);
              },
              onPressedSearch: () {},
            ),
            const CustomCartHome(
                title: "A Summer Surprise", body: "Cashback 20%"),
            const CustomTitleHome(title: "Categories"),
            const SizedBox(
              height: 10,
            ),
            const ListCategoriesHome(),

            // const CustomTitleHome(title: "Product for you"),
            // ListItemsHome(),
          ],
        ),
      ),
      ),
    );
  }
}
