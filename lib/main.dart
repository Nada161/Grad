import 'package:flutter/material.dart';
import 'package:graduation/screens/login.dart';
import 'package:graduation/screens/listOfLessons.dart';
import 'package:graduation/screens/listOfObject.dart';
import 'package:graduation/screens/listOfCourses.dart';
import 'package:graduation/screens/video.dart';
import 'package:graduation/screens/keyword.dart';

void main() =>runApp(

  MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: MyCourses.id,
title: "Study Room App",
routes: {
  Login.id: (context) => Login(),
  MyCourses.id : (context) => MyCourses(),
  ListOfLessons.id: (context)=>ListOfLessons(),
  ListOfObject.id: (context)=>ListOfObject(),
  KeywordPage.id :(context)=>KeywordPage(),
  VideoPage.id :(context)=>VideoPage(),



})

);


