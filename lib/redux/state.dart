import 'package:flutter/material.dart';
import 'package:githubappflutter/models/User.dart';
import './_user.dart';
import './_themeData.dart';
import './_locale.dart';

class AppState {
  User? userInfo;
  ThemeData? themeData;
  Locale? locale;

  AppState({
    this.userInfo,
    this.themeData,
    this.locale,
  });
}

// ignore: non_constant_identifier_names
AppState AppReducer(AppState state, action) {
  return AppState(
    userInfo: UserReducer(state.userInfo, action),
    themeData: ThemeDataReducer(state.themeData, action) as ThemeData,
    locale: LocaleReducer(state.locale, action) as Locale,
  );
}
