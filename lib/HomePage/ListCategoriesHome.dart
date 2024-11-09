import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ok/HomePage/homeController.dart';
import 'package:ok/HomePage/model.dart';
import 'package:ok/const/imageasset.dart';


import '../AppColors.dart';
class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
           shrinkWrap: true,
          itemBuilder: (context ,index){
            return InkWell(
              onTap: (){
                controller.gotoSubItems(controller.parentcategory[index].id!);
              },
              child: ViewParentCategory(image: controller.imagename[index], name: controller.parentcategory[index].name!,)
            );
          },
          itemCount: controller.parentcategory.length,
          ),
    );
  }
}

class ViewParentCategory extends GetView<HomeControllerImp> {
  const ViewParentCategory( {super.key,required this.image,required this.name,});
 final String image;
 final String name;
  @override
  Widget build(BuildContext context) {
    return
        Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(colors: <Color>[
              AppColor.primaryColor,
               AppColor.secondColor
            ])
          ),
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
            Expanded(
              flex: 3,
              child: Container(
                child: Image.asset("${AppImageAsset.rootImage+"/"+image}",height: 100,width: 200,),
                ),
            ),
            SizedBox(width: 20,),
              Expanded(
                flex: 2,
                child: Text(
                  name,style: 
                  TextStyle(color:Colors.white ,fontWeight:FontWeight.bold,fontSize: 16),
                ),
              )
          ],),
        );
}
 
 
 
 
 
}
 