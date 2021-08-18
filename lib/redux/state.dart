import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class AppState {
  User? userInfo;

  State({
    this.userInfo,
  });
}

State AppReducer(State state, action) {
  return State(
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
