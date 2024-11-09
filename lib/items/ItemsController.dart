import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:ok/items/ModelProduct.dart';
import 'package:ok/items/itemsData.dart';
import 'package:ok/routes.dart';

import '../CrudApi/StatusRequest.dart';
import '../Functions/handlingDataController.dart';
import '../HomePage/model.dart';


class ItemsControllerImp extends GetxController{

  Itemsdata itemsdata=Itemsdata(Get.find());
  List<ProductModel> data =[];
   StatusRequest statusRequest= StatusRequest.none;
   late int itemsID;
  List id=[];

  Future getItems(int itemsID)async{
    statusRequest=StatusRequest.loading;
    var response=await itemsdata.getProduct(itemsID);
    statusRequest=handlingData(response);
    if(StatusRequest.success == statusRequest) {
      List responseData = response["data"];
      data.addAll(responseData.map((e) => ProductModel.fromJson(e)));

    }else{
        statusRequest=StatusRequest.failure;
      }
    update();
    }
  
  GoToProduct(int productsId,ProductModel items){
    Get.toNamed(AppRoutes.Products,arguments: {"ProductsId":productsId,"items":items});
  
  }
  GoToFavourite(){
    Get.toNamed(AppRoutes.Favourite);
  
  
  }

  @override
  void onInit() {
  itemsID=Get.arguments["itemsId"];
  print(itemsID);
    getItems(itemsID);
    print(id);
    super.onInit();
  }



}