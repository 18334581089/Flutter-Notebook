import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Future<bool?> _dialogExitApp(BuildContext context) {
    return showDialog<bool?>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text('是否退出?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text("取消"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text("确定"),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: WillPopScope(
        onWillPop: () async {
          bool? res = await _dialogExitApp(context);
          if (res == null) {
            return false;
          } else if (res) {
            return true;
          } else {
            return false;
          }
        },
        child: Container(
          child: Text('尝试 返回键的拦截'),
        ),
      ),
    );
  }
}
