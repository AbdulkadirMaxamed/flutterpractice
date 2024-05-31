import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
  'SOL',
  'IMX'
];

class CoinData {

  Future<dynamic> getData(String? currency)async{
    //setup path to get coin data from
    List<dynamic> cryptoData = [];
    for(String coins in cryptoList){
      var path = '/v1/exchangerate/$coins/$currency';

      //queryParam holds api key
      var queryParam = {
        'apikey':''
      };
      var url = Uri.https('rest.coinapi.io', path, queryParam);
      var response = await http.get(url);

      if(response.statusCode==200){
        dynamic data = jsonDecode(response.body);
        cryptoData.add(data);
      }
    }
    return cryptoData;
  }

}