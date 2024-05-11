import 'package:flutter/material.dart';
import 'location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void getLocation() async{
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void getData(String location) async{
    var path = '/data/2.5/weather';
    var queryParam = {
      'q':'London',
      'units':'metric',
      'appid':'267d8343e0dcfa47c2cacc02181b44f6'
    };
    var url = Uri.https('api.openweathermap.org', path, queryParam);
    // var url =
    // Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});
    print(url);
    // 267d8343e0dcfa47c2cacc02181b44f6
    var response = await http.get(url);
    String data = response.body;

    print(jsonDecode(data));
    String weather = jsonDecode(data)['weather'][0]['main'];
    print(weather);


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // getLocation();
            getData('London');
          },
          child: const Text('Get Location'),
        ),
      ),
    );
  }
}