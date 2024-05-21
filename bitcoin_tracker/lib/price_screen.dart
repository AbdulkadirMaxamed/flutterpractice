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
      onChanged: (value){
        setState(() {
          currency=value.toString();
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
        setState(() {
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
                  '1 BTC = $currency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
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

