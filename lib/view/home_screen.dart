import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/widgets.dart';
import 'package:shop_app/model/product_model.dart';
import 'package:shop_app/view/detail_item.dart';
import 'package:shop_app/view/header_drawe.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key,});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CollectionReference userdata = FirebaseFirestore.instance.collection('productList');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderDrawer(),
              drawerlist()
            ],
          ),
        ),
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
          Scaffold.of(context).openDrawer();
        }, 
        icon: const Icon(
              Icons.menu,
              size: 30,
              color: Colors.white,
            )
          )
        ),
        title: const Text(
          'Shop',
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
        ),
        backgroundColor: Colors.brown,
        actions:[
          Center(
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Center(
                child: badges.Badge(
                  showBadge: true,
                  badgeContent: Text('1'),
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.brown,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 25,
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: userdata.snapshots(),
        builder: (context, snapshot) {
          return snapshot.hasError
            ? const Center(
              child: Icon(
                Icons.info,
                color: Colors.red,
              ),
            )
            : snapshot.connectionState == ConnectionState.waiting
              ? const Center(
                child: CircularProgressIndicator(),
              )
              : GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 14/19,
              children: List.generate(
                snapshot.data!.docs.length, 
              (index) {
                var list = ProductModel.fromdocument(snapshot.data!.docs[index]);
                return Padding(
                padding: const EdgeInsets.only(left: 7,top: 8,right: 7),
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 195, 190, 190),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey
                    )
                  ),
                  child: Column(
                  children: [
                  //Image Item
                      Flexible(
                        flex: 3,
                        child: Container(
                        decoration:  BoxDecoration(
                          color: Colors.brown,
                          borderRadius: const BorderRadius.only(
                            bottomLeft:  Radius.circular(20) ,
                            bottomRight: Radius.circular(20),
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            ),
                            border: Border.all(color: Colors.grey),
                            image:  DecorationImage(
                              // fit: BoxFit.cover,
                              image: NetworkImage(
                                list.product_image,
                              )
                            )
                          ),
                        ),
                      ),
                     Expanded(
                      flex: 1,
                      child: Padding(
                      padding: const EdgeInsets.only(top: 4,left: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          list.product_name,
                                          style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            // color: Colors.white
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                        '\$ ${list.product_price}',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red
                                          )
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ),
                              Expanded(
                                flex: 1,
                                child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(
                                        context, 
                                        MaterialPageRoute(
                                          builder: (context)
                                           => DetailProduct(pro: list),
                                        )
                                      );
                                    },
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.brown,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: const Icon(
                                        Icons.shopping_cart,
                                        color: Colors.white,
                                        ),
                                      ),
                                  ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      )
                    ],
                  ),
                ),
                );
              }
            ),
          );
        }
      )
    );
  }
  
  Widget drawerlist(){
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          itemList(1,'Dashboard',Icons.dashboard_outlined),
          itemList(2,'Contacts',Icons.people_alt_outlined),
          itemList(3,'Events',Icons.event),
          itemList(4,'Notes',Icons.note),
          itemList(5,'Setting',Icons.settings),
        ],
      ),
    );
  }
  Widget itemList(int id,String title,IconData icon){
    return Material(
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}