import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'baseWidget/TabBarBottomPageWidget.dart';
import './redux/state.dart';
import 'baseWidget/myWillPopScope.dart';
import 'models/User.dart';

void main() {
  runApp(MyApp());
}

/// initialState 初始化 State
final store = Store<AppState>(
  AppReducer,
  initialState: AppState(userInfo: User.empty()),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
        routes: {
          "TabBarPage": (context) => TabBarBottomPageWidget(),
          "HomePage": (context) => HomePage(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            Text('$_counter', style: Theme.of(context).textTheme.headline4),
            TextButton(
                child: Text('点击跳转TabBar页面,并且无法返回'), onPressed: _replacementN),
            TextButton(
                child: Text('点击跳转myWillPopScope页面'), onPressed: _pushNamed),
            TextButton(
                child: Text('点击跳转myWillPopScope页面'), onPressed: _pushNamed),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _replacementN() {
    Navigator.pushReplacementNamed(context, 'TabBarPage');
  }

  void _pushNamed() {
    Navigator.pushNamed(context, 'HomePage');
  }
}
