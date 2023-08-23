
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/controller/controller_count.dart';
import 'package:shop_app/model/product_model.dart';

// ignore: must_be_immutable
class DetailProduct extends StatefulWidget {
  DetailProduct({super.key,required this.pro});
  ProductModel pro;
  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App Bar
      appBar: AppBar(
        title: const Text(
          'Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
        ),
        backgroundColor: Colors.brown,
        actions: [
          Center(
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
          ),
          const SizedBox(
            width: 30
          )
        ],
      ),
      //Body
      body: Column(
      children: [
        //=========== Image Container ===========
        Expanded(
          flex: 2,
          child: Container(
            width: double.infinity,
            // height: 500,
            //color: Colors.brown,
            child: Image(
              //fit: BoxFit.cover,
              image: NetworkImage(
                widget.pro.product_image
              )
            )
          ),
        ),
        //========== Charator ===============
        Expanded(
          flex: 2,
          child: Container(
            width: double.infinity,
            // height: 550,
            decoration: const BoxDecoration(
              color: Colors.brown,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30)
              )
            ),
            child: Column(
              children: [
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        // ========= Name Cocacola ==========
                        Padding(
                          padding: const EdgeInsets.only(top: 1,left: 5),
                        child: Row(
                          children: [
                            Text(
                              widget.pro.product_name,
                              style:const TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        // ========= Price Cocacola ==========
                        Padding(padding: const EdgeInsets.only(top: 1,left: 5),
                        child: Row(
                          children: [
                            Text(
                              '\$ ${widget.pro.product_price}',
                              style:const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                                )
                              )
                            ],
                          ),
                        ),
                        // ========= Total & Qty ==========
                        Padding(
                          padding: const EdgeInsets.only(top: 1,left: 5),
                        child: Row(
                          children: [
                            // ========= Total Cocacola ==========
                              Expanded(
                                flex: 2,
                                child: Text(
                                  'Total: ${widget.pro.total()}',
                                  style:TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.white)
                                )
                              ),
                              // ========= Qty Cocacola ==========
                              Expanded(
                                flex: 2,
                                child: Row(
                                  children: [
                                    GetBuilder<Controller>(
                                      builder: (_) => Text (
                                      'Qty: ${controller.count}',
                                      style: const TextStyle(
                                        fontSize:20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                      )
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: GestureDetector(
                                        onTap: () {
                                          controller.decrement();
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(20)
                                          ),
                                          child: const Icon(
                                            CupertinoIcons.minus,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    ),
                                    //size of btn add
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: GestureDetector(
                                        onTap: () => controller.increment(),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(20)
                                          ),
                                          child: const Icon(
                                            CupertinoIcons.plus,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              )
                            ],
                          ),
                        ),
                        const Expanded(
                          child: Divider(
                            color: Colors.white,
                            thickness: 2,
                          ),
                        )
                      ], 
                    ),
                  ),
                ),
                
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          widget.pro.description,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white
                          ),
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: const Icon(
                                    Icons.shopping_cart,
                                    size: 30,    
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Add To Card',
                                      style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ),
              ],
            ),
          ),
        )
      ],
          ),
    );
  }
}