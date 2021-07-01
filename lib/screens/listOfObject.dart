import 'package:flutter/material.dart';
import 'package:graduation/screens/keyword.dart';
import 'package:graduation/screens/login.dart';
import 'package:graduation/screens/video.dart';
import 'package:graduation/utl/natwork.dart';
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
  var data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: singleChildScroll(context, 'List of Object',Login.id,
          FutureBuilder<Object>(
            future: futureLessonObject,
            builder: (_, snapshot){
              if (snapshot.hasData){
                data=snapshot.data;
                return ListView.builder(
                    itemCount: data.length ,
                    itemBuilder: (context, index){
                      return GestureDetector(
                        onTap: (){
                        },
                        // Card Which Holds Layout Of ListView Item
                        child: Card(
                            child:
                            Text(data.topics[index].subTopics[index].subSubTopics[index].title??'No title')
                        ),
                      );
                    });
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


