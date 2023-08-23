

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/view/cloud_firestor.dart';
import 'package:shop_app/view/resetpass_screen.dart';
import 'package:shop_app/view/signup_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign In',
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
                          'Login',
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'With Firebase',
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
              //File Password
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: passController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    hintText: 'Password',
                    
                  ),
                ),
              ),
              //TextButton
              Padding(
                padding: const EdgeInsets.only(top: 5,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ResetPassword())
                        );
                      }, 
                      child: const Text(
                        'forgot password?',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown
                        ),
                      )
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5,left: 5,right: 5),
                child: GestureDetector(
                  onTap: () async{
                      try{      
                        final credential =  await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                            email: emailController.text, 
                            password: passController.text
                          );
                        if(credential != null ){
                          print('Login Success');
                          Get.to(()=> const CloudFireStore());
                        }
                      }
                      on FirebaseAuthException catch(e){
                        if (e.code == 'user-not-found') {
                            print('No user found for that email.');
                        } 
                        else if (e.code == 'wrong-password') {
                            print('Wrong password provided for that user.');
                        }
                      }
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
                        'Login',
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
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have account ?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => const SignUpScreen(),)
                        );
                      }, 
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown
                        ),
                      )
                    )
                  ],
                ),
              )
            ],
          ),
      ),
    );
  }
}