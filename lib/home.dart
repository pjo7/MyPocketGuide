import 'package:flutter/material.dart';
import 'package:mypocketguide/list.dart';

import 'package:mypocketguide/place_list.dart';
import 'package:mypocketguide/plan.dart';


class HomeScreen extends StatelessWidget{
  const HomeScreen({Key?key}) : super(key: key);



@override
Widget build (BuildContext context){
  List<Place> places=Place.places;
  return Scaffold(
    appBar: AppBar(
      toolbarHeight: 100,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      flexibleSpace: ClipPath(
        clipper: _CustomerClipper(),
        child: Container(
         
          height: 150,
          width: MediaQuery.of(context).size.width,
          color: const Color(0xFF000B49),
          child:Center(child: Text('Explore',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color:Colors.white,fontWeight:FontWeight.bold ))) ,
        ),
        
      ),
    ),
    extendBodyBehindAppBar: true,
    body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple, Colors.orange])),
      child: SingleChildScrollView(
        
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 150.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            RichText(text: TextSpan(style:Theme.of(context).textTheme.headline6,children: [
              TextSpan(text: 'Featured',
              style:Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.bold)
              ),
              TextSpan(text: 'Places'),
              
            ] ),
            ),
            const SizedBox(height:20),
             for(final place in places)
              InkWell(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(
                    builder: (context)=>Example(),
                    ),
                    );
                },
                child: PlaceListItem(
                imageUrl: place.imagePath,
                name: place.name,
                information: '${place.category}|${place.budget}',
                         ),
              ),
          ],
          ),
        ),
      ),
    ),
  );
}
}
class _CustomerClipper extends CustomClipper<Path>
{
  @override
  Path getClip(Size size) {
    double height=size.height;
    double width=size.width;
   
   var path= Path();
   path.lineTo(0,height-50);
   path.quadraticBezierTo(width/2, height, width, height-50);
   path.lineTo(width, 0);
   path.close();
   return path;

  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
   return true;
  }
}
