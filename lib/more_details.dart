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
    SingleCurrency details = ModalRoute.of(context)!.settings.arguments as SingleCurrency;

    double change1ha = double.parse(details.change1h);
    Color change1h = getChangeColor(change1ha);
    double change1da = double.parse(details.change1d);
    Color change1d = getChangeColor(change1da);
    double change1wa = double.parse(details.change1w);
    Color change1w = getChangeColor(change1wa);

    Widget name = Text(
      details.name,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 25.0,
      ),
    );
    Widget icon = Center(
      child: CircleAvatar(
        backgroundImage: NetworkImage(details.icon),
        backgroundColor: Colors.black45,
        radius: 70.0,
      ),
    );
    Widget symbolAndRankRow = Row(
      children: [
        Text(
          details.symbol,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        const Spacer(),
        Text(
          '#${details.rank}',
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ],
    );
    Widget price = Text(
      '\$ ${details.price}',
      style: const TextStyle(
        fontSize: 30.0,
        color: Colors.cyanAccent,
      ),
    );
    Widget marketCapital = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Market Capital',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          details.marketCap,
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.orange,
          ),
        ),
      ],
    );
    Widget changes = Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            children: [
              const Text(
                '1H',
                style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                change1ha > 0 ? '+${details.change1h}': details.change1h,
                style: TextStyle(
                  color: change1h,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              const Text(
                '1D',
                style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                change1da > 0 ? '+${details.change1d}': details.change1d,
                style: TextStyle(
                  color: change1d,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              const Text(
                '1W',
                style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                change1wa > 0 ? '+${details.change1w}': details.change1w,
                style: TextStyle(
                  color: change1w,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: name,
              ),
              const SizedBox(height: 10.0),
              icon,
              const SizedBox(height: 10.0),
              Expanded(
                flex: 1,
                child: symbolAndRankRow,
              ),
              const SizedBox(height: 5.0),
              Expanded(
                flex: 1,
                child: price,
              ),
              const SizedBox(height: 20.0),
              Expanded(
                flex: 1,
                child: marketCapital,
              ),
              const SizedBox(height: 30.0),
              Expanded(
                flex: 1,
                child: changes,
              ),
            ],
          ),
        ),
      ),
    );
  }
  Color getChangeColor(double change) {
    if(change > 0) {
      return const Color(0xff00ff71);
    }
    else if(change < 0){
      return const Color(0xffff3939);
    }
    else {
      return const Color(0xffeaeaea);
    }
  }
}
