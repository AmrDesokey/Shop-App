import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ok/items/ItemsController.dart';
import 'package:ok/items/ModelProduct.dart';
import 'package:ok/routes.dart';
import '../AppColors.dart';
import '../HomePage/model.dart';
import '../LinkApi.dart';
import '../productdetails/ProductdeatailsModel.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  const CustomListItems({Key? key,required this.productModel,required this.active,required this.onTap}) : super(key: key);
 final  ProductModel productModel;
 final bool active;
 final void Function() onTap;
  @override
  Widget build(BuildContext context) {
        return InkWell(
          onTap:onTap,
          child: Container(
            height: 200,
            width: 200,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     //CachedNetworkImage(imageUrl:"${AppLink.apiImage}${productModel.photo!}",height: 100,),
                     const SizedBox(height: 10,),
                      Text(productModel.name!,style: const TextStyle(color: AppColor.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          ),
                          maxLines: 3, 
                          overflow: TextOverflow.ellipsis,
                     ),
                    const SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Text("${productModel.price}\$",style: const TextStyle(color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,fontFamily: "sans"),),
                        IconButton(onPressed: (){},
                            icon:Icon(
                              active?
                              Icons.favorite:Icons.favorite_border_outlined,
                              color: AppColor.primaryColor,) ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
  }
}
