import 'package:flutter_music/redux/actions.dart';
import 'package:redux/redux.dart';

// 设置轮播图
final bannerReducer = combineReducers<List>([TypedReducer<List, SetBannerAction>(_setBanner)]);
List _setBanner(List banners, SetBannerAction action){
  banners = action.banners;
  return banners;
}

// 设置推荐歌单
final recommendPlaylistReducer = combineReducers<List>([TypedReducer<List,SetRecommendPlaylistAction>(_setRecommendPlaylist)]);
List _setRecommendPlaylist(List recommendPlaylist, SetRecommendPlaylistAction action){
  recommendPlaylist = action.recommendPlaylist;
  return recommendPlaylist;
}

// 设置是否显示新歌
final showNewSongReducer = combineReducers<bool>([TypedReducer<bool, ShowNewSongAction>(_showNewSong)]);
bool _showNewSong(bool showNewSong, ShowNewSongAction action){
  showNewSong = action.showNewSong;
  return showNewSong;
}

// 设置新碟
final newAlbumReducer = combineReducers<List>(
    [TypedReducer<List, SetNewAlbumAction>(_setNewAlbum)]);

List _setNewAlbum(List newAlbum, SetNewAlbumAction action) {
  newAlbum = action.newAlbum;
  return newAlbum;
}

//设置新歌
final newSongReducer =
combineReducers<List>([TypedReducer<List, SetNewSongAction>(_setNewSong)]);

List _setNewSong(List newSong, SetNewSongAction action) {
  newSong = action.newSong;
  return newSong;
}