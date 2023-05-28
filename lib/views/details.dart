// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:mypocketguide/views/interests.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

final TextEditingController startLoc=TextEditingController();
final TextEditingController number=TextEditingController();
TextEditingController timeCtl = TextEditingController();
final durs=["Day","Week","Month"];
String dur='Day';
String? ans;
String? ans2;
DateTime start=DateTime.now();
DateTime end=DateTime.now();
 String? _selectedGender;

class _DetailsState extends State<Details> {
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
                  Text(
                    "Journey Details ",
                    style: TextStyle(
                      fontFamily: "poppins",
                      fontSize: 30,
                    )
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:21.0),
                        child: Text(
                          "Start Location: ",
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
                      controller: startLoc,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(111, 0, 0, 0),),
                          borderRadius: BorderRadius.all(Radius.circular(10),),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:21.0),
                        child: Text(
                          "Duration: ",
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
                  Row(
                    children: [
                      Padding(
                       padding: const EdgeInsets.only(left:21.0),
                        child: Container(
                          width: 60,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(109, 0, 0, 0),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: TextFormField(
                            controller: number,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromARGB(111, 0, 0, 0),),
                                borderRadius: BorderRadius.all(Radius.circular(10),),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Container(
                        width: (width*1.5)/3,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(109, 0, 0, 0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: DropdownButton(
                            underline: Text(''),
                            items: durs
                                  .map((String item) =>
                                      DropdownMenuItem<String>(child: Text(item), value: item))
                                  .toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  dur = value!;
                                      });
                                    },
                              value: dur,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                        height: 40,
                      ),
                  Visibility(
                    visible: dur == 'Day', // Show container only when 'Value 1' is selected
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:21.0),
                              child: Text("Start Time:",style: TextStyle(
                                  fontFamily: "poppins",
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  ),),
                            ),
                            SizedBox(
                              width: 90,
                            ),
                             Text("End Time:",style: TextStyle(
                                  fontFamily: "poppins",
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  ),),
                          ],
                        ),
                        Row(
                        children: [
                          Padding(
                           padding: const EdgeInsets.only(left:21.0),
                            child:  Container(
                              width: 120,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(109, 0, 0, 0),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child:DateTimeFormField(
                                initialTimePickerEntryMode: TimePickerEntryMode.inputOnly,
                                      decoration: InputDecoration(
                                        hintStyle: TextStyle(color: Colors.black45),
                                        errorStyle: TextStyle(color: Colors.redAccent),
                                        border: OutlineInputBorder(),
                                      ),
                                      mode: DateTimeFieldPickerMode.time,
                                      autovalidateMode: AutovalidateMode.always,
                                      validator: (DateTime? e) {
                                        return (e?.day ?? 0) == 1
                                            ? 'Please not the first day'
                                            : null;
                                      },
                                      onDateSelected: (DateTime value) {
                                        start=value;
                                      },
                                    )
                            ),
                          ),
                          SizedBox(
                            width: 35,
                          ),
                          Container(
                              width: 120,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(109, 0, 0, 0),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child:DateTimeFormField(
                                initialTimePickerEntryMode: TimePickerEntryMode.inputOnly,
                                      decoration: InputDecoration(
                                        hintStyle: TextStyle(color: Colors.black45),
                                        errorStyle: TextStyle(color: Colors.redAccent),
                                        border: OutlineInputBorder(),
                                      ),
                                      mode: DateTimeFieldPickerMode.time,
                                      autovalidateMode: AutovalidateMode.always,
                                      validator: (DateTime? e) {
                                        return (e?.day ?? 0) == 1
                                            ? 'Please not the first day'
                                            : null;
                                      },
                                      onDateSelected: (DateTime value) {
                                        end=value;
                                      },
                                    )
                            ),
                          
                        ],
                  ),
                  
                      ],
                    ),
                  ),
                  Visibility(
                    visible: dur=='Week' || dur == 'Month',
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:21.0),
                              child: Text("Start Date:",style: TextStyle(
                                  fontFamily: "poppins",
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  ),),
                            ),
                            SizedBox(
                              width: 90,
                            ),
                             Text("End Date:",style: TextStyle(
                                  fontFamily: "poppins",
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  ),),
                          ],
                        ),
                        Row(
                        children: [
                          Padding(
                           padding: const EdgeInsets.only(left:21.0),
                            child:  Container(
                              width: 120,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(109, 0, 0, 0),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child:DateTimeFormField(
                                initialTimePickerEntryMode: TimePickerEntryMode.inputOnly,
                                      decoration: InputDecoration(
                                        hintStyle: TextStyle(color: Colors.black45),
                                        errorStyle: TextStyle(color: Colors.redAccent),
                                        border: OutlineInputBorder(),
                                      ),
                                      mode: DateTimeFieldPickerMode.date,
                                      autovalidateMode: AutovalidateMode.always,
                                      validator: (DateTime? e) {
                                        return (e?.day ?? 0) == 1
                                            ? 'Please not the first day'
                                            : null;
                                      },
                                      onDateSelected: (DateTime value) {
                                       start=value;
                                      },
                                    )
                            ),
                          ),
                          SizedBox(
                            width: 35,
                          ),
                          Container(
                              width: 120,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(109, 0, 0, 0),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child:DateTimeFormField(
                                initialTimePickerEntryMode: TimePickerEntryMode.inputOnly,
                                      decoration: InputDecoration(
                                        hintStyle: TextStyle(color: Colors.black45),
                                        errorStyle: TextStyle(color: Colors.redAccent),
                                        border: OutlineInputBorder(),
                                      ),
                                      mode: DateTimeFieldPickerMode.date,
                                      autovalidateMode: AutovalidateMode.always,
                                      validator: (DateTime? e) {
                                        return (e?.day ?? 0) == 1
                                            ? 'Please not the first day'
                                            : null;
                                      },
                                      onDateSelected: (DateTime value) {
                                        end=value;
                                      },
                                    )
                            ),
                          
                        ],
                  ),
                      ],
                    ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:21.0),
                        child: Text(
                          "Do You Require Stay? ",
                          style: TextStyle(
                                fontFamily: "poppins",
                                color: Color.fromARGB(255, 255, 255, 255),
                                ),
                        ),
                      ),
                      SizedBox(
                              width: 20,
                            ),
                             Text("Food Preference:",style: TextStyle(
                                  fontFamily: "poppins",
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  ),),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:21.0),
                        child: Container(
                          width: 120,
                          decoration: BoxDecoration(
                                color: Color.fromARGB(109, 0, 0, 0),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                            child: DropdownButton(
                                  underline: Text(''),
                                  items: ['Yes','No']
                                        .map((String item) =>
                                            DropdownMenuItem<String>(child: Text(item), value: item))
                                        .toList(),
                                    onChanged: (String? value) {
                                      setState(() {
                                        ans = value!;
                                            });
                                          },
                                    value: ans,
                                ),
                        ),
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      Container(
                          width: 120,
                          decoration: BoxDecoration(
                                color: Color.fromARGB(109, 0, 0, 0),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                            child: DropdownButton(
                                  underline: Text(''),
                                  items: ['Veg','Non-Veg']
                                        .map((String item) =>
                                            DropdownMenuItem<String>(child: Text(item), value: item))
                                        .toList(),
                                    onChanged: (String? value) {
                                      setState(() {
                                        ans = value!;
                                            });
                                          },
                                    value: ans,
                                ),
                        )
                    ],
                  ),
                    SizedBox(
                      height: 40,
                    ),
                    TextButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(100, 60)),
                      backgroundColor:MaterialStateProperty.all(Colors.black)
                    ),
                    onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>Interest()));
                    }, 
                    child: Text('Next ->',
                      style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ))
                ],
              ),
            ),
          )),
    );
  }
    Widget buildTextContentOfContainer(
      String title, String subtitle, TextTheme textStyles) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: textStyles.headline5,
        ),
        Text(
          subtitle,
          style: textStyles.bodyText1,
        ),
      ],
    );
  }
}
