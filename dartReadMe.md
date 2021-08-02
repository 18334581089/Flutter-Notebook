- 简单讲述下 Dart 的一些特性
1. **var**

> 定义变量
> 1: dart 会自动推导出var声明的数据类型(dart是强类型语言,不同于js)
> 2: var 相当于是一个语法糖

2. **dynamic**

> 表示: 动态类型
> 1. 是一个object类型
> 2. 会关闭对此变量的类型检查, 编译期间不进行类型检查,运行时进行类型检查
> 3. 函数返回值没有指定类型时会默认为dynamic

3. **number**

> 1. int 和 double 两种类型
> 2. int先当于 java中的long类型
> 3. dart中没有float类型

4. **bool**

> 1. 只有bool可以用来作为if判断

***

1. **变量**

> 1. dart中不需要给变量设置 setter 和 getter,默认有
> 2. dart中所有的基础类型都继承object
> 3. 如果定义的变量是 final 或 const ,默认只有一个getter方法

2. **常量**

> 1. final 和 const 表示常量
> 2. static const 组合表示 静态常量
> 3. 主要区别: const在编译时确定,final 在运行时确定

3. **数值变量**

> 1. 数值在当作字符串使用的时候需要显式转换
```
int i = 0;
print("aaaa" + i.toString());
```
*注意使用动态类型时,不要把number当作string来使用*

4. **数组**

> 1. 数组等于列表
> 所以 var list = []; 和 List list = new List() 可以简单看做一样


***

1. **??**
> 1. 相当于 ||
2. **??=**
> 1. AA ??= "999" 表示如果 AA 为空, AA = 999
3. **可选参数**

`getDetail([String branch = "master"]){}`
> 1. 声明 List 格式的参数列表: 表示可选参数
> 2. 默认值 直接在后面赋值
> 3. 指定类型 直接写在参数前面

4. **命名参数**

```
void buildThree(int num, {String name, int range = 10}) { }
buildThree(10,range: 1);
```
> 1. 上面函数调用的时候,指定传参时range,所以name参数不会被赋值

5. **修饰符**

> 1. dart没有public 和 private
> 2. dart中,使用 _开头表示private,需要使用 @protected 注解

6. **构造函数**

```
class ModelA {
  String name;
  String tag;
  
  //默认构造方法，赋值给name和tag
  ModelA(this.name, this.tag);

  //返回一个空的ModelA
  ModelA.empty();
  
  //返回一个设置了name的ModelA
  ModelA.forName(this.name);
}
```

***

1. **Flutter async/await**

> 1. flutter 支持 async 和 await
> 2. async/await 其实只是语法糖, 最终会编译为 Flutter 中返回 Future 对象

2. **Flutter Widget**

> 1. 相当于react中的 组件
> 2. 响应式模式进行渲染,通过setState修改状态,自动同步界面
> 3. Widget 和 Widget 之间通过 child: 进行嵌套(多个child使用children)

#### 7/28

3. **无状态StatelessWidget**

> 1. 实例: statelesswidget.dart
> 2. widget: 数据可以通过构造方法传递进来

4. **有状态StatefulWidget**

> 1. 实例: StatefulWidget.dart
> 2. 对于StatefulWidget控件创建管理的是主要是 State
> 3. State 的 build 方法用来构建控件
> 4. State中: setState之后，改变的数据会触发 Widget 重新构建刷新

5. **State声明周期**

> 1. initState: 初始化
> 2. didChangeDependencies: 初始化之后,可以获取其他 State
> 3. dispose : 销毁

***

1. **Flutter 布局简介**

| 类型 |	作用特点 |
| -- | -- |
| Container |	一个子 Widget。默认充满，包含了padding、margin、color、宽高、decoration 等配置。 |
| Padding |	一个子 Widget。只用于设置Padding，常用于嵌套child，给child设置padding。 |
| Center |	一个子 Widget。只用于居中显示，常用于嵌套child，给child设置居中。 |
| Stack |	多个子 Widget。子Widget堆叠在一起。 |
| Column |	多个子 Widget。垂直布局。 |
| Row |	多个子 Widget。水平布局。 |
| Expanded |	一个子 Widget。在 Column 和 Row 中充满。 |
| ListView |	多个子 Widget。自己意会吧。 |

2. **Container**

> 1. 不是所有的控件都有 宽高、padding、margin、color 等属性，所以才会有 Padding、Center 等 Widget 的存在
> 2. Container: 多个内置控件组成的模版,
> 3. Container: 支持 padding,margin,color,宽高,decoration
> 4. 实例: Container.dart

3. **Column、Row**

> 1. flutter:  必备布局
> 2. 常用属性: 
> 3. mainAxisAlignment: 主轴对齐方式
> 4. crossAxisAlignment: 复轴对齐方式
> 5. mainAxisSize: 充满父级尺寸方式

4. **Expanded**

> 1. css中flex的作用
> 2. 配合column 和 row 来使用
> 3. 常用属性:
> 4. flex: 表示弹性系数(咱多大地方),默认1

***dart 1.x的时候，new是不能省略的。
dart 2.x的时候，new是可选关键词，可以省略***

> 5. Row设置mainAxisAlignment:MainAxisAlignment.spaceEvenly 和 在column或row中使用expanded的效果区别
> 6. 都能实现平等分布剩余空间,使用expanded会该表原来的组件大小
> 7. 实例: Row.dart

***dart中如果使用_开头,表示当前变量和方法时私有的***

***

1. **Flutter 页面**

| 类型 |	作用特点 |
| -- | -- |
| MaterialApp |	APP顶层的主页入口，可配置主题，多语言，路由等 |
| Scaffold | 页面的承载Widget，包含appbar、snackbar、drawer |
| Appbar | Scaffold的appbar ，有标题，返回按键等，tabbar会需要它 。 |
| Text |	显示文本，通过style设置TextStyle来设置字体样式等。 |
| RichText |	富文本，通过设置TextSpan，可以拼接出富文本场景。 |
| TextField |	文本输入框 ：TextField(controller: //文本控制器, obscureText: "hint文本"); |
| Image |	图片加载: FadeInImage.assetNetwork( placeholder: "预览图", fit: BoxFit.fitWidth, image: "url"); |


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