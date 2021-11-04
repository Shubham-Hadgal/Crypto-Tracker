import 'dart:convert';
import 'package:crypto_app/currencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  List<Currency> listOfData = [];

  Future getCurrencies() async {

    Response response = await http.get(Uri.https('api.coinstats.app', 'public/v1/coins'));
    var jsonData =  jsonDecode(response.body);
    var data = jsonData['coins'];
    listOfData.clear();

    for(var i in data)
    {
      Currency coin = Currency(name: i['name'], symbol: i['symbol'], price: i['price'].toStringAsFixed(2), change: i['priceChange1d'].toStringAsFixed(2), icon: i['icon'], rank: i['rank']);
      listOfData.add(coin);
    }
  }

  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await getCurrencies();
    Navigator.pushReplacementNamed(context, '/home', arguments: listOfData);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: SpinKitRing(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
