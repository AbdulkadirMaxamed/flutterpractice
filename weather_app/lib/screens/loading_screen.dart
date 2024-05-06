import 'package:flutter/material.dart';
import 'location.dart';
import 'package:http/http.dart' as http;


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
    print(url);
    // 267d8343e0dcfa47c2cacc02181b44f6
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    print(await http.read(Uri.https('example.com', 'foobar.txt')));
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