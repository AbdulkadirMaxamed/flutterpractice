<<<<<<< HEAD
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



=======
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


>>>>>>> 04c7d9fbc46202afecab4d964e97bd9f70ef8a6a
}