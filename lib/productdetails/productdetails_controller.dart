import 'package:get/get.dart';
import 'package:ok/Cart/CartItems.dart';
import 'package:ok/LinkApi.dart';
import 'package:ok/items/ModelProduct.dart';
 import 'package:ok/items/itemsData.dart';
import 'package:ok/productdetails/ProductdeatailsModel.dart';
import 'package:ok/routes.dart';
import '../CrudApi/StatusRequest.dart';
import '../Functions/handlingDataController.dart';

class ProductDetailsControllerImp extends GetxController {
  Itemsdata itemsdata=Itemsdata(Get.find());
late int productId;
late StatusRequest statusRequest;


List<ProductDeatailsModel> productModel=[];
List<Similar> similar=[];
  late CartItem cartItem;
  late int id;
  intialData() {
    ProductModel items=Get.arguments["items"];
       cartItem=CartItem(
        id:items.id! ,
        title:items.name!,
        price: items.price!,
       // image:"${AppLink.apiImage}${items.photo!}",
        count: 1,
        );
    update();
  }

  Future getProductDeatails(int productID)async{
    statusRequest=StatusRequest.loading;
    update();
    var response=await itemsdata.getProductDeatails(productID);
    statusRequest=handlingData(response);
    if(StatusRequest.success == statusRequest) {
      List responseData = response["data"];
      List similarData = response["similar"];
       productModel.addAll(responseData.map((e) => ProductDeatailsModel.fromJson(e)));
      similar.addAll(similarData.map((e) => Similar.fromJson(e)));
     }else{
        statusRequest=StatusRequest.failure;
      }
    update();
    }

   
  @override
  void onInit() {
    productId=Get.arguments["ProductsId"];
    getProductDeatails(productId);
    intialData();
     super.onInit();
   
   }
}
