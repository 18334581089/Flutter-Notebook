
import 'package:flutter/material.dart';
import './_getBottomItem.dart';

class DEMOWidget extends StatelessWidget {
  final text;

  //数据可以通过构造方法传递进来
  DEMOWidget(this.text);

 @override
  Widget build(BuildContext context) {
    return new Container(
      ///卡片包装
      child: new Card(
           ///增加点击效果
          child: new TextButton(
              onPressed: (){print("点击了哦");},
              child: new Padding(
                padding: new EdgeInsets.only(left: 0.0, top: 10.0, right: 10.0, bottom: 10.0),
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ///文本描述
                    new Container(
                        child: new Text(
                          "这是一点描述",
                          style: TextStyle(
                            color: Color(20),
                            fontSize: 14.0,
                          ),
                          ///最长三行，超过 ... 显示
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        margin: new EdgeInsets.only(top: 6.0, bottom: 2.0),
                        alignment: Alignment.topLeft),
                    new Padding(padding: EdgeInsets.all(10.0)),

                    ///三个平均分配的横向图标文字
                    new Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        getBottomItem(Icons.star, "1000"),
                        getBottomItem(Icons.link, "1000"),
                        getBottomItem(Icons.subject, "1000"),
                      ],
                    ),
                  ],
                ),
              ))),
    );
  }

}
