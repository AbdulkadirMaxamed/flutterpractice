import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String currency = 'GBP';
  double currencyTotal = 0;

  //need to fix this issue
  //cant render page with a future so it breaks
  //but need the page to render with the new currency amount!
  @override
  void initState()async{
    // TODO: implement initState
    super.initState();
    currencyTotal = await getCurrencyAmount(currency);
  }

  Future<double> getCurrencyAmount(String? currency)async{
    CoinData coinData = CoinData();
    dynamic currencyData = await coinData.getData(currency);
    // print(currencyData['asset_id_base']);
    double total = currencyData['rate'].toDouble();
    return total;
  }


  DropdownButton AndroidPicker(){
    List<DropdownMenuItem<String>> children = [];
    for(String currency in currenciesList){
      children.add(
          DropdownMenuItem(
              value: currency,
              child: Text(currency)
          )
      );
    }

    return DropdownButton<String>(
      value: currency,
      items: children,
      onChanged: (value) async{
        print(value);
        double rate = await getCurrencyAmount(value);
        print(rate);
        setState(() {
          currency=value.toString();
          currencyTotal = rate;
        });
      },
    );
  }

  CupertinoPicker IOSPicker(){

    List<Text> children = [];
    for(String currency in currenciesList){
      children.add(
          Text(currency)
      );
    }

    return CupertinoPicker(
      itemExtent: 32.0,
      children: children,
      onSelectedItemChanged: (value){
        setState(() async{
          // currencyTotal = await getCurrencyAmount(currency);
          currency=currenciesList[value];
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ${currencyTotal.roundToDouble()} $currency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),TextButton(
              onPressed: (){
                getCurrencyAmount(currency);
              },
              child: Text('Press')),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? IOSPicker() : AndroidPicker()
          ),
        ],
      ),
    );
  }
}

