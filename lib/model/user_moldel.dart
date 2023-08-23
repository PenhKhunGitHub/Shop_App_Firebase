
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  late String profile;
  late String name;
  late int age;
  // late String product_image;
  // late String product_name;
  // late String product_price;
  UserModel({
    required this.profile,
    required this.name,
    required this.age,
    // required this.product_image,
    // required this.product_name,
    // required this.product_price
  });
  //Convert Data To Map
  Map<String,dynamic> toMap(){
    return {
      'profile' : profile,
      'name'  : name,
      'age'   : age,
      // 'product_image' : product_image,
      // 'product_name' : product_name,
      // 'product_price' : product_price
    };
  }
  //Function Convert to Object
  UserModel.fromdocument(DocumentSnapshot doc)
    : profile = doc['profile'],
      name = doc['name'],
      age = doc['age'];
      // product_image = doc['product_image'],
      // product_name = doc['product_name'],
      // product_price = doc['product_price'];
}