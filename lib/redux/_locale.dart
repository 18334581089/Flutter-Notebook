import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class Locale {}

final LocaleReducer = combineReducers<Locale?>([
  TypedReducer<Locale, UpdateLocaleAction>(_updateLoaded),
]);

Locale _updateLoaded(Locale? _data, action) {
  if (action.locale == null) {
    return Locale();
  } else {
    return action.locale;
  }
}

class UpdateLocaleAction {
  final Locale? locale;
  UpdateLocaleAction(this.locale);
}
