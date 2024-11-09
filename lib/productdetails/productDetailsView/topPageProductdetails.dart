import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ok/LinkApi.dart';

import '../../AppColors.dart';
import '../ProductdeatailsModel.dart';
import '../productdetails_controller.dart';

class TopProductPageDetails extends GetView<ProductDetailsControllerImp> {
  const TopProductPageDetails({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   Get.put(ProductDetailsControllerImp());
    return Stack(
      clipBehavior: Clip.none,
      children: [
         Container(
            height: 180,
            decoration: const BoxDecoration(color: AppColor.secondColor),
          ),
        Positioned(
            top: 30.0,
            right: Get.width / 8,
            left: Get.width / 8,
            child: Hero(
              tag:("${controller.productModel[0].id}"),
            child:CarouselSlider.builder(
                itemCount: controller.productModel.first.image!.length,
                options: CarouselOptions(height: 250),
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: CachedNetworkImage(
                      imageUrl:
                      ("${AppLink.apiImage}${controller.productModel.first.image![index].photo!}"),
                      height: 250,
                      fit: BoxFit.fill,
                    ),
                  );
                }),
            ))
      ],
    );
    
  }
}

