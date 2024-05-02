import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'location.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void getLocation() async{
    try{
      Location location =  Location();
      await location.getCurrentLocation();
      print(location.latitude);
      print(location.longitude);
      print(location.locationPermission);
    }catch(e){
      print(e);
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            print("hello");
            getLocation();
          },
          child: const Text('Get Location'),
        ),
      ),
    );
  }
}