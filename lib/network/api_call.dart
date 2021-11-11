import 'dart:convert';
import 'package:http/http.dart';
import '../currencies.dart';
import 'package:http/http.dart' as http;

class ApiCall {

  List<SingleCurrency> listOfData = [];

  ApiCall() {
    getCurrencies();
  }

  Future getCurrencies() async {

    Response response = await http.get(Uri.parse('https://api.coinstats.app/public/v1/coins'));
    var jsonData =  jsonDecode(response.body);
    var data = jsonData['coins'];
    listOfData.clear();

    for(var i in data)
    {
      SingleCurrency coin = SingleCurrency(name: i['name'], symbol: i['symbol'],
          price: i['price'].toStringAsFixed(2), change1h: i['priceChange1h'].toStringAsFixed(2),
          change1d: i['priceChange1d'].toStringAsFixed(2),
          change1w: i['priceChange1w'].toStringAsFixed(2), icon: i['icon'],
          rank: i['rank'].toString(), marketCap: i['marketCap'].toStringAsFixed(3),
          websiteUrl: i['websiteUrl'], totalSupply: i['totalSupply'].toString(),
          availableSupply: i['availableSupply'].toString());
      listOfData.add(coin);
    }
  }
}

