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
];

class CoinData {

  Future getData(String currency)async{
    //setup path to get coin data from
    var path = '/v1/exchangerate/BTC/$currency';

    //queryParam holds api key
    var queryParam = {
      'apikey':''
    };
    var url = Uri.https('rest.coinapi.io', path, queryParam);
    var response = await http.get(url);

    print(response.statusCode);
    if(response.statusCode==200){
      dynamic data = jsonDecode(response.body);
      print(url);
      print(data['rate']);
      print(data['asset_id_quote']);
      return data;
    }
  }

}