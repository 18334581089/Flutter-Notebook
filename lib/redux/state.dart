import 'package:flutter/material.dart';
import 'package:githubappflutter/models/User.dart';
import './_user.dart';
import './_themeData.dart';

class AppState {
  User? userInfo;
  ThemeData themeData;

  AppState({
    this.userInfo,
    required this.themeData,
  });
}

// ignore: non_constant_identifier_names
AppState AppReducer(AppState state, action) {
  return AppState(
    userInfo: UserReducer(state.userInfo, action),
    themeData: ThemeDataReducer(state.themeData, action) as ThemeData,
  );
}
