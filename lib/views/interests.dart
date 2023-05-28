
// ignore_for_file: prefer_const_constructors

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mypocketguide/providers/chats_provider.dart';
import 'package:mypocketguide/providers/models_provider.dart';
import 'package:mypocketguide/widgets/text_widget.dart';
import 'package:provider/provider.dart';
import 'package:selectable_container/selectable_container.dart';

class Interest extends StatefulWidget {
  const Interest({Key? key}) : super(key: key);

  @override
  _InterestState createState() => _InterestState();
}

List<String>interest=[];
int i=0;
bool _isTyping = false;

  //late ScrollController _listScrollController;
  late FocusNode focusNode;

class _InterestState extends State<Interest> {
  List<Interests> intrs = Interests.intrs;
  TextEditingController intrest=TextEditingController();

  @override
  void initState() {
   // _listScrollController = ScrollController();
    //textEditingController = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
   // _listScrollController.dispose();
   // textEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width=MediaQuery.of(context).size.width;
    final double height=MediaQuery.of(context).size.height;
   final modelsProvider = Provider.of<ModelsProvider>(context);
    final chatProvider = Provider.of<ChatProvider>(context);
    return Container(
       decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple, Colors.orange])),
      child:Scaffold(
        backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: (width*2.5)/3,
              height: (2.5*height)/3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color.fromARGB(47, 255, 255, 255),
              ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Choose your travel interests: ",style: TextStyle(fontFamily: "poppins",fontSize: 20),),
                const SizedBox(height: 16.0),
                for(final intr in intrs) 
                    InkWell(
                      onTap: () {
                        //Navigator.push(context,MaterialPageRoute(builder: (context)=>MovieScreen(movie:movie),),);
                      },
                      child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SelectableContainer(
                    selectedBackgroundColor: Colors.white,
                    unselectedBackgroundColor: const Color.fromARGB(98, 255, 255, 255),
                    selectedBackgroundColorIcon: Colors.green,
                    selectedBorderColor: Colors.green,
                    onValueChanged: (newValue) {
                      setState(() {
                        intr.selected = newValue;
                        
                        
                      });
                    },
                    marginColor: Colors.transparent,
                    selected: intr.selected,
                    padding: 8.0,
                    child: buildTextContentOfContainer(
                        intr.name,intr.imagepath),
                  ),
                ),
                    ),
                    
                    Container(
                      width: 200,
                      child: TextFormField(
                          controller: intrest,
                          decoration: InputDecoration(
                            hintText: "Other: "
                          ),
                        ),
                    ),
                    TextButton(
                      onPressed:() async {
                          await sendMessageFCT(
                              modelsProvider: modelsProvider,
                              chatProvider: chatProvider);
                              //Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()))
                        }, 
                      child: Text("Done!",style: TextStyle(fontFamily: "poppins",fontSize: 20),))
                //const Expanded(child: SelectableContainerGrid()),
              ],
            ),
          ),
        ),
      ),
      ),
    );
  }

  Future<void> sendMessageFCT(
      {required ModelsProvider modelsProvider,
      required ChatProvider chatProvider}) async {
    try {
      String msg = intrest.text;
      
      setState(() {
        _isTyping = true;
        // chatList.add(ChatModel(msg: textEditingController.text, chatIndex: 0));
        chatProvider.addUserMessage(msg: msg);
        //textEditingController.clear();
        focusNode.unfocus();
      });
      await chatProvider.sendMessageAndGetAnswers(
        
          msg: msg, chosenModelId: modelsProvider.getCurrentModel);
         
      // chatList.addAll(await ApiService.sendMessage(
      //   message: textEditingController.text,
      //   modelId: modelsProvider.getCurrentModel,
      // ));
      setState(() {});
    } catch (error) {
      log("error $error");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: TextWidget(
          label: error.toString(),
        ),
        backgroundColor: Colors.red,
      ));
    } finally {
      setState(() {
        //scrollListToEND();
        _isTyping = false;
      });
    }
  }

  Widget buildTextContentOfContainer(
      String title, String imagepath) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.network(imagepath),
        Text(
          title,
          style: TextStyle(fontFamily: "poppins",fontSize: 15),
        ),
      ],
    );
  }
}

class Interests{
  final String name;
  final String imagepath;
  bool selected;

   Interests({
    required this.name,
    required this.imagepath,
    required this.selected
  });

  static  List<Interests> intrs=[
      Interests(
      name: 'Professional', 
      imagepath: 'https://ideawake.com/wp-content/uploads/2016/07/Making-Innovation-Work.png', 
      selected: false
      ),
       Interests(
      name: 'Nature', 
      imagepath: 'https://pixnio.com/free-images/2017/12/19/2017-12-19-21-28-15.jpg',
      selected: false
      ),
      Interests(
      name: 'Historic', 
      imagepath: 'https://www.wallpaperup.com/uploads/wallpapers/2015/09/02/797001/deb4cd5ac793aa4ed08b05c960268dfe-700.jpg',
      selected: false
      ),
      Interests(
      name: 'Architectural', 
      imagepath: 'https://www.arch2o.com/wp-content/uploads/2018/12/Arch2O-the-beauty-of-our-contemporary-architecture-revealed-through-these-colorful-facades.jpg', 
      selected: false
      ),
      Interests(
      name: 'Children', 
      imagepath: 'https://s-i.huffpost.com/gen/1649604/images/o-KIDS-ARTS-facebook.jpg', 
      selected: false
      ),
       Interests(
      name: 'Cultural', 
      imagepath: 'https://www.keralam.me/wp-content/uploads/2019/03/cultural-heritage.jpg',
      selected: false
      ),
      Interests(
      name: 'Night-Life', 
      imagepath: 'https://miro.medium.com/max/4544/1*nKHbg76qz5CHwitvWV6_TQ.png',
      selected: false
      ),
      Interests(
      name: 'Artistic', 
      imagepath: 'https://th.bing.com/th/id/OIP.eNoMqQzGZnOmHpbcMcxQZwAAAA?pid=ImgDet&rs=1', 
      selected: false
      ),
      Interests(
      name: 'Adventrous', 
      imagepath: 'https://th.bing.com/th/id/OIP.FtBqDHDNwr9P6_bbLHXXcQHaE6?pid=ImgDet&rs=1', 
      selected: false
      ),
  ];

}