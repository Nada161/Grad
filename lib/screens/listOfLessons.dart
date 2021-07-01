import 'package:flutter/material.dart';
import 'package:graduation/screens/keyword.dart';
import 'package:graduation/screens/login.dart';
import 'package:graduation/utl/natwork.dart';
import 'package:graduation/widget.dart';
import 'package:graduation/screens/listOfObject.dart';
import 'package:graduation/utl/lesson_module.dart';

class ListOfLessons extends StatefulWidget {
  static String id = 'ListOfLessons';
   var courseCode;
  ListOfLessons ({ this.courseCode});
  @override
  _ListOfLessonsState createState() => _ListOfLessonsState();
}

class _ListOfLessonsState extends State<ListOfLessons> {
  late Future <List<Lesson>> futureCourseLesson;
  @override
  void initState() {
    super.initState();
    futureCourseLesson = fetchCourseLessons(widget.courseCode);
  }
  var data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: singleChildScroll(context, 'List of Lessons',Login.id,
          FutureBuilder<List<Lesson>>(
            future: futureCourseLesson,
            builder: (_, snapshot){
              if (snapshot.hasData){
                data=snapshot.data;
                return ListView.builder(
                    itemCount: data.length ,
                    itemBuilder: (context, index){
                      return GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context)=>ListOfObject(lessonCode:data[index].lessonCode ,courseCode:data[index].courseCode ,)));
                        },
                        // Card Which Holds Layout Of ListView Item
                        child: Card(
                            child:
                                  Text(data[index].title??'No title')
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
