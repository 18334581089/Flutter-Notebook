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
        handleRefresh,
        _onLoadMore,
      ),
    );
  }

  Future<Null> _onLoadMore() async {
    print('执行了加载更多 数据会增加5个');
    await Future.delayed(Duration(seconds: 2), () {
      _pullLoadWidgetControl.dataList!.addAll([
        _list.length,
        _list.length + 1,
        _list.length + 2,
        _list.length + 3,
        _list.length + 4
      ]);
    });
    return null;
  }

  /// 构建list
  _renderItem(index) {
    // 判断数据是否为空
    if (_pullLoadWidgetControl.dataList!.length == 0) {
      return Text('null1');
    } else if (index >= _pullLoadWidgetControl.dataList!.length) {
      return Text('null2');
    } else {
      // 获取item
      int _item = _pullLoadWidgetControl.dataList![index];
      return DEMOWidget('data-index$index, data-value$_item');
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _pullLoadWidgetControl.dataList!.addAll([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]);
    });
  }

  List _list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
  _asyncApi() async {
    return await Future.delayed(Duration(seconds: 2), () {
      _list.add(_list.length);
      return _list;
    });
  }

  // 下拉刷新的回调
  bool isLoading = false;
  Future<Null> handleRefresh() async {
    if (isLoading) {
      return null;
    }
    isLoading = true;

    print('触发刷新, 数据+1');

    ///获取提交信息
    var res = await _asyncApi();
    _pullLoadWidgetControl.dataList!.clear();
    setState(() {
      _pullLoadWidgetControl.dataList!.addAll(res);
    });
    isLoading = false;
    return null;
  }
}

  // ListView.builder(
  //   itemBuilder: (context, index) {
  //     // return Text('data$index');
  //     return DEMOWidget('data$index');
  //   },
  //   itemCount: 20,
  // )
