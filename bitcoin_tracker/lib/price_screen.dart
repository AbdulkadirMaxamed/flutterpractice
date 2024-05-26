import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String currency = 'GBP';
  String initialCoin = 'ETH';
  double currencyTotal = 0;

  //need to fix this issue
  //cant render page with a future so it breaks
  //but need the page to render with the new currency amount!
  @override
  void initState(){
    super.initState();
    updateUI();
  }

   void updateUI()async{
    //TODO: might need to work on efficiency of this initial load theres a second where it does not show currency value
    // try{
    //   double total = await getCurrencyAmount(currency);
    //   setState(() {
    //     currencyTotal = total;
    //   });
    // }catch(e){
    //   print(e);
    // }
  }

  Future<double> getCurrencyAmount(String? coin, String? currency)async{
    CoinData coinData = CoinData();
    dynamic currencyData = await coinData.getData(coin, currency);
    // print(currencyData['asset_id_base']);
    double total = currencyData['rate'].toDouble();
    return total;
  }

  // Future<void> updateCurrencies(String coin)async{
  //   double amount = await getCurrencyAmount(coin, currency);
  //   setState(() {
  //     initialCoin = coin;
  //     currencyTotal = amount;
  //   });
  // }

  List<Padding> addWidget(){
    // returnList();
    List<Padding> children = [];
    for(String coins in cryptoList){
      children.add(
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
                '1 $coins = ${currencyTotal.roundToDouble()} $currency',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );
    }
    return children;
  }

  DropdownButton androidPicker(){
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
        double rate = await getCurrencyAmount(initialCoin, value);
        setState(() {
          currency=value.toString();
          currencyTotal = rate;
        });
      },
    );
  }

  CupertinoPicker iosPicker(){

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
        // double rate = await getCurrencyAmount(currenciesList[value]);
        // setState(() {
        //   currency=currenciesList[value];
        //   currencyTotal = rate;
        // });
      },
    );
  }

  //TODO: need to adjust the value for each currency

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: addWidget(),
              )
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iosPicker() : androidPicker()
          ),
        ],
      ),
    );
  }
}
