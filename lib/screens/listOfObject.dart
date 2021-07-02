import 'package:flutter/material.dart';
import 'package:graduation/screens/keyword.dart';
import 'package:graduation/screens/login.dart';
import 'package:graduation/screens/video.dart';
import 'package:graduation/utl/natwork.dart';
import 'package:graduation/utl/object_module.dart';
import 'package:graduation/widget.dart';

class ListOfObject extends StatefulWidget {
  static String id = 'ListOfObject';
  var lessonCode;
  var courseCode;
  ListOfObject({this.lessonCode ,this.courseCode});
  @override
  _ListOfObjectState createState() => _ListOfObjectState();
}

class _ListOfObjectState extends State<ListOfObject> {
  late Future <Object> futureLessonObject;
  @override
  void initState() {
    super.initState();
    futureLessonObject = fetchLessonObjects(widget.courseCode,widget.lessonCode);
  }
   late Object? data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: singleChildScroll(context, 'List of Object',Login.id,
          FutureBuilder<Object>(
            future: futureLessonObject,
            builder: (_, snapshot){
              if (snapshot.hasData){
                data=snapshot.data;
                return ListView(
                  children: data!.topics!.map((e) => Column(
                    children: e.subTopics!.map((e) => Column(
                      children:e.subSubTopics!.map((e) => Visibility(
                        visible: e.lOid!.isNotEmpty,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context)=>VideoPage(loId: e.lOid,)));
                          },
                          child: Card(
                              child: Text(e.title??'no title')),
                        ),
                      )).toList() ,)).toList(),)).toList(),
                );
                       
              }else if(snapshot.hasError){
                return Text("${snapshot.error}");
              }
              return Center(child: CircularProgressIndicator());
            },
          )
      ),
    );
  }
}


