import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async{
    print("here");
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    print(permission);
    if(permission == LocationPermission.always){
      print("object");
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);
      print(position);
    }else{
      throw Exception("Error");
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