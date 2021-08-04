import 'package:flutter/material.dart';
import 'package:githubappflutter/baseWidget/PullWidget.dart';
import './baseLayout/Row.dart';

class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

final PullLoadWidgetControl _pullLoadWidgetControl = PullLoadWidgetControl();

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('Text content'),
      ),
      body: PullLoadWidget(
        _pullLoadWidgetControl,
        (BuildContext context, int index) => _renderItem(index),
      ),
    );
  }

  /// 构建list
  _renderItem(index) {
    // 判断数据是否为空
    if (_pullLoadWidgetControl.dataList!.length == 0) {
      return null;
    } else {
      // 获取item
      // return _pullLoadWidgetControl.dataList![index];
      return DEMOWidget('data$index');
    }
  }
}

  // ListView.builder(
  //   itemBuilder: (context, index) {
  //     // return Text('data$index');
  //     return DEMOWidget('data$index');
  //   },
  //   itemCount: 20,
  // )
