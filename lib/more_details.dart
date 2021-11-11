import 'package:flutter/material.dart';
import 'package:crypto_app/currencies.dart';

class MoreDetails extends StatefulWidget {
  const MoreDetails({Key? key}) : super(key: key);

  @override
  _MoreDetailsState createState() => _MoreDetailsState();
}

class _MoreDetailsState extends State<MoreDetails> {
  @override
  Widget build(BuildContext context) {
    Currency details = ModalRoute.of(context)!.settings.arguments as Currency;

    Widget name = Text(details.name);
    Widget icon = Center(
      child: CircleAvatar(
        backgroundImage: NetworkImage(details.icon),
        backgroundColor: Colors.black45,
        radius: 70.0,
      ),
    );
    Widget symbolAndRankRow = Row(
      children: [
        Text(details.symbol),
        const Spacer(),
        Text(details.rank),
      ],
    );
    Widget price = Text(details.price);
    Widget marketCapital = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Market Capital'),
        const SizedBox(height: 10.0),
        Text(details.marketCap),
      ],
    );


    return Scaffold(
      backgroundColor: const Color(0xff283747),
      appBar: AppBar(
        title: const Text('More Details'),
        backgroundColor: const Color(0xff283747),
      ),
      body: Padding(
        padding: const EdgeInsets.all(3.0),
        child: marketCapital,
      ),
    );
  }
}
