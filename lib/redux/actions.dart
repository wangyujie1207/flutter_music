// 设置轮播图
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