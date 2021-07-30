import 'package:flutter/material.dart';

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

    /// 触发initState
    print('TabBarPageSecond 触发了 initState');
  }

  @override
  Widget build(BuildContext context) {
    return Text('TabBarPageSecond');
  }
}
