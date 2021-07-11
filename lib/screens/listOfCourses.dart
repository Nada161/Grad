import 'package:flutter/material.dart';
import 'package:graduation/widget.dart';
import 'package:graduation/utl/natwork.dart';
import 'package:graduation/screens/listOfLessons.dart';
import 'package:graduation/utl/course_module.dart';

class MyCourses extends StatefulWidget {
  static String id = 'MyCourses';
  @override
  _MyCoursesState createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {

  late Future <List<Course>> futureCourses;
  @override
  void initState() {
    super.initState();
    futureCourses = fetchCourses();

  }
  var data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: singleChildScroll(context, 'List of Courses',ListOfLessons.id,
          FutureBuilder<List<Course>>(
            future: futureCourses,
            builder: (_, snapshot){
              if (snapshot.hasData){
                data=snapshot.data;
                return ListView.builder(
                    itemCount: data.length ,
                    itemBuilder: (context, index){
                      return GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context)=>ListOfLessons(courseCode:data[index].courseCode ,)));
                        },
                        // Card Which Holds Layout Of ListView Item
                        child: Card(
                          margin: EdgeInsets.all(10.0),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5.0),
                                    topRight: Radius.circular(5.0),
                                    bottomLeft:Radius.circular(5.0),
                                    bottomRight: Radius.circular(5.0),
                                  ),
                                    border: Border.all(width: 1 ,color: Colors.blueAccent),
                                  image: DecorationImage(
                                    image: NetworkImage(data[index].image??'No image'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                //Text(data[index].image??'No image')
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(data[index].title??'No Title',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                // Text(data[index].title??'No title'))
                              ),
                            ],
                          ),
                        ),
                      );
                    }
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


