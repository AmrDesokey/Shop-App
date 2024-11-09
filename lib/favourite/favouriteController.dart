import 'package:get/get.dart';

class FavouriteController extends GetxController{
  Map isFavourite={};

  // key = id
// value = 1 or 0
setFavourite(id, val){
  isFavourite[id]= val;
  update();
}
}