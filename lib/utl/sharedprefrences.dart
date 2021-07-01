/*
import 'package:shared_preferences/shared_preferences.dart';


class SharedPrefsHelper {
  factory SharedPrefsHelper() {
    return internalObject;
  }

  static final SharedPrefsHelper internalObject = SharedPrefsHelper._internal();

  SharedPrefsHelper._internal();

 saveCourseCode(List<String> courseCode) async{
   final sharedPrefs = await SharedPreferences.getInstance();
   var key = 'courseCode';
   sharedPrefs.setStringList(key, courseCode);
 }
 Future <List<String>> readCourseCode()async{
   final sharedPrefs = await SharedPreferences.getInstance();
   var key = 'courseCode';
   final val = sharedPrefs.getStringList(key);
   return val;
 }

}

 */