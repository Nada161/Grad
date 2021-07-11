import 'package:flutter/material.dart';
import 'package:graduation/screens/login.dart';
import 'package:graduation/utl/natwork.dart';
import 'package:graduation/widget.dart';
import 'package:graduation/screens/listOfObject.dart';
import 'package:graduation/utl/lesson_module.dart';

// ignore: must_be_immutable
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
      body: singleChildScroll(
          context,
          'List of Lessons',
          Login.id,
          FutureBuilder<List<Lesson>>(
            future: futureCourseLesson,
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                data = snapshot.data;
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ListOfObject(
                                lessonCode: data[index].lessonCode,
                                courseCode: data[index].courseCode,
                              )));
                        },

                        // Card Which Holds Layout Of ListView Item
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            elevation: 3.0,
                            margin: EdgeInsets.all(15.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Expanded(
                                child: Text(
                                  data[index].title ?? 'No title',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Center(child: CircularProgressIndicator());
            },
          )),
    );
  }
}
