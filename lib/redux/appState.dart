import 'package:flutter_music/redux/reducers.dart';

class AppState {
  List banners;

  AppState({this.banners});
}

AppState appReducer(AppState state, action) {
  return AppState(banners: bannerReducer(state.banners, action));
}
