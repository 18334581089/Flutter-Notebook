import 'package:githubappflutter/models/User.dart';
import 'package:redux/redux.dart';

final UserReducer = combineReducers<User?>([
  TypedReducer<User?, UpdateUserAction>(_updateLoaded),
]);

User _updateLoaded(User? user, action) {
  return action.userInfo;
}

class UpdateUserAction {
  final User? userInfo;
  UpdateUserAction(this.userInfo);
}
