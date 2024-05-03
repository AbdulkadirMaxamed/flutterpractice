import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'location.dart';
<<<<<<< HEAD

=======
>>>>>>> 04c7d9fbc46202afecab4d964e97bd9f70ef8a6a

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
<<<<<<< HEAD
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
=======

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


>>>>>>> 04c7d9fbc46202afecab4d964e97bd9f70ef8a6a
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {

          },
          child: const Text('Get Location'),
        ),
      ),
    );
  }
}