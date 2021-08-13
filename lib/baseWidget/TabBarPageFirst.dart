import 'package:flutter/material.dart';

class TabBarPageFirst extends StatefulWidget {
  const TabBarPageFirst({Key? key}) : super(key: key);

  @override
  _TabBarPageFirstState createState() => _TabBarPageFirstState();
}

class _TabBarPageFirstState extends State<TabBarPageFirst>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    super.initState();

    /// 触发initState
    print('TabBarPageFirst 触发了 initState');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Text('TabBarPageFirst'),
        Icon(Icons.list, size: 50.0),
        Icon(IconData(0xe6d0, fontFamily: "wxcIconFont"), size: 50.0),
      ],
    );
  }
}
