import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

// 默认主题色
const MaterialColor primarySwatch = MaterialColor(
  0xFF24292E,
  const <int, Color>{
    50: const Color(0xFF24292E),
    100: const Color(0xFF24292E),
    200: const Color(0xFF24292E),
    300: const Color(0xFF24292E),
    400: const Color(0xFF24292E),
    500: const Color(0xFF24292E),
    600: const Color(0xFF24292E),
    700: const Color(0xFF24292E),
    800: const Color(0xFF24292E),
    900: const Color(0xFF24292E),
  },
);

// class MyThemeData extends ThemeData {
//   MaterialColor? primarySwatch;
//   MyThemeData();

//   // 命名构造函数
//   MyThemeData.test() {
//     this.primarySwatch = primarySwatch;
//   }
// }

final ThemeDataReducer = combineReducers<ThemeData?>([
  TypedReducer<ThemeData, UpdateThemeDataAction>(_updateLoaded),
]);

ThemeData _updateLoaded(ThemeData? _data, action) {
  if (action.themeData == null) {
    return ThemeData(
      primarySwatch: primarySwatch,
    );
  } else {
    return action.themeData;
  }
}

class UpdateThemeDataAction {
  final ThemeData? themeData;
  UpdateThemeDataAction(this.themeData);
}
