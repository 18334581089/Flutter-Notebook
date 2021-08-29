import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  /// 单击提示退出
  Future<bool> _dialogExitApp(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("是否退出"),
              actions: <Widget>[
                TextButton(onPressed: () => Navigator.of(context).pop(false), child:  Text("取消")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Text("确定"))
              ],
            ),);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return _dialogExitApp(context);
      },
      child: Container(),
    );
  }
}