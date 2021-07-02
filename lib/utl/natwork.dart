import 'package:graduation/utl/lesson_module.dart';
import 'package:graduation/utl/object_module.dart';
import 'package:graduation/utl/video_module.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:graduation/utl/data_module.dart';

String url1 = 'http://34.245.91.5:3000/api/getPlayedLo';
String url2 = 'http://54.74.199.150:3000/api/courses';
String url3= 'http://54.74.199.150:3000/api/adaptedCourse';

  Future<Video> fetchData(String videoLink) async {
    var response = await http.get(Uri.parse('$url1/$videoLink/en?fbclid=IwAR1efNhCet8dvPREdkYScAEp5R1YJ7dDa0DMiM1XlzXzfc3Wz26vNgKWEps#'));
    if (response.statusCode == 200) {
      var jsonData = Video.fromJson(json.decode(response.body) );
      return jsonData;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  // call courses

  Future <List<Course>> fetchCourses() async {
    final response = await http.get(Uri.parse(url2));
    if (response.statusCode == 200) {
      var responseData = json.encode(response.body);
      var returnData =coursesFromJson(response.body) ;
      return returnData;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }
  //call Lessons
Future<List<Lesson>> fetchCourseLessons(String courseCode) async{
    final response = await http.get(Uri.parse('$url2/$courseCode/0/lessons'));
    if (response.statusCode==200) {
      var returnLessonData =lessonsFromJson(response.body) ;
      return returnLessonData;
    }else {
      throw Exception('Unexpected error occured!');
    }
}
//call Object
Future <Object> fetchLessonObjects(String courseCode , String lessonCode)async{
    final response = await http.get(Uri.parse('$url3/$courseCode/$lessonCode/toc'));
    if (response.statusCode==200) {
      var returnObjectData =Object.fromJson(json.decode(response.body)) ;
      return returnObjectData;
    }else {
      throw Exception('Unexpected error occured!');
    }
}








