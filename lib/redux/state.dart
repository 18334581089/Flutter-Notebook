import 'package:githubappflutter/models/User.dart';
import './_user.dart';

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
