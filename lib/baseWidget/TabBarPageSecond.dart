import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class TabBarPageSecond extends StatefulWidget {
  const TabBarPageSecond({Key? key}) : super(key: key);

  @override
  _TabBarPageSecondState createState() => _TabBarPageSecondState();
}

class _TabBarPageSecondState extends State<TabBarPageSecond>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    super.initState();
    getHttp();

    /// 触发initState
    print('TabBarPageSecond 触发了 initState');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Text('TabBarPageSecond');
  }
}

void getHttp() async {
  try {
    var response = await Dio().get('http://www.google.com');
    print(response);
  } catch (e) {
    print(e);
  }
}
