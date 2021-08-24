import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import './TabBarWidget.dart';
import 'TabBarPageFirst.dart';
import 'TabBarPageSecond.dart';
import 'TabBarPageThree.dart';

class TabBarBottomPageWidget extends StatefulWidget {
  @override
  _TabBarBottomPageWidgetState createState() => _TabBarBottomPageWidgetState();
}

class _TabBarBottomPageWidgetState extends State<TabBarBottomPageWidget> {
  final List<String> tab = ["动态", "趋势", "我的"];

  @override
  Widget build(BuildContext context) {
    ///带 Scaffold 的Tabbar页面
    return TabBarWidget(
      type: TabType.bottom,

      ///渲染tab
      tabItems: _renderTab(),

      ///渲染页面
      tabViews: _renderPage(),
      backgroundColor: Colors.black45,
      indicatorColor: Colors.white,
      title: Text("GithubFlutter"),
    );
  }

  @override
  void initState() {
    super.initState();
    // print(StoreProvider.of(context).state.userInfo.name);
  }

  ///渲染底部Tab
  _renderTab() {
    List<Widget> list = [];
    for (int i = 0; i < tab.length; i++) {
      list.add(
        /// 跳转方法已经封装在了组件里面,这里只需要展示文字
        // TextButton(
        //   onPressed: () {
        //     print('触发跳转');
        //   },
        //   child: Text(
        //     tab[i],
        //     maxLines: 1,
        //   ),
        // ),
        Text(tab[i]),
      );
    }
    return list;
  }

  ///渲染Tab 对应页面
  _renderPage() {
    return [
      TabBarPageFirst(),
      TabBarPageSecond(),
      TabBarPageThree(),
    ];
  }
}
