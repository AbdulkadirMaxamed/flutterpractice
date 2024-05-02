import 'package:geolocator/geolocator.dart';

class Location{

  double? latitude;
  double? longitude;
  String? locationPermission;

  Future<void> getCurrentLocation() async{
    try{
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
      LocationPermission permission = await Geolocator.requestPermission();
      locationPermission = permission.name;
    }catch(e){
      print(e);
    }
  }


}