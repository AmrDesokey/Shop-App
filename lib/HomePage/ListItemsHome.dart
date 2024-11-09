import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ok/HomePage/homeController.dart';

import '../AppColors.dart';
import 'package:get/get.dart';
class ListItemsHome extends StatelessWidget {
  const ListItemsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controllerImp= Get.put(HomeControllerImp());
    return  Container(
      height: 120,
      child: ListView.builder(
          itemCount: controllerImp.data.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,i){
            return Stack(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: CachedNetworkImage(
                    height: 80,width: 150,
                    fit: BoxFit.fill, imageUrl: controllerImp.data[i].thumbnail!,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppColor.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  height: 100,
                  width: 180,
                ),
                 Positioned(
                  top: 10,
                  left:10,
                  child: Text(controllerImp.data[i].title!,
                    style: const TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold,fontSize: 14),),),
              ],
            );
          }
      ),
    );
  }
}
