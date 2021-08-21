
- 项目结构
1. 基础控件、数据模块、其他功能 三部分

***

- 基础控件
1. **Tabbar Widget**

> 1. Tabbar 页面简单实现: Scaffold + AppBar + Tabbar + PageView 
> 2. 实例: TabBarWidget.dart
> 这个页面从网上直接考下来的,和文档中讲解的有很多不一样的地方,
> 但是文档中的内容里面都有,可以用来学习
> 引入的tabsWidget先别管,

#### 7/28

- 由于从网上直接把最终的代码拷贝过来,所以
- 尝试删去多余的代码
- 先找主要的区别

1. 控制器的销毁方法,使用了 !. 的形式
> _tabController!.dispose();
> 没找到相关文档,应该和ts一样,如果有dispose就执行

2. tabBarWidget的示例部分,和最终完成的项目文件之间有很多冲突,并且示例部分会有报错,
> 保证不报错: 先按照实例部分内容写,报错的部分用最终完成的项目来替换
> 保证了解组件: 明白控件的功能和作用

- 第一版TabBarWidget.dart已经完成

1. 先看懂组件里面的构成
> pageview: 控件。这个主要是用于界面的翻页，翻屏
> pageview.controller方法: 值为PageController类,控制初始化显示第几个页面,以及占满屏幕的方法
> TabController: 可以作为TabBar的controller属性值,用来控制和获取tabs的状态
> with SingleTickerProviderStateMixin: with相当于mixin混入,用来实现: Tab 的动画切换效果

- 接着看文档
1. 代码中还缺少了 TabBarItem 的点击
> 复制线上的代码 `onTap: _navigationTapClick),`
> 增加 `onSinglePress` 参数, 增加`_navigationTapClick`方法
> **_pageController.jumpTo** 
> pageController.jumpToPage(0);无动画切换到指定的页面
> pageController.jumpTo(100);无动画 切换到指定的位置(也可以切换页面)
> **MediaQuery.of(context)** MediaQuery.of获取当前设备的信息,MediaQueryData是MediaQuery.of获取数据的类型, MediaQueryData.size表示逻辑像素，

2. 文档中的解释
每个 Tabbar 点击时，通过pageController.jumpTo 跳转页面，每个页面需要跳转坐标为：当前屏幕大小乘以索引 index 

- TabBarBottomPageWidget 控件

1. 先照着文档写下来并且看着线上文档改正格式

2. 报错的已经完全解决了,接下来先看懂他要干嘛,他能干嘛

3. 尝试在模拟器(chrome)中打开

4. 展示,并且可以有交互(完成)

#### 7/30

- 优化

1. 页面切换不在调用initState
2. AutomaticKeepAliveClientMixin可以解决
3. stl 然后回车就可以快速打出 基于stateLessWidget(同理 stf)
4. 通过修改页面证实: 每次点击下面的切换都触发页面的initState方法(stateLessWidget 貌似没有initState的方法,所以使用了stateFulWidget)

> 开始优化
> 1. 对每一个需要优化的子页面使用AutomaticKeepAliveClientMixin混入实现
> 2. 引入AutomaticKeepAliveClientMixin后,必须定义wantKeepAlive ,否则会有格式报错

- 发现问题: 点文字没有用,点框有用
1. 因为我按照最终的结果把跳转的方法卸载了TabBarWidget里面,外面的就可以去掉了

- 实现顶部tab
1. 底部的tab放在: Scaffold 的 bottomNavigationBar
2. 顶部的tab放在: AppBar 的 bottom 中

- 最后父页面需要控制 PageView 中子页的需求
1. 使用GlobalKey实现


#### 7/31

- [Widget的key有什么用？GlobalKey又是什么](https://www.freesion.com/article/4003564716/)

> 1. **_registry**: GlobalKey称之为Global,是因为它有一个属性_registry是一个静态map集合(以GlobalKey为key,以Element为value)
> 2. **state**: StateFulWidget有一个属性state,就是当前StateFulWidget的createState()方法返回值
> 3. **currentState**: GlobalKey的属性currentState,通过内部的_registry,获取对应Element的state(也就是对应StateFulWidget的state)
> 4. **mount**: 通过Widget创建Element时调用的Element.mount方法,内部会判断key值是否是GlobalKey,Element

- 总结GlobalKey
> 1. 操控当前StatefulWidget的State的方法

- 理解线上代码实例

```
  final GlobalKey<MyPageState> myKey = new GlobalKey();
```
```
  new MyPage(key: myKey),
  class MyPageState {
    scrollToTop() {
      if (scrollController.offset <= 0) {
        scrollController
            .animateTo(0,
                duration: Duration(milliseconds: 600), curve: Curves.linear)
            .then((_) {
          showRefreshLoading();
        });
      } else {
        scrollController.animateTo(0,
            duration: Duration(milliseconds: 600), curve: Curves.linear);
      }
    }
  }
```
```
WillPopScope(
  onDoublePress: (index) {
    myKey.currentState!.scrollToTop();
  }
)
```
> WillPopScope: 用来处理是否离开当前页面[(博客)](https://zhuanlan.zhihu.com/p/140235529)

> 通过GlobalKey获取当前widget的state,并在页面返回时,执行state里面的方法
> **目前还没有使用GlobalKey的场景,用到的时候再说**

- 上下拉 刷新列表

1. 先熟悉普通思路
> 1. RefreshIndicator: 内置下拉刷新控件
> 2. ListView.ScrollController: 做滑动监听
> 3. ListView 最后增加一个Item作为Loading的显示

2. 复制线上代码
> 开始理解代码,并且实际运行代码

3. 问题
**Flare动画**
> 1. [参考博客](https://juejin.cn/post/6844903878396215304)
> 2. 一般flutter实现动画的三种方式 (AnimationController, Hero, CustomPainter)
> 3. 第四种flare: 它是一款免费的 网页版的动画制作工具, 
> 4. 特点: (矢量动画, 可以极大的提高效率, 适合代码低耦合动画)

**尝试引入博客中的flare文件成功**
```
dependencies:
  flare_flutter: ^1.5.0
```
```
flutter:
  assets:
    - flrs/
```

#### 8/1
- 继续理解代码
- 1.flare
> 参考博客学会基础使用后,参照线上代码进行完善

```
dependencies:
  flare_flutter:  ^3.0.0-nullsafety.0
```
```
flutter:
  assets:
    - static/file/
```

- 2.

- AutomaticKeepAliveClientMixin: 纠正控制台格式校验
> 1. 使用AutomaticKeepAliveClientMixin 要再build的时候加上`super.build(context);`这句话


#### 8/2 
- 已经纠正了页面提示的所有报错

- 接下来就是使用
1. 尝试在demoPage中使用pullWidget

> 不会使用pullWidget: 不会传参
> 警告: flutter_spinkit

```
The library 'package:flutter_spinkit/flutter_spinkit.dart' is legacy, and should not be imported into a null safe library.
```

> 解决: 去yaml文件下载最新版本

2. pullWidget的第一个参数control

> 1. 属于PullLoadWidgetControl类
> 2. 继承ChangeNotifier类

**ChangeNotifier含义如下[(博客)](https://blog.csdn.net/unicorn97/article/details/99877867)**
> 类似于一个Observable，继承自Listenable，
> 内部维护了一个ObserverList <VoidCallback> _listeners，提供添加和删除listener的方法，
> 有一个notify方法，用来通知所有的观察者（或者称为消费者Consumer）

#### 8/3
- 回顾
1. 看懂PullWidget- 看动传参- 看懂changeNotifier
> changeNotifier
> 一个高级的监听(listenable)
> 可以通过addListener对changeNotifier实例进行监听
> notifyListeners用来通知监听者

- 理解PullWidget
1. PullLoadWidgetControl
> 1. 监听dataList的变化,并且通知监听者
> 2. 管理是否加载更多,保存头部,是否加载中的状态

2. 创建实例(pagedemo)
> 不需要传参,因为没有写构造函数
> 感觉时间花费了不少

3. pullLoadWidget第二个参数: IndexedWidgetBuilder
> 1. 构造list的函数,返回一个widget, 该widget是list中的一项
> 2. 参数有两个,第一个是context,第二个是index
> 3. 当页面滚动到index的位置时,会自动调用改方法,并且展示对应widget

4.在DemoPage简单实现 IndexedWidgetBuilder
> 1. 察觉到问题,我并没有使用好第一个参数,
> 2. 因为第二个参数的生效前提是第一个参数有了数据,所以,参照先上代码重新初始化第一个参数
> 3. 发现在线上代码中,对pullLoadWidgetControl混入了GSYListState
> 4. GSYListState对list进行了初始化

** 没有找到对dataList初始化的地方,所以先停一下吧**

#### 8/5
- PullLoadWidget的使用
1. 简单处理初始化: 在demoPage中initstate初始赋值

2. PullLoadWidget的最后一个参数
> 1.RefreshCallback应该是一个回调函数类型不用多管
> 2.模仿线上写了一个异步获取数据的方法

3. 执行app进行测试
> 1.app执行成功
> 2.控制台报错

 **RangeError (index): Index out of range: index should be less than 3: 3**
> 解决问题了,因为index太大了,超出数据长度,返回null时会有报错

#### 8/6
- PullLoadWidget 的最后阶段,理解代码

> 1.ListView.builder的一个封装
> 2.对上拉加载更多做了处理

#### 8/7
- PullLoadWidget 理解代码,优化实例

1. RefreshIndicator
```
RefreshIndicator(
  //圆圈进度颜色
  color: Colors.blue,
  //下拉停止的距离
  displacement: 44.0,
  //背景颜色
  backgroundColor: Colors.grey[200],
  onRefresh: () async {
    //模拟网络请求
    await Future.delayed(Duration(milliseconds: 2000));
    //结束刷新
    return Future.value(true);
  },
  //一个列表 
  child: ListView.builder(
    itemBuilder: (BuildContext context, int index) {
      return Container(
        height: 66,
        child: Text("测试数据"),
      );
    },
    //列表数据源数量
    itemCount: 100,
  ),
),
```
2. 上拉加载更多
> 首先,列表最后加一个加载更多的item,
> 然后,通过 `ListView.builder` 的controller属性监听滚动到底部
> 最后,调用加载更多的方法
3. _getListCount 获取列表数量的作用
> 获取总长度: 当 `_dataList` 发生变化, _getListCount会自动根据当前长度和其他状态获取count总长度
> `ListView.builder` 的 count 属性,用来规定当前list的总长度
4. 是否需要头部功能 ?
> 注释1: 如果需要头部，用Item 0 的 Widget 作为ListView的头部
> 线上: GSYListState控件中, 初始化了,默认都是false
`pullLoadWidgetControl.needHeader = needHeader;`
> 没有找到true的情况(如果为true应该会再列表里面第一个加入一个表头之类的吧)
2. refreshKey
> 暂不了解

#### 8/9
- PullLoadWidget 理解代码,优化实例

1. 实现上拉
2. 加载更多报错
3. 底部null2不知道为啥

#### 8/11
- PullLoadWidget 加载更多报错

解决: 
> widget.control.needLoadMore.value,
> 这个值没有写默认值

(还有一个问题: 无法启动项目,说是什么内存不够,但是过一会好了)

#### 8/12
- PullLoadWidget null2
> 由于我写的假数据,却搞不懂为什么总有一个null2在底部(先把老的代码贴上去)
```

  _renderItem(index) {
    // 判断数据是否为空
    if (_pullLoadWidgetControl.dataList!.length == 0) {
      return Text('null1');
    } else if (index >= _pullLoadWidgetControl.dataList!.length) {
      return Text('null2');
    } else {
      // 获取item
      int _item = _pullLoadWidgetControl.dataList![index];
      return DEMOWidget('data-index$index, data-value$_item');
    }
  }
```
> 改bug1分钟, 启动项目花了20分钟
> 是因为默认会有一个needheader,所以每次都会比真是长度多一个
> 1: 以后启动项目, 控制台不报错就先等着

- 总算能接着往下看书了**Loading框**
1. 引入
```
  #flutter_spinkit
  flutter_spinkit: "5.0.0"
```
2. 使用内部的构建方法可以快速创建loading组件

#### 8/13
- 引入矢量图
1. 引入阿里矢量图标
```
  fonts:
    - family: wxcIconFont
      fonts:
        - asset: static/font/iconfont.ttf
```
> tab控件也是有默认高度限制的

- 路有
1. Navigator.pushNamed: 跳转,不带参数
2. pushReplacementNamed: 跳转,替换上一个页面
3. pushNamedAndRemoveUntil: 跳转,并且关闭给定路由的之前的所有页面
4. push: 跳转，带参数并且监听返回

#### 8/14
- 网络请求

1. 去官网引入dio
2. 实例
```
void getHttp() async {
  try {
    var response = await Dio().get('http://www.google.com');
    print(response);
  } catch (e) {
    print(e);
  }
}
```
**执行getHttp会报错**
3. 学习线上的
```
Response response;
try {
  response = await _dio.request(url, data: params, options: option);
} on DioError catch (e) {
  return resultError(e);
}
if (response.data is DioError) {
  return resultError(response.data);
}
return response.data;
```
这是线上封装的require代码,可以理解的

#### 8/15
- 继续文档: 实现最简单的Dio
进行到一半

#### 8/16
- 继续文档: Json序列化
```

  #json_serializable
  json_annotation: ^3.0.0

dev_dependencies:
  flutter_test:
    sdk: flutter

  #json_serializable
  json_serializable: ^3.2.0
  build_runner: ^1.8.0
```
> 1.一个一个试,总算`flutter pub get`不在报错

- Model 
1. **创建实体Model**
继承Object
@JsonSerializable() 标记类名(标志class需要实现json序列化功能)
创建如ModelDemo.dart文件
2. **文件中其他部分**
---
1. `part 'ModelDemo.g.dart';`是通过命令生成的文件,用来访问访问`.g.dart` 中的私有方法
2. `with _$ModelDemoSerializerMixin`是`.g.dart`文件中自动生成的抽象类(该抽象类实现了_$TemplateFromJson方法)
3. `@JsonKey(name: "push_id")`通过JsonKey重新定义参数名
4. `ModelDemo.fromJson`在`.g.dart`文件中，默认会根据当前类名如 AA 生成 _$AAeFromJson方法
5. `_$ModelDemoFromJson(json)`返回实体抽象类
---
3. **执行命令成功**
`flutter packages pub run build_runner build`
4. 有问题,mixin没有

#### 8/17
- Model
解决问题: 查看了线上的代码,新版中貌似没有再使用Mixin

- flutter_redux
1. 存储在 redux的好处
> 某个页面修改了当前用户信息，所有绑定的该 State 的控件将由 Redux 自动同步修改，State 可以跨页面共享。

2. **state.dart 文件**
`class State` 全局state对象
**目前还是看不太懂,redux也基本记不清楚了**

#### 8/18
- redux
1. 和官网的写法有出入,所以遇到一些麻烦,
2. 大概流程搞懂了,  写了State,reducer,Action  然后通过main方法引入state就好

#### 8/19
- redux
1. `StoreProvider`咋用
> 1. [博客](https://www.jianshu.com/p/9c1602f82b9e)
> 2. flutter_redux提供了一个很棒的widget叫做StoreProvider，它的用法也很简单，接收一个store，和child Widget,对其子widget提供store
> 3. 简单浏览博客

| Provider | Redex |
| -- | -- |
| 流程上比较清晰，类似观察者模式 |Flutter_redex脱胎于前端的Redex框架，相对成熟 |
| 代码量少，除了ChangeNotifier需要手动实现外，其余的都已经封装 | 适合业务复杂、状态数量大的场景 |
| 可控制刷新范围 | 代码量比较大，许多内容需要手动实现 |

#### 8/20
- redux
1. 需要引入`redux.dart`才可以使用`Store`方法
2. 解决所有的语法提示错误
> ModelDemo 继承于 User

#### 8/21
- 基础知识
1. 构造函数,
> : 表示构造函数调用父级的构造函数
> {this.user} 是一个简写,并且,作为命名参数