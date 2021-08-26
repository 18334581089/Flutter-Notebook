import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:githubappflutter/main.dart';
import 'package:githubappflutter/models/User.dart';
import 'package:githubappflutter/redux/_user.dart';
import 'package:githubappflutter/redux/state.dart';

class TabBarPageSecond extends StatefulWidget {
  const TabBarPageSecond({Key? key}) : super(key: key);

  @override
  _TabBarPageSecondState createState() => _TabBarPageSecondState();
}

class _TabBarPageSecondState extends State<TabBarPageSecond>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    print('TabBarPageSecond 触发了 initState');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return StoreConnector<AppState, User>(
      converter: (store) => store.state.userInfo,
      builder: (context, userInfo) {
        String _text = userInfo.name == null ? '没数据' : userInfo.name as String;
        return Center(
          child: Column(
            children: [
              Text('TabBarPageSecond'),
              Text(_text),
              TextButton(
                onPressed: () {
                  login('18334581089@139.com', '123123');
                },
                child: Text("点击登录"),
              ),
              TextButton(
                onPressed: () {
                  print(
                      StoreProvider.of<AppState>(context).state.userInfo!.name);
                },
                child: Text("点击打印名称(登陆后)"),
              ),
            ],
          ),
        );
      },
    );
  }

  /// 登录接口
  static login(userName, password) async {
    await Future.delayed(Duration(seconds: 1));
    User _user = User.test();
    store.dispatch(new UpdateUserAction(_user));
    return {};
  }
}
