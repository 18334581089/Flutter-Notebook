import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class AppState {
  User? userInfo;

  AppState({
    this.userInfo,
  });
}

AppState AppReducer(AppState state, action) {
  return AppState(
    userInfo: UserReducer(state.userInfo, action),
  );
}

class User {}

final UserReducer = combineReducers<User?>([
  TypedReducer<User?, UpdateUserAction>(_updateLoaded),
]);

User? _updateLoaded(User? user, action) {
  user = action.userInfo;
  return user;
}

class UpdateUserAction {
  final User? userInfo;

  UpdateUserAction(this.userInfo);
}
