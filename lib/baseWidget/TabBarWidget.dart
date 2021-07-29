import 'package:flutter/material.dart';
import 'TabsWidget.dart' as Tabs;

///支持顶部和顶部的TabBar控件
///配合AutomaticKeepAliveClientMixin可以keep住
class GSYTabBarWidget extends StatefulWidget {
  final TabType type;

  final bool resizeToAvoidBottomPadding;

  final List<Widget>? tabItems;

  final List<Widget>? tabViews;

  final Color? backgroundColor;

  final Color? indicatorColor;

  final Widget? title;

  final Widget? drawer;

  final Widget? floatingActionButton;

  final FloatingActionButtonLocation? floatingActionButtonLocation;

  final Widget? bottomBar;

  final List<Widget>? footerButtons;

  final ValueChanged<int>? onPageChanged;
  final ValueChanged<int>? onDoublePress;
  final ValueChanged<int>? onSinglePress;

  GSYTabBarWidget({
    Key? key,
    this.type = TabType.top,
    this.tabItems,
    this.tabViews,
    this.backgroundColor,
    this.indicatorColor,
    this.title,
    this.drawer,
    this.bottomBar,
    this.onDoublePress,
    this.onSinglePress,
    this.floatingActionButtonLocation,
    this.floatingActionButton,
    this.resizeToAvoidBottomPadding = true,
    this.footerButtons,
    this.onPageChanged,
  }) : super(key: key);

  @override
  _GSYTabBarState createState() => _GSYTabBarState();
}

class _GSYTabBarState extends State<GSYTabBarWidget>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();

  TabController? _tabController;

  int _index = 0;

  @override
  void initState() {
    super.initState();

    /// 通过 with SingleTickerProviderStateMixin 实现动画效果。
    _tabController =
        TabController(vsync: this, length: widget.tabItems!.length);
  }

  ///整个页面dispose时，记得把控制器也dispose掉，释放内存
  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  _navigationPageChanged(index) {
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

    ///不想要动画
    _pageController.jumpTo(MediaQuery.of(context).size.width * index);
    widget.onSinglePress?.call(index);
  }

  _navigationDoubleTapClick(index) {
    _navigationTapClick(index);
    widget.onDoublePress?.call(index);
  }

  // @override
  // Widget build(BuildContext context) {
  //   if (widget.type == TabType.top) {
  //     ///顶部tab bar
  //     return Scaffold(
  //       resizeToAvoidBottomInset: widget.resizeToAvoidBottomPadding,
  //       floatingActionButton:
  //           SafeArea(child: widget.floatingActionButton ?? Container()),
  //       floatingActionButtonLocation: widget.floatingActionButtonLocation,
  //       persistentFooterButtons: widget.footerButtons,
  //       appBar: AppBar(
  //         backgroundColor: Theme.of(context).primaryColor,
  //         title: widget.title,
  //         bottom: TabBar(
  //             controller: _tabController,
  //             tabs: widget.tabItems!,
  //             indicatorColor: widget.indicatorColor,
  //             onTap: _navigationTapClick),
  //       ),
  //       body: PageView(
  //         controller: _pageController,
  //         children: widget.tabViews!,
  //         onPageChanged: _navigationPageChanged,
  //       ),
  //       bottomNavigationBar: widget.bottomBar,
  //     );
  //   }

  //   ///底部tab bar
  //   return Scaffold(
  //       drawer: widget.drawer,
  //       appBar: AppBar(
  //         backgroundColor: Theme.of(context).primaryColor,
  //         title: widget.title,
  //       ),
  //       body: PageView(
  //         controller: _pageController,
  //         children: widget.tabViews!,
  //         onPageChanged: _navigationPageChanged,
  //       ),
  //       bottomNavigationBar: Material(
  //         //为了适配主题风格，包一层Material实现风格套用
  //         color: Theme.of(context).primaryColor, //底部导航栏主题颜色
  //         child: SafeArea(
  //           child: Tabs.TabBar(
  //             //TabBar导航标签，底部导航放到Scaffold的bottomNavigationBar中
  //             controller: _tabController,
  //             //配置控制器
  //             tabs: widget.tabItems!,
  //             indicatorColor: widget.indicatorColor,
  //             onDoubleTap: _navigationDoubleTapClick,
  //             onTap: _navigationTapClick, //tab标签的下划线颜色
  //           ),
  //         ),
  //       ));
  // }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        ///设置侧边滑出 drawer
        // drawer: _drawer,
        drawer: widget.drawer,
        ///设置悬浮按键
        // floatingActionButton: _floatingActionButton,
        floatingActionButton:
            SafeArea(child: widget.floatingActionButton ?? Container()),
        floatingActionButtonLocation: widget.floatingActionButtonLocation,

        ///标题栏
        // appBar: new AppBar(
        //   backgroundColor: _backgroundColor,
        //   title: _title,
        // ),
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: widget.title,
          bottom: TabBar(
              controller: _tabController,
              tabs: widget.tabItems!,
              indicatorColor: widget.indicatorColor,
              onTap: _navigationTapClick),
        ),


        ///页面主体，PageView，用于承载Tab对应的页面
        /// TODO
        body: new PageView(
          ///必须有的控制器，与tabBar的控制器同步
          controller: _pageController,

          ///每一个 tab 对应的页面主体，是一个List<Widget>
          children: _tabViews,
          onPageChanged: (index) {
            ///页面触摸作用滑动回调，用于同步tab选中状态
            _tabController.animateTo(index);
          },
        ),

        ///底部导航栏，也就是tab栏
        bottomNavigationBar: new Material(
          color: _backgroundColor,

          ///tabBar控件
          child: new TabBar(
            ///必须有的控制器，与pageView的控制器同步
            controller: _tabController,

            ///每一个tab item，是一个List<Widget>
            tabs: _tabItems,

            ///tab底部选中条颜色
            indicatorColor: _indicatorColor,
          ),
        ));
  }
}

enum TabType { top, bottom }
