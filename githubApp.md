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