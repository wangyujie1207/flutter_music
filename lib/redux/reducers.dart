import 'package:flutter_music/redux/actions.dart';
import 'package:redux/redux.dart';

// 设置轮播图
final bannerReducer = combineReducers<List>([TypedReducer<List, SetBannerAction>(_setBanner)]);
List _setBanner(List banners, SetBannerAction action){
  banners = action.banners;
  return banners;
}