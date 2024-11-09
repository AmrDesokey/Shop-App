class ProductModel {
  int? id;
  String? name;
  int? price;
  String? discription;
  String? photo;
  int? categoryId;
  Null? createdAt;
  Null? updatedAt;
 

  ProductModel(
{this.id,
      this.name,
      this.price,
      this.discription,
      this.photo,
      this.categoryId,
      this.createdAt,
      this.updatedAt,
      });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    discription = json['discription'];
    photo = json['photo'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}