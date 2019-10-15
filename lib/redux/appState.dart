import 'package:flutter_music/redux/reducers.dart';

class AppState {
  List banners; //轮播图
  List recommendPlaylist; //推荐歌单
  List newAlbum; //新碟
  List newSong; //新歌
  bool showNewSong; // 是否显示新歌
  AppState(
      {this.banners,
      this.recommendPlaylist,
      this.showNewSong,
      this.newAlbum,
      this.newSong});
}

AppState appReducer(AppState state, action) {
  return AppState(
    banners: bannerReducer(state.banners, action),
    recommendPlaylist:
        recommendPlaylistReducer(state.recommendPlaylist, action),
    showNewSong: showNewSongReducer(state.showNewSong, action),
    newAlbum: newAlbumReducer(state.newAlbum, action),
    newSong: newSongReducer(state.newSong, action),
  );
}
