// 设置轮播图
import 'package:audioplayer/audioplayer.dart';
import 'package:flutter_music/viewModel/songItem.dart';

import 'models.dart';

class SetBannerAction {
  final List banners;

  SetBannerAction(this.banners);
}

// 设置推荐歌单
class SetRecommendPlaylistAction {
  final List recommendPlaylist;

  SetRecommendPlaylistAction(this.recommendPlaylist);
}

// 是否显示新歌
class ShowNewSongAction {
  final bool showNewSong;

  ShowNewSongAction(this.showNewSong);
}

//设置新碟
class SetNewAlbumAction {
  final List newAlbum;

  SetNewAlbumAction(this.newAlbum);
}

//设置新歌
class SetNewSongAction {
  final List newSong;

  SetNewSongAction(this.newSong);
}

//设置播放列表
class SetPlaylistModelAction {
  final PlaylistModel playlistModel;
  final bool isInit;

  SetPlaylistModelAction(this.playlistModel, [this.isInit = false]);
}

//设置播放器
class SetAudioPlayerAction {
  final AudioPlayer audioPlayer;

  SetAudioPlayerAction(this.audioPlayer);
}

//设置当前索引
class SetCurrentIndexAction {
  final int index;
  final bool isInit;

  SetCurrentIndexAction(this.index, [this.isInit = false]);
}

//设置当前歌曲
class SetCurrentSongAction {
  final SongItem song;
  final bool isInit;

  SetCurrentSongAction(this.song, [this.isInit = false]);
}

//当前歌曲url
class SetCurrentUrlAction {
  final URLModel currentUrl;

  SetCurrentUrlAction(this.currentUrl);
}