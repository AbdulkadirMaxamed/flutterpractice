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
  void initState(){
    // TODO: implement initState
    super.initState();
    updateUI();
  }

   void updateUI()async{
    try{
      double total = await getCurrencyAmount(currency);
      setState(() {
        currencyTotal = total;
      });
    }catch(e){
      print(e);
    }
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
        double rate = await getCurrencyAmount(value);
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
      onSelectedItemChanged: (value)async{
        double rate = await getCurrencyAmount(currenciesList[value]);
        setState(() {
          currency=currenciesList[value];
          currencyTotal = rate;
        });
      },
    );
  }

  //TODO: need to adjust the value for each currency

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for(String coin in cryptoList)
            Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
              child: Card(
                color: Colors.lightBlueAccent,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                  child: Text(
                    '1 $coin = ${currencyTotal.roundToDouble()} $currency',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
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
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: IOSPicker()
          ),
        ],
      ),
    );
  }
}
