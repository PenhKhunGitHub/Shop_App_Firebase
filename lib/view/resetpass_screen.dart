import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key,});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Reset Password',
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Image
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: Image(
                    image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcuaYLcqWju1WRwvsllORQnyM4K90V4WX74lXan86WABZIyuOrlMTRDaE78yChZ3Wl-wY&usqp=CAU')
                  ),
                ),
              ),
              //Charector
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Enter your E-mail',
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'To Reset Password',
                          style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //File E_mail
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.mail),
                    hintText: 'E-mail',
                  ),
                ),
              ),
              //TextButton
              
              Padding(
                padding: const EdgeInsets.only(top: 5,left: 5,right: 5),
                child: GestureDetector(
                  onTap: () async{
                    
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.brown
                    ),
                    child: const Center(
                      child: Text(
                        'Reset',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}
