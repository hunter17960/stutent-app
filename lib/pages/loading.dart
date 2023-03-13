import 'package:flutter/material.dart';
import 'package:project__q/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time='loading';

  void setupWorldTime()async{
    WorldTime instance =WorldTime(location: 'Cairo',flag: 'egypt.jpg',ur: 'Africa/Cairo');
    await instance.getTime();
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context,'/home',arguments: {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,

    });
   
  }
  
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return  Scaffold(
      body:
      // ignore: prefer_const_constructors
      Padding(
        // ignore: prefer_const_constructors
        padding:EdgeInsets.all(50.0),
        // ignore: prefer_const_constructors
        child: Text('loading'),
        ),
        
    );
  }
}