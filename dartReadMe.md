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