import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class State {
  User? userInfo;

  State({
    this.userInfo,
  });
}

///通过 Reducer 创建 用于store 的 Reducer
State appReducer(State state, action) {
  return State(
    ///通过 UserReducer 将 State 内的 userInfo 和 action 关联在一起
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
