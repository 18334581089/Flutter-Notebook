import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const double iosRefreshHeight = 140;
const double iosRefreshIndicatorExtent = 100;
const String app_empty = "目前什么也没有哟";
const String load_more_text = "正在加载更多";
const Color primaryDarkValue = Color(0xFF121917);
const normalTextSize = 18.0;
const normalText = TextStyle(
  color: primaryDarkValue,
  fontSize: normalTextSize,
);
const String DEFAULT_USER_ICON = 'static/images/logo.png';

///通用下上刷新控件
class PullLoadWidget extends StatefulWidget {
  ///item渲染
  final IndexedWidgetBuilder itemBuilder;

  ///下拉刷新回调
  final RefreshCallback? onRefresh;

  ///控制器，比如数据和一些配置
  final PullLoadWidgetControl control;

  ///加载更多回调
  final RefreshCallback? onLoadMore;

  ///刷新key
  final Key? refreshKey;

  PullLoadWidget(
    this.control,
    this.itemBuilder,
    this.onRefresh,
    this.onLoadMore, {
    this.refreshKey,
  });

  @override
  _PullLoadWidgetState createState() => _PullLoadWidgetState();
}

class _PullLoadWidgetState extends State<PullLoadWidget> {
  final ScrollController _scrollController = ScrollController();

  bool isRefreshing = false;

  bool isLoadMoring = false;

  @override
  void initState() {
    ///上拉加载更多
    loadMore1();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      ///GlobalKey，用户外部获取RefreshIndicator的State，做显示刷新
      key: widget.refreshKey,

      ///下拉刷新触发，返回的是一个Future
      onRefresh: widget.onRefresh ?? () async {},
      child: ListView.builder(
        ///数据没有充满ListView也能滚动
        physics: const AlwaysScrollableScrollPhysics(),

        ///根据状态返回子控件
        itemBuilder: (context, index) {
          return _getItem(index);
        },

        ///根据状态返回数量
        itemCount: _getListCount(),

        ///滑动监听
        controller: _scrollController,
      ),
    );
  }

  ///根据配置状态返回实际列表数量
  ///实际上这里可以根据你的需要做更多的处理
  ///比如多个头部，是否需要空页面，是否需要显示加载更多。
  _getListCount() {
    ///是否需要头部
    if (widget.control.needHeader) {
      ///如果需要头部，用Item 0 的 Widget 作为ListView的头部
      ///列表数量大于0时，因为头部和底部加载更多选项，需要对列表数据总数+2
      return (widget.control.dataList!.length > 0)
          ? widget.control.dataList!.length + 2
          : widget.control.dataList!.length + 1;
    } else {
      ///如果不需要头部，在没有数据时，固定返回数量1用于空页面呈现
      if (widget.control.dataList!.length == 0) {
        return 1;
      }

      ///如果有数据,因为部加载更多选项，需要对列表数据总数+1
      return (widget.control.dataList!.length > 0)
          ? widget.control.dataList!.length + 1
          : widget.control.dataList!.length;
    }
  }

  ///根据配置状态返回实际列表渲染Item
  _getItem(int index) {
    if (!widget.control.needHeader &&
        index == widget.control.dataList!.length &&
        widget.control.dataList!.length != 0) {
      ///如果不需要头部，并且数据不为0，当index等于数据长度时，渲染加载更多Item（因为index是从0开始）
      return _buildProgressIndicator();
    } else if (widget.control.needHeader &&
        index == _getListCount() - 1 &&
        widget.control.dataList!.length != 0) {
      ///如果需要头部，并且数据不为0，当index等于实际渲染长度 - 1时，渲染加载更多Item（因为index是从0开始）
      return _buildProgressIndicator();
    } else if (!widget.control.needHeader &&
        widget.control.dataList!.length == 0) {
      ///如果不需要头部，并且数据为0，渲染空页面
      return _buildEmpty();
    } else {
      ///回调外部正常渲染Item，如果这里有需要，可以直接返回相对位置的index
      return widget.itemBuilder(context, index);
    }
  }

  ///上拉加载更多
  loadMore1() {
    _scrollController.addListener(() {
      ///判断当前滑动位置是不是到达底部，触发加载更多回调
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (widget.control.needLoadMore == true) {
          widget.onLoadMore?.call();
        }
      }
    });
  }

  ///空页面
  Widget _buildEmpty() {
    return Container(
      height: MediaQuery.of(context).size.height - 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextButton(
            onPressed: () {},
            child: Image(
                image: AssetImage(DEFAULT_USER_ICON),
                width: 70.0,
                height: 70.0),
          ),
          Container(
            child: Text(app_empty, style: normalText),
          ),
        ],
      ),
    );
  }

  ///上拉加载更多
  Widget _buildProgressIndicator() {
    ///是否需要显示上拉加载更多的loading
    Widget _bottomWidget = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ///loading框
        _spinkit,
        _spinkit2,
        _spinkit3,
        Container(
          width: 100.0,
          height: 100.0,
        ),
        Text(
          load_more_text,
          style: TextStyle(
            color: Color(0xFF121917),
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: widget.control.needLoadMore ? _bottomWidget : Container(),
      ),
    );
  }
}

class PullLoadWidgetControl extends ChangeNotifier {
  ///数据，对齐增减，不能替换
  List? _dataList = [];

  ///是否需要加载更多
  bool _needLoadMore = true;

  ///是否需要头部
  bool _needHeader = false;

  ///是否加载中
  bool isLoading = false;

  get needLoadMore => _needLoadMore;
  get needHeader => _needHeader;
  List? get dataList => _dataList;

  set dataList(List? value) {
    _dataList!.clear();
    if (value != null) {
      _dataList!.addAll(value);
      notifyListeners();
    }
  }

  set needLoadMore(value) {
    _needLoadMore = value;
    notifyListeners();
  }

  set needHeader(value) {
    _needHeader = value;
    notifyListeners();
  }

  addList(List? value) {
    if (value != null) {
      _dataList!.addAll(value);
      notifyListeners();
    }
  }
}

/// 使用flutter_spinkit组件
final _spinkit = SpinKitSquareCircle(
  color: Colors.white,
  size: 50.0,
);
final _spinkit2 = SpinKitRotatingCircle(
  color: Colors.deepOrange,
);
final _spinkit3 = SpinKitFadingCircle(
  itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: index.isEven ? Colors.red : Colors.green,
      ),
    );
  },
);
