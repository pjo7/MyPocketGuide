import 'package:flutter/material.dart';

void main() {
  runApp(Example());
}

class Example extends StatefulWidget {
  var size,height,width;
  @override
  State<StatefulWidget> createState() => _ExampleState();
  
}

class _ExampleState extends State<Example> {
//  List<String> _locations = ['Please choose a location', 'A', 'B', 'C', 'D']; // Option 1
//  String _selectedLocation = 'Please choose a location'; // Option 1
 
  List<String> _Modes = ['taxi','auto','metro','flight','train']; // Option 2
   String _selectedMode='auto'; // Option 2

  @override
  Widget build(BuildContext context) {
   
  final size = MediaQuery.of(context).size;
   final height = size.height;
   final width = size.width;
    return MaterialApp(
      home: Scaffold(
        
        body: Container(
          decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple, Colors.orange])),
              
          child: Column(
            children: [SingleChildScrollView(
              child: Container(
                height:height/2,
                width: width/2,
                decoration: BoxDecoration(
               
                image: const DecorationImage(
                  image: NetworkImage('assets/images/bang_palace.jpeg'),
                  fit: BoxFit.fill,
                ),
                border: Border.all(
                  width: 8,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            
              ),
            ),
              
              Container(
                child:  Text(
              'The Bangalore Palace was the private residence of the royal Wodeyar family. Built to resemble Windsor Castle, this quirky palace is filled with an interesting and eclectic collection of art and paraphernalia from a bygone era. The palace grounds are a popular venue for rock concerts and other music events.',
              maxLines: 8,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(height: 1.75, color: Colors.white),
            ),
              ),
              DropdownButton(
                hint: Text('Please choose a travel mode'), // Not necessary for Option 1
                value: _selectedMode,
                onChanged: (newValue) {
                  setState(() {
                    _selectedMode = newValue!;
                  });
                },
                items: _Modes.map((Mode) {
                  return DropdownMenuItem(
                    child: new Text(Mode),
                    value: Mode,
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}