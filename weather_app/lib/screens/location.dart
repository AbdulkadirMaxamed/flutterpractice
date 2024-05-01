import 'package:geolocator/geolocator.dart';

class Location{

  double ? latitude;
  double ? longitude;

  Future<void> getCurrentLocation() async{
    print('hello');
    try{
      LocationPermission permission;
      permission = await Geolocator.requestPermission();
      print(permission);
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
      latitude = position.latitude;
      longitude = position.longitude;
    }catch(e){
      print(e);
    }
  }



}