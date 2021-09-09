import 'package:flutter/material.dart';
import './_getBottomItem.dart';

class DEMOWidget extends StatelessWidget {
  final text;
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey;
  //数据可以通过构造方法传递进来
  DEMOWidget(
    this.text,
    this.refreshIndicatorKey,
  );

  showForRefresh() {
    ///显示刷新
    refreshIndicatorKey.currentState!.show();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      ///卡片包装
      child: Card(

          ///增加点击效果
          child: TextButton(
              onPressed: () {
                print("点击了哦");
                showForRefresh();
              },
              child: Padding(
                padding: EdgeInsets.only(
                    left: 0.0, top: 10.0, right: 10.0, bottom: 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ///文本描述
                    Container(
                      child: Text(
                        text,
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14.0,
                        ),

                        ///最长三行，超过 ... 显示
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      margin: EdgeInsets.only(top: 6.0, bottom: 2.0),
                      alignment: Alignment.topLeft,
                    ),
                    Padding(padding: EdgeInsets.all(10.0)),

                    ///三个平均分配的横向图标文字
                    Row(
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
