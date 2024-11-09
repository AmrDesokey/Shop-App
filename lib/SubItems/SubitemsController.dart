import 'package:get/get.dart';
import 'package:ok/CrudApi/StatusRequest.dart';
import 'package:ok/Functions/handlingDataController.dart';
import 'package:ok/SubItems/Models.dart';
import 'package:ok/items/itemsData.dart';
import 'package:ok/routes.dart';

class SubItemsController extends GetxController{
  Itemsdata itemsdata = Itemsdata(Get.find());
  List<ChildCategoryModel> typeOfElctronics =[];
  List<ChildCategoryModel> typeOfClothes=[];
  List<ChildCategoryModel> typeOfMens=[];
  List<ChildCategoryModel> typeOfWomen=[];
late StatusRequest statusRequest;
late int categoryId;




List<String> imageOfElectronics =[
  "mobiles.png",
  "laptop.png",
  "acss.png",

];
List imageOfClothes =[
"bags.png",
"shoes.png",
"dresses.png",
"jeans.png",
"jackets.png",
"tshirt.png"
];
  List imageOfMens =[
    "jackets.png",
    "tshirt.png",
    "jeans.png",
    "shoes.png",
    "electronics.png",
  ];
  List imageOfWomans =[
    "dresses.png",
    "jackets.png",
    "shoes.png",
    "jeans.png",
    "electronics.png",
  ];


  Future getTypeofElectronics()async{
     statusRequest=StatusRequest.loading;
        update();
    var response=await itemsdata.getChildElectronicsCategory();
    statusRequest=handlingData(response);

    if(StatusRequest.success == statusRequest) {
      List responseData = response["data"];
  
      typeOfElctronics.addAll(responseData.map((e) => ChildCategoryModel.fromJson(e)));

    }else{
      statusRequest=StatusRequest.failure;
    }
    update();
  } 

  
  Future getTypeofClothes()async{
     statusRequest=StatusRequest.loading;
         update();
    var response=await itemsdata.getChildClothesCategory();
    statusRequest=handlingData(response);

    if(StatusRequest.success == statusRequest) {
      List responseData = response["data"];
  
      typeOfClothes.addAll(responseData.map((e) => ChildCategoryModel.fromJson(e)));

    }else{
      statusRequest=StatusRequest.failure;
    }
    update();
  }


  Future getTypeofMen()async{
    statusRequest=StatusRequest.loading;
    update();
    var response=await itemsdata.getChildMenCategory();
    statusRequest=handlingData(response);

    if(StatusRequest.success == statusRequest) {
      List responseData = response["data"];

      typeOfMens.addAll(responseData.map((e) => ChildCategoryModel.fromJson(e)));

    }else{
      statusRequest=StatusRequest.failure;
    }
    update();
  }
  Future getTypeofWoman()async{
    statusRequest=StatusRequest.loading;
    update();
    var response=await itemsdata.getChildWomanCategory();
    statusRequest=handlingData(response);
    if(StatusRequest.success == statusRequest) {
      List responseData = response["data"];
      typeOfWomen.addAll(responseData.map((e) => ChildCategoryModel.fromJson(e)));
    }else{
      statusRequest=StatusRequest.failure;
    }
    update();
  }

  goItems(int? itemsId){
    Get.toNamed(AppRoutes.Items,arguments:{"itemsId":itemsId});
 }
 
  @override
  void onInit() {
  getTypeofElectronics();
   getTypeofClothes();
  getTypeofMen();
  getTypeofWoman();
   categoryId=Get.arguments["categoryId"];
   print(categoryId);
    super.onInit();
  }
} 