
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mypocketguide/screens/signup.dart';
import 'package:mypocketguide/views/details.dart';

 TextEditingController email=TextEditingController();
TextEditingController password=TextEditingController();

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final double width=MediaQuery.of(context).size.width;
    final double height=MediaQuery.of(context).size.height;
    Color color=Colors.transparent;

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple, Colors.orange])),
      child: Scaffold(
          // By defaut, Scaffold background is white
          // Set its value to transparent
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              width: (width*2.5)/3,
              height: (2.5*height)/3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color.fromARGB(47, 255, 255, 255),
              ),
              child: Column(
                children: [
                  Text('SIGN IN',style: TextStyle(fontFamily: "poppins",fontSize:35 ),),
                  SizedBox(
                    height: 45,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:21.0),
                        child: Text(
                          "Email ID: ",
                          style: TextStyle(
                                fontFamily: "poppins",
                                color: Color.fromARGB(255, 255, 255, 255),
                                ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: (width*2.2)/3,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(109, 0, 0, 0),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: TextFormField(
                      controller: email,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(111, 0, 0, 0),),
                          borderRadius: BorderRadius.all(Radius.circular(10),),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:21.0),
                        child: Text(
                          "Password: ",
                          style: TextStyle(
                                fontFamily: "poppins",
                                color: Color.fromARGB(255, 255, 255, 255),
                                ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: (width*2.2)/3,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(109, 0, 0, 0),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: TextFormField(
                      controller: password,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(111, 0, 0, 0),),
                          borderRadius: BorderRadius.all(Radius.circular(10),),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 42,),
                  ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black),),onPressed:(){ Navigator.push(context, MaterialPageRoute(builder:(context)=>Details()));}, child: Text('SUBMIT')),
                  SizedBox(height: 30,),
                  GestureDetector(onTap:() {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>SignUp()));
                  },
                  child: Text("Don't have an account?Sign Up")),
                  ]
                  )
            )
          )
      )
    );
  }

}