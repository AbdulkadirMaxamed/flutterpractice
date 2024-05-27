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
  bool isStopped = true;
  List<Padding> childrenList = [];

  //need to fix this issue
  //cant render page with a future so it breaks
  //but need the page to render with the new currency amount!
  @override
  void initState(){
    super.initState();
    getCurrencyAmount(currency);
  }

  getCurrencyAmount(String? currency)async{
    childrenList=[];
    print(currency);
    CoinData coinData = CoinData();
    dynamic currencyData = await coinData.getData(currency);
    for(dynamic coin in currencyData){
      // print(coin);
      // print(coin['rate']);
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
        if (scrollNotification is ScrollEndNotification) {

          //Will only update when user has stopped scrolling in picker.
          print('this item is centered $isStopped');
          isStopped=true;

          print(scrollNotification);

          return true;
        }else{
          print('running $isStopped');
          isStopped=false;
          return false;
        }
      },
      child: CupertinoPicker(
        itemExtent: 32.0,
        scrollController: FixedExtentScrollController(initialItem: 5),
        onSelectedItemChanged:(int index)async{
          //this runs before scrollnotification stops
          print(isStopped);
          if(isStopped==true){
            print('we are here $isStopped');
            childrenList=[];
            await getCurrencyAmount(currenciesList[index]);
          }
        },
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
            child: iosPicker()
          ),
        ],
      ),
    );
  }
}
