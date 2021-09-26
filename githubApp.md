#### 9/25,开始抄页面
-. **main.dart**
1. GestureBinding
> 屏幕刷新率和显示率不一致时的优化

`GestureBinding.instance?.resamplingEnabled = true;`
> [官方](https://api.flutter.dev/flutter/gestures/GestureBinding/resamplingEnabled.html)
> 页面更加流畅,代价是延迟
> [博客](https://blog.csdn.net/longlyboyhe/article/details/110703070) 使滚动时的颤动减少

2. runZonedGuarded
> **flutter Zone**
> [dart官方](https://dart.dev/articles/archive/zones)
> dart中和区域有关API
> runZoned()是顶级函数
> 区域最常见的用途是处理异步执行代码中引发的错误
(还没看怎么用)

#### 9/26
2. runZonedGuarded
> [博客](https://blog.csdn.net/u013066292/article/details/118459022)
> Zone中可以捕获日志输出、Timer创建、微任务调度的行为，同时Zone也可以捕获所有未处理的异常。
> runZoned 有 onError的回调,官方推荐使用 run'ZoneGuarded()来代替
> [flutter实战](https://book.flutterchina.club/chapter2/thread_model_and_error_report.html#_2-8-2-flutter%E5%BC%82%E5%B8%B8%E6%8D%95%E8%8E%B7)
> 里面已经比较清楚的降到了runZoned的用法
3. ErrorWidget.builder
> [博客](https://www.jianshu.com/p/b50e2dac54da)
> 错误是通过FlutterError.reportError方法上报的
> 如果我们想自己上报异常，只需要提供一个自定义的错误处理回调即可