import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel{
  late int id;
  late String product_name;
  late int product_price;
  late int product_qty;
  late String product_image;
  late String description;
  
  ProductModel({
    required this.id,
    required this.product_name,
    required this.product_qty,
    required this.product_image,
    required this.product_price,
    required this.description
  });
  int total(){
    return (product_price * product_qty);
  }
  //Convert Data To Map
  Map<String,dynamic> toMap(){
    return {
      'id' : id,
      'productname'  : product_name,
      'productqty'   : product_qty,
      'productimage' : product_image,
      'productprice' : product_price,
      'description'  : description
    };
  }
  //Function Convert to Object
  ProductModel.fromdocument(DocumentSnapshot doc)
    : id = doc['id'],
      product_image = doc['productimage'],
      product_name = doc['productname'],
      product_qty = doc['productqty'],
      product_price = doc['productprice'],
      description= doc['description'];
}

