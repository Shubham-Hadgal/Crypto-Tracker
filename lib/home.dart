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
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Crypto Currencies'),
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: listOfData.length,
        itemBuilder: (BuildContext context, int index) {

          Widget icon = CircleAvatar(
            backgroundImage: NetworkImage(listOfData[index].icon),
            backgroundColor: Colors.black45,
            radius: 20.0,
          );

          Widget column1 = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 5.0, 8.0, 0.0),
                child: Text(
                  listOfData[index].name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(height: 5.0),
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
              const SizedBox(height: 5.0),
            ],
          );

          Widget column2 = Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 5.0, 8.0, 0.0),
                child: Text(
                  'Price: \$ ${listOfData[index].price}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
              ),
              const SizedBox(height: 5.0),
            ],
          );

          return Padding(
            padding: const EdgeInsets.fromLTRB(3.0, 0.0, 3.0, 0.0),
            child: InkWell(
              onTap: (){
                print(listOfData[index].name);
                print(listOfData[index].rank);
                print(listOfData[index].marketCap);
              },
              child: Container(
                constraints: BoxConstraints.expand(
                  height: Theme.of(context).textTheme.headline4!.fontSize! * 1.1 + 40.0,
                ),
                child: Card(
                  color: Colors.grey[800],
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
}
