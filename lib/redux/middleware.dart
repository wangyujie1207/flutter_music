import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_music/httpRequest.dart';
import 'package:flutter_music/redux/actions.dart';
import 'package:flutter_music/redux/appState.dart';
import 'package:redux/redux.dart';
import 'dart:async';

import 'models.dart';

//中间件执行是有顺序的
List<Middleware<AppState>> appMiddleware() {
  return [
    TypedMiddleware<AppState, SetPlaylistModelAction>(
        _setPlaylistModelMiddleware),
    TypedMiddleware<AppState, SetCurrentIndexAction>(
        _setCurrentIndexMiddleware),
    TypedMiddleware<AppState, SetCurrentSongAction>(_setCurrentSongMiddleware),
    TypedMiddleware<AppState, SetCurrentUrlAction>(_setCurrentUrlMiddleware),
    TypedMiddleware<AppState, PlayMusicAction>(_playMusicMiddleware),
  ];
}

// 设置播放列表
_setPlaylistModelMiddleware(
    Store store, SetPlaylistModelAction action, NextDispatcher next) {
  next(action);
  store.dispatch(SetCurrentIndexAction(0));
}

// 设置当前索引
_setCurrentIndexMiddleware(
    Store store, SetCurrentIndexAction action, NextDispatcher next) {
  store.dispatch(
      SetCurrentSongAction(store.state.playlistModel.songList[action.index]));
  next(action);
}

// 设置当前歌曲
_setCurrentSongMiddleware(
    Store store, SetCurrentSongAction action, NextDispatcher next) {
  //获取歌曲链接
  httpRequest.get('/song/url', queryParameters: {'id': action.song.id}).then(
      (response) {
        print(response);
    URLModel urlModel = URLModel.fromJson(response.data['data'][0]);
    store.dispatch(SetCurrentUrlAction(urlModel));
  });
  next(action);
}

// 设置当前歌曲url
_setCurrentUrlMiddleware(
    Store store, SetCurrentUrlAction action, NextDispatcher next) {
  next(action);
}

// 播放音乐
_playMusicMiddleware(Store store, PlayMusicAction action, NextDispatcher next) async{
  AppState state = store.state;
  print(state.currentUrl.url);
  if (state.currentUrl != null) {
    print(state.audioPlayer.state);
    if(state.audioPlayer.state != AudioPlayerState.PLAYING){
      print(1111);
      int result = await state.audioPlayer.play("http://m10.music.126.net/20191018104542/3b7462e9e50416059a5de8b8c74f69a8/ymusic/5fae/517c/8888/3859de1813d8fcc4205c8432cc0fbb59.mp3");
      if (result == 1) {
        // success
        print(222);
      }

    }else{
      state.audioPlayer.pause();
    }
  } else {
    store.dispatch(SetCurrentIndexAction(state.currentIndex));
  }
  next(action);
}
