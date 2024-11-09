import 'package:get/get.dart';
import 'package:ok/routes.dart';


import '../CrudApi/StatusRequest.dart';
import '../CrudApi/dataRemote/test_data.dart';
import '../Functions/handlingDataController.dart';
import '../items/itemsData.dart';
import 'model.dart';

abstract class HomeController extends GetxController{

  gotoSubItems(int index);
}
class HomeControllerImp extends HomeController{

  Itemsdata itemsdata= Itemsdata(Get.find());

  @override
  void onInit() {
    // getItems();
    getParentCategory();
    super.onInit();
  }
  List<Products> data =[];
  List<ParentCategoryModel> parentcategory=[];
  late StatusRequest statusRequest;

  Future getParentCategory()async{
    statusRequest=StatusRequest.loading;
    var response=await itemsdata.getParentCategory();
    statusRequest=handlingData(response);
     if(StatusRequest.success == statusRequest) {
      List responseData = response["data"];
       parentcategory.addAll(responseData.map((e) => ParentCategoryModel.fromJson(e)));
    }else{
      statusRequest=StatusRequest.failure;
    }
    update();
  
  }

  List<String> imagename=[
    "electronics.png",
    "clothes.png",
    "menWear.png",
    "womenWear.png",
  ];


  @override
  gotoSubItems(categoryId) {
    Get.toNamed(AppRoutes.subItems,arguments: {"categoryId":categoryId});
  }


}