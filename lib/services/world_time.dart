import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime {
  String location;
  String? time;
  String flag;
  String ur;

  WorldTime({required this.location,required this.flag,required this.ur});

  Future <void> getTime()async{
    
    try {
      var url= Uri.parse('http://worldtimeapi.org/api/timezone/$ur');
    var response= await http.get(url);
    Map data = jsonDecode(response.body) ;
    // ignore: avoid_print
    // print(data);
    String datetime = data['datetime'];
    String offSetHours = data['utc_offset'].substring(1, 3);
      String offSetMinutes = data['utc_offset'].substring(4, 6);
    print(datetime);
    // print(offset);
    DateTime now =DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offSetHours)));
    now = now.add(Duration(minutes: int.parse(offSetMinutes)));
    time =DateFormat.jm().format(now);
      
    } catch (e) {
      print("Caught Error: $e");
      time = "Could not get time data";
      
    }
  }
}

