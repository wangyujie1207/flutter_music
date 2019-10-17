import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_music/redux/actions.dart';
import 'package:flutter_music/viewModel/songItem.dart';
import 'package:redux/redux.dart';

import 'models.dart';

// 设置轮播图
final bannerReducer =
    combineReducers<List>([TypedReducer<List, SetBannerAction>(_setBanner)]);

List _setBanner(List banners, SetBannerAction action) {
  banners = action.banners;
  return banners;
}

// 设置推荐歌单
final recommendPlaylistReducer = combineReducers<List>(
    [TypedReducer<List, SetRecommendPlaylistAction>(_setRecommendPlaylist)]);

List _setRecommendPlaylist(
    List recommendPlaylist, SetRecommendPlaylistAction action) {
  recommendPlaylist = action.recommendPlaylist;
  return recommendPlaylist;
}

// 设置是否显示新歌
final showNewSongReducer = combineReducers<bool>(
    [TypedReducer<bool, ShowNewSongAction>(_showNewSong)]);

bool _showNewSong(bool showNewSong, ShowNewSongAction action) {
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

//播放列表
final playlistModelReducer = combineReducers<PlaylistModel>([
  TypedReducer<PlaylistModel, SetPlaylistModelAction>(_setPlaylistModel),
]);
//播放列表
PlaylistModel _setPlaylistModel(
    PlaylistModel playlistModel, SetPlaylistModelAction action) {
  playlistModel = action.playlistModel;
  return playlistModel;
}

//设置播放器
final audioPlayerReducer = combineReducers<AudioPlayer>(
    [TypedReducer<AudioPlayer, SetAudioPlayerAction>(_setAudioPlayer)]);

AudioPlayer _setAudioPlayer(
    AudioPlayer audioPlayer, SetAudioPlayerAction action) {
  audioPlayer = action.audioPlayer;
  return audioPlayer;
}

//设置当前索引
final currentIndexReducer = combineReducers<int>(
    [TypedReducer<int, SetCurrentIndexAction>(_setCurrentIndex)]);

int _setCurrentIndex(int index, SetCurrentIndexAction action) {
  index = action.index;
  return index;
}

//设置当前歌曲
final currentSongReducer = combineReducers<SongItem>(
    [TypedReducer<SongItem, SetCurrentSongAction>(_setCurrentSong)]);

SongItem _setCurrentSong(SongItem song, SetCurrentSongAction action) {
  song = action.song;
  return song;
}

//设置当前歌曲url
final currentUrlReducer = combineReducers<URLModel>(
    [TypedReducer<URLModel, SetCurrentUrlAction>(_setCurrentUrl)]);

URLModel _setCurrentUrl(URLModel currentUrl, SetCurrentUrlAction action) {
  currentUrl = action.currentUrl;
  return currentUrl;
}