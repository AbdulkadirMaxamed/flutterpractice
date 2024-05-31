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
  int _pickerIndex = 0;
  bool running = false;
  List<Padding> childrenList = [];

  //need to fix this issue
  //cant render page with a future so it breaks
  //but need the page to render with the new currency amount!
  @override
  void initState(){
    super.initState();
    getCurrencyAmount(currency);
  }

  void iosCurrencyUpdate(int num){
    getCurrencyAmount(currenciesList[num]);
  }

  getCurrencyAmount(String? currency)async{
    childrenList=[];
    CoinData coinData = CoinData();
    dynamic currencyData = await coinData.getData(currency);
    for(dynamic coin in currencyData){
      //gets each coin and adds them into their individual widget
      addWidget(coin['asset_id_base'], coin['rate'], coin['asset_id_quote']);
    }
    // print(childrenList);
  }

  List<Padding> addWidget(String coin, double currencyNum, String currentCurrency){
    // currencyTotal = returnCurrencyData(coin);
    // print(currencyTotal);
    setState(() {
      childrenList.add(
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
                '1 $coin = ${currencyNum.roundToDouble()} $currentCurrency',
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
    });
    return childrenList;
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
        childrenList = [];
        await getCurrencyAmount(value);
        setState(() {
          currency=value.toString();
        });
      },
    );
  }

  NotificationListener iosPicker(){

    List<Text> children = [];
    for(String currency in currenciesList){
      children.add(
          Text(currency)
      );
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification){
        if (scrollNotification is ScrollEndNotification &&
            scrollNotification.metrics is FixedExtentMetrics) {
          // Accessing the itemIndex of the centered item
          int index = (scrollNotification.metrics as FixedExtentMetrics).itemIndex;
          // Printing the scroll metrics to the console
          iosCurrencyUpdate(index);

          return true;
        } else {
          return false;
        }
      },
      child: CupertinoPicker(
        itemExtent: 32.0,
        scrollController: FixedExtentScrollController(initialItem: 5),
        onSelectedItemChanged:null,
        children: children,
      ),
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
                children: childrenList,
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
