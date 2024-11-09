import 'package:ok/CrudApi/crud.dart';
import 'package:ok/LinkApi.dart';


class Itemsdata{
  Crud crud;

  Itemsdata(this.crud);


  //in homeController
  getData()async{
    var response =await crud.getData(AppLink.server);
    return response?.fold((l) => l, (r) => r);
  }
   getParentCategory()async{
    var response =await crud.getData(AppLink.category);
    return response?.fold((l) => l, (r) => r);
  }


  //in subItemsController
   getChildElectronicsCategory()async{
    var response =await crud.getData(AppLink.childOfElectronics);
    return response?.fold((l) => l, (r) => r);
  }


   getChildClothesCategory()async{
    var response =await crud.getData(AppLink.childOfClothes);
    return response?.fold((l) => l, (r) => r);
  }
  getChildMenCategory()async{
    var response =await crud.getData(AppLink.childOfMen);
    return response?.fold((l) => l, (r) => r);
  }
  getChildWomanCategory()async{
    var response =await crud.getData(AppLink.childOfWomen);
    return response?.fold((l) => l, (r) => r);
  }

  //in itemsController
   getProduct(int itemsId)async{
    var response =await crud.getData("${AppLink.products}$itemsId");
    return response?.fold((l) => l, (r) => r);
  }

//in ProductDeatalsController
   getProductDeatails(int productId)async{
    var response =await crud.getData("${AppLink.productsdeatails}$productId");
    return response?.fold((l) => l, (r) => r);
  }

  
}