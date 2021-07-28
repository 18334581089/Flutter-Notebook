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