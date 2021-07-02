import 'package:flutter/material.dart';
import 'package:graduation/screens/keyword.dart';
import 'package:graduation/utl/natwork.dart';
import 'package:graduation/utl/videoHelper.dart';
import 'package:graduation/widget.dart';
import 'package:graduation/utl/video_module.dart'as v;

class VideoPage extends StatefulWidget {
  static String id = 'VideoPage';
  final loId;
  VideoPage({this.loId});
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
  late Future<v.Video> futureData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureData=fetchData(widget.loId);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:
        Padding(
         padding: const EdgeInsets.all(4.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
            Expanded(
              child: FutureBuilder<v.Video>(
                     future: futureData,
                     builder: (context, snapshot) {
                       if (snapshot.hasData) {
                         data = snapshot.data;
                         return Container(
                           child:Video(videoUrl: data.loSignedUrl)
                         );
                       } else if(snapshot.hasError){
                         return Text("${snapshot.error}");
                       }
                       return Center(child: CircularProgressIndicator());
                     }),
            ),
             Expanded(
               child: FutureBuilder(
                 future: futureData,
                 builder: (context, snapshot) {
                   if (snapshot.hasData) {
                     data = snapshot.data;
                     return ListTile(
                         title: text(data.title, Colors.black, 20.0),);
                   } else if(snapshot.hasError){
                     return Text("${snapshot.error}");
                   }
                   return Center(child: CircularProgressIndicator());
                 },
               ),
             ),
             Expanded(child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 Icon(Icons.thumb_up),
                 Icon(Icons.thumb_down),
               ],
             )),
             Expanded(
               child: FutureBuilder(
                 future: futureData,
                 builder: (context, snapshot) {
                   if (snapshot.hasData) {
                     return Scrollbar(
                       child: Container(

                         child: ListView(
                           children: <Widget>[
                             Text(data.transcript),
                           ],
                         ),
                       ),
                     );
                   } else if(snapshot.hasError){
                     return Text("${snapshot.error}");
                   }
                   return Center(child: CircularProgressIndicator());
                 },
               ),
             ),
             Container(
               color: Colors.blue[600],
               child: Row(
                   crossAxisAlignment: CrossAxisAlignment.end,
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children:[
               DropdownButton(
                   dropdownColor: Colors.blue[600],
                   value: dropDownVal1,
                   style: TextStyle(color: Colors.white,fontSize: 18.0),
                   icon: Icon(Icons.arrow_drop_down ,color: Colors.white,),
                   iconSize: 38,
                   items:
                   l1.map<DropdownMenuItem<dynamic>>((dynamic value) {
                     return DropdownMenuItem<dynamic>(
                       value: value,
                       child: Text(value),
                     );
                   }).toList(),
                   onChanged: onChange1),
             DropdownButton(
                 dropdownColor: Colors.blue[600],
                 value: dropDownVal2,
                 style: TextStyle(color: Colors.white,fontSize: 18.0),
                 icon: Icon(Icons.arrow_drop_down, color: Colors.white,),
                 iconSize: 38,
                 items:
                 l2.map<DropdownMenuItem<dynamic>>((dynamic value) {
                   return DropdownMenuItem<dynamic>(
                     value: value,
                     child: Text(value),
                   );
                 }).toList(),
                 onChanged: onChange2),

             // ignore: deprecated_member_use
             RaisedButton(
               color: Colors.blue[600],
               elevation: 0.0,
               child: Text(
                 'Keywords',
                 style: TextStyle(color: Colors.white,fontSize: 18.0),
               ),
               // Within the `FirstRoute` widget
               onPressed: () {
                 Navigator.push(
                   context,
                   MaterialPageRoute(
                       builder: (context) => KeywordPage()),
                 );
               },
             ),
           ],
         )),
           ],
         ),

       ),
    );
  }
}


