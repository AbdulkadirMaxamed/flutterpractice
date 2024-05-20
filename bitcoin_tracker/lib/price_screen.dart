import 'package:flutter/material.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String? currency = 'GBP';



  // dynamic getListofCurrencies(){
  //   final List<Widget> children = [];
  //   for (String currencies in currenciesList){
  //     children.add(
  //         DropdownMenuItem(
  //             value: currencies,
  //             child: Text(currencies)
  //         )
  //     );
  //   }
  //   return children;
  // }



  List<DropdownMenuItem<String>> getListofCurrencies(){
    List<DropdownMenuItem<String>> children = [];
    for(String currency in currenciesList){
      var newItem =
        DropdownMenuItem(
          value: currency,
          child: Text(currency)
      );

      children.add(newItem);
    }
    return children;
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
            child: DropdownButton<String>(
              value: currency,
              items: getListofCurrencies(),
              onChanged: (value){
                getListofCurrencies();
                setState(() {
                  currency=value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}