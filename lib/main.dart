import 'package:flutter/material.dart';
import 'package:project__q/pages/choose_location.dart';
import 'package:project__q/pages/home.dart';
import 'package:project__q/pages/loading.dart';
void main()=>runApp( MaterialApp(
  initialRoute: '/',
 
  routes: {
    '/':(context) => const Loading(),
    '/home':(context) => const Home(),
    '/location':(context) => const ChooseLocation()
  },
));