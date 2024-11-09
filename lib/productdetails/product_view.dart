import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ok/Cart/CartController.dart';
import 'package:ok/CrudApi/StatusRequest.dart';
import 'package:ok/CrudApi/handlingDataView.dart';
import 'package:ok/LinkApi.dart';
import 'package:ok/productdetails/ProductdeatailsModel.dart';
import 'package:ok/productdetails/productDetailsView/priceAndcount.dart';
import 'package:ok/productdetails/productDetailsView/topPageProductdetails.dart';
import 'package:ok/productdetails/productdetails_controller.dart';
import 'package:ok/routes.dart';

import '../AppColors.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
    CartController controllerCart = Get.put(CartController(), permanent: true);

    return Scaffold(
        bottomNavigationBar: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 40,
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: AppColor.secondColor,
                onPressed: () {
                  controllerCart.addToCart(controller.cartItem,controller.cartItem.id);
                  Get.snackbar("Response",
                      "Your Product ( ${controller.productModel.first.name} ) added to your Cart",
                      colorText: Colors.white,
                      backgroundColor: AppColor.primaryColor);
                },
                child: const Text(
                  "Add To Cart",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))),
        body: GetBuilder<ProductDetailsControllerImp>(
          builder: (controller) => handlingDataView(
            statusRequest: controller.statusRequest,
            widget: controller.productModel.isEmpty
                ? const CircularProgressIndicator()
                : ListView(children: [
                    const TopProductPageDetails(),
                    const SizedBox(
                      height: 100,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${controller.productModel.first.name}",    style: TextStyle(
                                  color: AppColor.primaryColor, fontSize: 20),

                            ),
                            const SizedBox(height: 10),
                            PriceAndCountItems(
                              price: "${controller.productModel.first.price}",
                            ),
                            const SizedBox(height: 10),
                            Text("${controller.productModel.first.discription}",
                                style: Theme.of(context).textTheme.bodyText1),
                            const SizedBox(height: 30),
                            const Text(
                              "Similar:",
                              style: TextStyle(
                                  color: AppColor.primaryColor, fontSize: 20),
                            ),
                            const SizedBox(height: 20),
                          ]),
                    ),
                    Container(
                      height: 200,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => InkWell(
                          onTap: (){
                            controller.getProductDeatails(controller.similar[index].id!);
                            Get.toNamed(AppRoutes.Products);
                          },
                          child: Container(
                            width: 150,
                            height: 60,
                            child:
                                Column(
                                    mainAxisSize: MainAxisSize.min, children: [
                              CachedNetworkImage(
                                imageUrl:
                                    "${AppLink.apiImage}${controller.similar[index].image![0].photo!}",
                                height: 80,
                              ),
                              const SizedBox(height: 15,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("${controller.similar[index].price}\$",style: TextStyle(color: AppColor.primaryColor,fontSize: 16,fontWeight: FontWeight.bold),),
                                      IconButton(onPressed: (){},
                                          icon:Icon(
                                            Icons.favorite_border_outlined,
                                            color: AppColor.primaryColor,) )
                                    ],
                                  ),
                                  const SizedBox(height: 5,),
                                  Text("${controller.similar[index].name}",maxLines: 2,overflow:TextOverflow.ellipsis ,),


                            ]),
                          ),
                        ),
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 13,
                          );
                        },
                        itemCount: controller.similar.length,
                      ),
                    )
                  ]),
          ),
        ));
  }
}
