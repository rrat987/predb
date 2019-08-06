import 'package:flutter/material.dart';
// change `flutter_database` to whatever your project name is
import 'package:predb/database_helper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQFlite Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // reference to our single class that manages the database
  final dbHelper = DatabaseHelper.instance;

  // homepage layout
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sqflite'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text(
                'Query Orders',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                _queryOrder();
              },
            ),
            RaisedButton(
              child: Text(
                'query Products',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                _queryProducts();
              },
            ),
            RaisedButton(
              child: Text(
                'query Region',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                _queryRegion();
              },
            ),
          ],
        ),
      ),
    );
  }

  // Button onPressed methods

  void _queryOrder() async {
    final allRows = await dbHelper.queryAllOrderRows();
    print('query all rows:');
    allRows.forEach((row) => print(row));
  }

  void _queryProducts() async {
    final allRows = await dbHelper.queryAllProductRows();
    print('query all rows:');
    allRows.forEach((row) => print(row));
  }

  void _queryRegion() async {
    final allRows = await dbHelper.queryAllRegionRows();
    print('query all rows:');
    allRows.forEach((row) => print(row));
  }
}
