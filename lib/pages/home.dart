import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data ={};
  @override
  Widget build(BuildContext context) {

    data =data.isNotEmpty ? data: ModalRoute.of(context)?.settings.arguments as Map;

    print(data);

    String bgImage = data['isDaytime']?'day.jpg':'night.jpg';
    Color? bgcolor=data['isDaytime']?Colors.blue:Colors.indigo[700];

    return  Scaffold(
      backgroundColor: bgcolor,
      body:  SafeArea(
        
        child: Container(
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
            // ignore: prefer_const_constructors
            image: DecorationImage(
              // ignore: prefer_const_constructors
              image:AssetImage('assets/$bgImage'),
              fit:BoxFit.cover 
              )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location',);
                    setState(() {
                      data={
                        'time':result['time'],
                        'location':result['location'],
                        'isDaytime':result['isDaytime'],
                        'flag':result['flag'],
                      };
                    });
                  },
                   icon:  Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                   ),
                   label:  Text(
                    'edit location',
                    style: TextStyle(
                      color: Colors.grey[300]
                    ),
                   ),
                   ),
                   const SizedBox(height: 20.0,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['location'],
                        style: const TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 1.0,
                          color: Colors.white,
                        ),
                      ),
                      
                      
                    ],
                   ),
                   const SizedBox(height: 20.0,),
                   Text(
                        data['time'],
                        style: const TextStyle(
                          fontSize: 66.0,
                          letterSpacing: 1.0,
                          color: Colors.white,
                        ),
                      ),
        
              ],
            ),
          ),
        ),
      ),
    );
  }
}