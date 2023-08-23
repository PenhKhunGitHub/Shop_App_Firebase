import 'package:get/get.dart';

import '../model/product_model.dart';

class Controller extends GetxController{
  var count = 0.obs;
  var total = 0.obs;
  late ProductModel pro;
  void increment(){
    count = count + 1;
    update();
  }
  void decrement(){
    count = count - 1;
    update();
  }
   calculateGrandTotal() async {
    total += pro.product_price * count.value; 
    update();
  }
}