import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_music/redux/reducers.dart';
import 'package:flutter_music/viewModel/songItem.dart';
import 'models.dart';

class AppState {
  List banners; //轮播图
  List recommendPlaylist; //推荐歌单
  List newAlbum; //新碟
  List newSong; //新歌
  bool showNewSong; // 是否显示新歌
  PlaylistModel playlistModel; // 播放列表
  AudioPlayer audioPlayer; //音乐播放器
  int currentIndex; //当前歌曲索引
  SongItem currentSong; //当前歌曲
  URLModel currentUrl; //当前歌曲url

  AppState(
      {this.banners,
      this.recommendPlaylist,
      this.showNewSong,
      this.newAlbum,
      this.newSong,
      this.playlistModel,
      this.audioPlayer,
      this.currentIndex,
      this.currentSong,
      this.currentUrl});
}

AppState appReducer(AppState state, action) {
  return AppState(
    banners: bannerReducer(state.banners, action),
    recommendPlaylist:
        recommendPlaylistReducer(state.recommendPlaylist, action),
    showNewSong: showNewSongReducer(state.showNewSong, action),
    newAlbum: newAlbumReducer(state.newAlbum, action),
    newSong: newSongReducer(state.newSong, action),
    playlistModel: playlistModelReducer(state.playlistModel, action),
    audioPlayer: audioPlayerReducer(state.audioPlayer, action),
    currentIndex: currentIndexReducer(state.currentIndex, action),
    currentSong: currentSongReducer(state.currentSong, action),
    currentUrl: currentUrlReducer(state.currentUrl, action),
  );
}
