import 'package:flutter/material.dart';
import 'package:githubappflutter/main.dart';

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
    return Center(
      child: Column(
        children: [
          Text('TabBarPageSecond'),
          Text('userName: 18334581089@139.com'),
          TextButton(
            onPressed: () {
              login('18334581089@139.com', '123123', store);
            },
            child: Text("点击登录"),
          )
        ],
      ),
    );
  }

  /// 登录接口
  static login(userName, password, store) async {
    // String type = userName + ":" + password;
    // var bytes = utf8.encode(type);
    // var base64Str = base64.encode(bytes);
    // if (Config.DEBUG!) {
    //   print("base64Str login " + base64Str);
    // }

    // Map requestParams = {
    //   "scopes": ['user', 'repo', 'gist', 'notifications'],
    //   "note": "admin_script",
    //   "client_id": NetConfig.CLIENT_ID,
    //   "client_secret": NetConfig.CLIENT_SECRET
    // };

    var res = await httpManager.netFetch(Address.getAuthorization(),
        json.encode(requestParams), null, new Options(method: "post"));
    dynamic resultData = null;
    if (res != null && res.result) {
      await LocalStorage.save(Config.PW_KEY, password);
      var resultData = await getUserInfo(null);
      if (Config.DEBUG!) {
        print("user result " + resultData.result.toString());
        print(resultData.data);
        print(res.data.toString());
      }
      store.dispatch(new UpdateUserAction(resultData.data));
    }
    return new DataResult(resultData, res!.result);
  }
}
