import 'package:crypto_app/network/api_call.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'currencies.dart';


class Loading extends StatefulWidget {

  static List<SingleCurrency> listOfData = [];

  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await ApiCall().getCurrencies();
    Loading.listOfData = ApiCall.listOfData;
    Navigator.pushReplacementNamed(context, '/home', arguments: Loading.listOfData);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff283747),
      body: Center(
        child: SpinKitRing(
          color: Colors.white,
          size: 60.0,
        ),
      ),
    );
  }
}
