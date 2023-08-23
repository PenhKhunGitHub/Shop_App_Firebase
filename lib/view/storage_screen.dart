
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
class StorageScreen extends StatefulWidget {
  const StorageScreen({super.key});

  @override
  State<StorageScreen> createState() => _StorageScreenState();
}

class _StorageScreenState extends State<StorageScreen> {
  final storageRef = FirebaseStorage.instance.ref();
  String? image;
  Future<void> getImageUrl()async{
    final imageUrl = await storageRef
              .child(
                  "images/4.carabao.jfif")
              .getDownloadURL();
          setState(() {
            image = imageUrl;
          });
  }
  Future<void> deleteimage(String ref)async{
    await FirebaseStorage.instance.ref(ref).delete();
    setState(() {
      
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImageUrl();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Storage'),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => Card(
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 200,
                  child: Image(image: NetworkImage(image.toString())),
                ),
              ),
              IconButton(onPressed: ()async {
                await deleteimage("images/5.pepsi.jfif");
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Delete Success')));
              }, icon: Icon(Icons.delete,size: 25,color: Colors.red,))
            ],
          )
          ),
        )
    );
  }
}