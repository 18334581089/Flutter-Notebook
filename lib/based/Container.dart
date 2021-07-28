import 'package:flutter/material.dart';

class DEMOWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(

        ///四周10大小的maring
        margin: EdgeInsets.all(10.0),
        height: 120.0,
        width: 500.0,

        ///透明黑色遮罩
        decoration: new BoxDecoration(

            ///弧度为4.0
            borderRadius: BorderRadius.all(Radius.circular(4.0)),

            ///设置了decoration的color，就不能设置Container的color。
            color: Colors.black,

            ///边框
            border: new Border.all(
                color: Color(20), width: 0.3)),
        child: new Text("666666"));
  }
}
