/*
import 'package:flutter/material.dart';
import 'package:graduation/utl/videoHelper.dart';
import 'package:graduation/utl/natwork.dart';
import 'package:graduation/widget.dart';
import 'package:chewie/chewie.dart';

class VideoPage extends StatefulWidget {
  static String id = 'VideoPage';
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  dynamic dropDownVal1 = 'Transcript';
  List<dynamic> l1 = ['Transcript', 'summry25', 'summry50' , 'summry75'];
  onChange1(dynamic newVal) {
    setState(() {
      dropDownVal1 = newVal;
    });
  }

  dynamic dropDownVal2 = 'English';
  List<dynamic> l2 = ['English', 'Arabic'];
  onChange2(dynamic newVal) {
    setState(() {

      dropDownVal1 = newVal;

      dropDownVal2 = newVal;

    });
  }

  var data;
  Network _nHelper =  Network();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nHelper.fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Stack(
       children: [
        Padding(
         padding: const EdgeInsets.all(4.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
            FutureBuilder(
                   future: _nHelper.fetchData(),
                   builder: (context, snapshot) {
                     if (snapshot.hasData) {
                       data = snapshot.data;
                       return Container(
                         child: Chewie(

                         ),
                       );
                     } else if(snapshot.hasError){
                       return Text("${snapshot.error}");
                     }
                     return Center(child: CircularProgressIndicator());
                   }),
             FutureBuilder(
               future: _nHelper.fetchData(),
               builder: (context, snapshot) {
                 if (snapshot.hasData) {
                   data = snapshot.data;
                   return ListTile(
                       title: text(data['title'], Colors.black, 20.0),
                       subtitle: Text('number of views'));
                 } else if(snapshot.hasError){
                   return Text("${snapshot.error}");
                 }
                 return Center(child: CircularProgressIndicator());
               },
             ),
           ],
         ),

       ),
     ]),
    );
  }
}

 */
