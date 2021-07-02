import 'package:flutter/material.dart';
import 'package:graduation/widget.dart';
import 'package:graduation/utl/natwork.dart';
import 'package:graduation/screens/listOfLessons.dart';
import 'package:graduation/utl/data_module.dart';

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
      body: singleChildScroll(context, 'List of Coursres',ListOfLessons.id,
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
                      child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          width: 100.0,
                          height: 100.0,
                          child: Text(data[index].image??'No image')
                        //Image.network(data[index].image??''),
                      ),


                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                      ),
                      Text(data[index].title??'No title')

                    ]
                      
                      )
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
