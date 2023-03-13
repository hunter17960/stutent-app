import 'package:flutter/material.dart';
import 'package:project__q/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List <WorldTime> locations =[
    WorldTime(ur: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(ur: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(ur: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(ur: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(ur: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(ur: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(ur: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(ur: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];
  void updatetime (index)async{
    WorldTime instance =locations[index];
    await instance.getTime();
    // ignore: use_build_context_synchronously
    Navigator.pop(context,{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime,
    });
  }
  
  @override
  Widget build(BuildContext context) {
    print('build ran');
    return  Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
       body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updatetime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
       ),
    
    );
  }
}