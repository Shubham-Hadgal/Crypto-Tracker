import 'package:crypto_app/currencies.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late List<Currency> listOfData;

  @override
  Widget build(BuildContext context) {

    listOfData = ModalRoute.of(context)!.settings.arguments as List<Currency>;

    return Scaffold(
      backgroundColor: const Color(0xff283747),
      appBar: AppBar(
        title: const Text(
          'Crypto Currencies',
          style: TextStyle(
            color: Color(0xffe5e8e8),
          ),
        ),
        elevation: 0.0,
        backgroundColor: const Color(0xff283747),
      ),
      body: ListView.builder(
        itemCount: listOfData.length,
        itemBuilder: (BuildContext context, int index) {

          double change = double.parse(listOfData[index].change1h);
          Color changeColor = getChangeColor(change);

          Widget icon = CircleAvatar(
            backgroundImage: NetworkImage(listOfData[index].icon),
            backgroundColor: Colors.black45,
            radius: 20.0,
          );

          Widget column1 = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 5.0, 8.0, 0.0),
                child: Text(
                  listOfData[index].name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 17.0,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 5.0, 8.0, 0.0),
                child: Text(
                  listOfData[index].symbol,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          );

          Widget column2 = Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 5.0, 8.0, 0.0),
                child: Text(
                  'Price: \$ ${listOfData[index].price}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 5.0, 8.0, 0.0),
                child: Text(
                  change > 0 ? '+${listOfData[index].change1h}' : listOfData[index].change1h,
                  style: TextStyle(
                    color: changeColor,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          );

          return Padding(
            padding: const EdgeInsets.fromLTRB(3.0, 0.0, 3.0, 0.0),
            child: InkWell(
              onTap: (){
                // print(listOfData[index].name);
                // print(listOfData[index].symbol);
                // print(listOfData[index].price);
                // print(listOfData[index].icon);
                // print(listOfData[index].rank);
                // print(listOfData[index].marketCap);
                // print(listOfData[index].change1h);
                // print(listOfData[index].change1d);
                // print(listOfData[index].change1w);
                // print(listOfData[index].totalSupply);
                // print(listOfData[index].availableSupply);
                // print(listOfData[index].websiteUrl);
              },
              child: Container(
                constraints: BoxConstraints.expand(
                  height: Theme.of(context).textTheme.headline4!.fontSize! * 1.1 + 45.0,
                ),
                child: Card(
                  color: const Color(0xFF1C2833),
                  shadowColor: Colors.transparent,
                  child: Row(
                    children: [
                      Container(
                        child: icon,
                        padding: const EdgeInsets.all(5.0),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        flex: 1,
                        child: column1,
                      ),
                      Expanded(
                        flex: 1,
                        child: column2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Color getChangeColor(double change) {
    if(change > 0) {
        return const Color(0xff00ff71);
    }
    else if(change < 0){
      return const Color(0xffff0000);
    }
    else {
      return const Color(0xffeaeaea);
    }
  }
}
