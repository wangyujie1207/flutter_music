import 'package:flutter_music/redux/reducers.dart';

class AppState {
  List banners; //轮播图
  List recommendPlaylist; //推荐歌单

  AppState({this.banners, this.recommendPlaylist});
}

AppState appReducer(AppState state, action) {
  return AppState(
    banners: bannerReducer(state.banners, action),
    recommendPlaylist:
        recommendPlaylistReducer(state.recommendPlaylist, action),
  );
}
