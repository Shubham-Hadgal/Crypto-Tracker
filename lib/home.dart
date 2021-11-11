import 'package:crypto_app/currencies.dart';
import 'package:flutter/material.dart';
import 'network/api_call.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late List<SingleCurrency> listOfData;

  @override
  Widget build(BuildContext context) {

    listOfData = ModalRoute.of(context)!.settings.arguments as List<SingleCurrency>;
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
      body: RefreshIndicator(
        child: ListView.builder(
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
                      overflow: TextOverflow.ellipsis,
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
                    change > 0 ? '+${listOfData[index].change1h}%' : '${listOfData[index].change1h}%',
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
                  Navigator.pushNamed(context, '/more_details', arguments: listOfData[index]);
                },
                child: Container(
                  constraints: BoxConstraints.expand(
                    height: Theme.of(context).textTheme.headline4!.fontSize! * 1.1 + 40.0,
                  ),
                  child: Card(
                    color: const Color(0xFF1C2833),
                    shadowColor: Colors.transparent,
                    child: Row(
                      children: [
                        const SizedBox(width: 7.0),
                        icon,
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
        onRefresh: () async {
          await _navigateToHome();
          Navigator.pushReplacementNamed(context, '/home', arguments: listOfData);
        },
      ),
    );
  }

  _navigateToHome() async {
    await ApiCall().getCurrencies();
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