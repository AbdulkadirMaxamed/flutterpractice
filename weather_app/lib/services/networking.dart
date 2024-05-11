import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper{
  NetworkHelper(this.city);

  final String city;

  Future getData() async{
    var path = '/data/2.5/weather';
    var queryParam = {
      'q':city,
      'units':'metric',
      'appid':'267d8343e0dcfa47c2cacc02181b44f6'
    };
    var url = Uri.https('api.openweathermap.org', path, queryParam);

    var response = await http.get(url);

    if(response.statusCode==200){
      String data = response.body;
      return jsonDecode(data);
    }else{
      print("failed");
    }



  }

}