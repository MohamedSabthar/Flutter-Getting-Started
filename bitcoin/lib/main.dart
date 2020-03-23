import 'package:bitcoin/bitcoin_network.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(primaryColor: Colors.red.shade900),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ListView currencyListView;

  void buildCurrencyListView() async {
    List<dynamic> currencies = await getAllCurrencies();
    setState(() {
      currencyListView = ListView(
          children: currencies
              .map((e) => CurrencyCard(currency: e[0], ammount: "${e[1]} USD"))
              .toList());
    });
  }

  Widget indicateProgress() {
    return Center(child: CircularProgressIndicator());
  }

  @override
  void initState() {
    super.initState();
    buildCurrencyListView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BIT-COIN'),
        centerTitle: true,
        elevation: 6,
      ),
      body: SafeArea(
        child: currencyListView ?? indicateProgress(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.red.shade900,
        onPressed: () {
          setState(() {
            currencyListView = null;
          });
          buildCurrencyListView();
        },
      ),
    );
  }
}

class CurrencyCard extends StatelessWidget {
  final String currency, ammount;
  const CurrencyCard({@required this.currency, @required this.ammount});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.teal.shade600,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      padding: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          Text(
            currency,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white70,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Muli'),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            ammount,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontFamily: 'Racing'),
          ),
        ],
      ),
    );
  }
}
