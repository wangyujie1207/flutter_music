import 'package:flutter_music/httpRequest.dart';
import 'package:flutter_music/redux/actions.dart';
import 'package:flutter_music/redux/appState.dart';
import 'package:redux/redux.dart';

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
