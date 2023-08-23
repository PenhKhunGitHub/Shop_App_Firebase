import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/model/user_moldel.dart';
import 'package:shop_app/view/home_screen.dart';

class CloudFireStore extends StatefulWidget {
  const CloudFireStore({super.key});

  @override
  State<CloudFireStore> createState() => _CloudFireStoreState();
}

class _CloudFireStoreState extends State<CloudFireStore> {
  CollectionReference userData = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text(
          'Cluod Firestore Database',
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Center(
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 78, 48, 37),
                  borderRadius: BorderRadius.circular(50)
                ),
                child:const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: userData.snapshots(),
        //initialData: Firebase.initializeApp(),
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
              : ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var user = UserModel.fromdocument(snapshot.data!.docs[index]);
                  return Card(
                  color: Colors.brown,
                  //elevation: 0,
                   child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => const HomeScreen(),)
                      );
                    },
                    leading: CircleAvatar(
                      maxRadius: 25,
                      backgroundImage: NetworkImage(user.profile),
                    ),
                    subtitle: Text(
                      'Age : ${user.age}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    title: Text(
                      user.name,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                   ),
              );
            }
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        
        }, 
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: StreamBuilder<QuerySnapshot>(
        builder: (context, snapshot) {
          userData.snapshots();
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
              : GestureDetector(
          onTap: () async{
            await FirebaseFirestore.instance
              .collection('users')
              .doc()
              .delete();
            },
          child: Container(
            width: double.infinity,
            height: 50,
            color: Colors.pink,
            child: const Padding(
              padding: EdgeInsets.only(top: 8,left: 15),
              child: Text(
                'Delete User...!',
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),
              ),
            ),
          ),
        );
        },
      ),  
    );
  }
}
