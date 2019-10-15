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