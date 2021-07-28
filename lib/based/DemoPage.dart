
import 'package:flutter/material.dart';
import './baseLayout/Row.dart';

class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(title: Text('Text content'),),
      body: ListView.builder(
        itemBuilder: (context, index) {
          // return Text('data$index');
          return DEMOWidget('data$index');
        },
        itemCount: 20,
      ),
    );
  }
}