import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mypocketguide/screens/signin.dart';


class Initial extends StatefulWidget {
  const Initial({super.key});

  @override
  State<Initial> createState() => _InitialState();
}

class _InitialState extends State<Initial> {
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
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.network('https://assets9.lottiefiles.com/packages/lf20_ampohobu.json'),
                SizedBox(height: 42,),
                Text('MY POCKET GUIDE',style: GoogleFonts.poppins(fontSize: 30),),
                SizedBox(height: 45,),
                ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black),),onPressed:(){ Navigator.push(context, MaterialPageRoute(builder:(context)=>SignIn()));}, child: Text('SIGN IN /SIGN UP')),
                  
              ],
            )
          ],
        ),
            )
          )
      
    );
  }
}


