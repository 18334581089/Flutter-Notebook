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
                child: Text("确定"))
          ],
        );
      },
    );
    // return showDialog(
    //   context: context,
    //   builder: (context) => AlertDialog(
    //     content: Text("是否退出"),
    //     actions: <Widget>[
    //       TextButton(
    //           onPressed: () => Navigator.of(context).pop(false),
    //           child: Text("取消")),
    //       TextButton(
    //           onPressed: () {
    //             Navigator.of(context).pop(true);
    //           },
    //           child: Text("确定"))
    //     ],
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool? res = await _dialogExitApp(context);
        if (res == null) {
          return false;
        } else {
          return true;
        }
      },
      child: Container(),
    );
  }
}

// onPressed: () async {
//   bool? delete = await showDialogTip(context);
Future<bool?> showDialogTip(BuildContext context) {
  return showDialog<bool?>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("提示"),
        content: Text('你确定要删除当前文件么?'),
        actions: [
          TextButton(
            onPressed: () {
              return Navigator.of(context).pop();
            },
            child: Text('取消'),
          ),
          TextButton(
            onPressed: () {
              return Navigator.of(context).pop(true);
            },
            child: Text('确认'),
          ),
        ],
      );
    },
  );
}
