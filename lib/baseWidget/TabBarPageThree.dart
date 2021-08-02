import 'package:flutter/material.dart';
import 'package:githubappflutter/based/DemoPage.dart';

class TabBarPageThree extends StatefulWidget {
  const TabBarPageThree({Key? key}) : super(key: key);

  @override
  _TabBarPageThreeState createState() => _TabBarPageThreeState();
}

class _TabBarPageThreeState extends State<TabBarPageThree>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    /// 触发initState
    print('TabBarPageThree 触发了 initState');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: DemoPage(),
    );
  }
}
