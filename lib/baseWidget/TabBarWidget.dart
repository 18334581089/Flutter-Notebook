import 'package:flutter/material.dart';

///支持顶部和顶部的TabBar控件
///配合AutomaticKeepAliveClientMixin可以keep住
class TabBarWidget extends StatefulWidget {
  final TabType type;

  final List<Widget>? tabItems;

  final List<Widget>? tabViews;

  final Color? backgroundColor;

  final Color? indicatorColor;

  final Widget? title;

  final Widget? drawer;

  final Widget? floatingActionButton;

  final FloatingActionButtonLocation? floatingActionButtonLocation;

  final ValueChanged<int>? onPageChanged;
  final ValueChanged<int>? onSinglePress;
  TabBarWidget({
    Key? key,
    this.type = TabType.top,
    this.tabItems,
    this.tabViews,
    this.backgroundColor,
    this.indicatorColor,
    this.title,
    this.drawer,
    this.floatingActionButtonLocation,
    this.floatingActionButton,
    this.onPageChanged,
    this.onSinglePress,
  }) : super(key: key);

  @override
  _GSYTabBarState createState() => _GSYTabBarState();
}

class _GSYTabBarState extends State<TabBarWidget>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();

  TabController? _tabController;

  int _index = 0;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      vsync: this,
      length: widget.tabItems!.length,
    );

    _tabController!.addListener(() {
      print('_tabController: ${_tabController!.index}');
    });

    /// 触发initState
    print('TabBarWidget 触发了 initState');
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ///底部TAbBar模式
    return Scaffold(

        /// 侧边 抽屉 drawer
        drawer: widget.drawer,

        /// 悬浮按键
        floatingActionButton:
            SafeArea(child: widget.floatingActionButton ?? Container()),
        floatingActionButtonLocation: widget.floatingActionButtonLocation,

        /// 标题栏
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: widget.title,
          bottom: TabBar(
            /// 顶部时，tabBar为可以滑动的模式
            isScrollable: true,

            /// 每一个tab item，是一个List<Widget>
            tabs: widget.tabItems!,

            /// 必须有的控制器，与pageView的控制器同步
            controller: _tabController,

            /// tab选中条颜色
            indicatorColor: widget.indicatorColor,
          ),
        ),

        /// 页面主体，PageView，用于承载Tab对应的页面
        body: PageView(
          /// 必须有的控制器，与tabBar的控制器同步
          controller: _pageController,

          ///每一个 tab 对应的页面主体，是一个List<Widget>
          children: widget.tabViews!,

          ///页面触摸作用滑动回调，用于同步tab选中状态
          onPageChanged: _navigationPageChanged,
        ),

        /// 底部导航栏
        bottomNavigationBar: Material(
          // color: Theme.of(context).primaryColor,
          color: Color(0xFF24292E),

          /// tabBar控件
          child: TabBar(
            /// 必须有的控制器，与pageView的控制器同步
            controller: _tabController,

            /// 每一个tab item，是一个List<Widget>
            tabs: widget.tabItems!,

            /// tab底部选中条颜色
            indicatorColor: widget.indicatorColor,

            /// itemBar点击回调
            onTap: _navigationTapClick,
          ),
        ));
  }

  _navigationPageChanged(index) {
    print('_navigationPageChanged: $index');
    if (_index == index) {
      return;
    }
    _index = index;
    _tabController!.animateTo(index);
    widget.onPageChanged?.call(index);
  }

  _navigationTapClick(index) {
    if (_index == index) {
      return;
    }
    _index = index;
    widget.onPageChanged?.call(index);

    ///每个 Tabbar 点击时，通过jumpTo 跳转页面
    ///每个页面需要跳转坐标为：当前屏幕大小 * 索引index。
    _pageController.jumpTo(MediaQuery.of(context).size.width * index);
    widget.onSinglePress?.call(index);
  }
}

enum TabType { top, bottom }
