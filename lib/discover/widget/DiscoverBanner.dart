import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_music/commonWidgets/CustomPageView.dart';
import 'package:flutter_music/httpRequest.dart';
import 'package:flutter_music/redux/actions.dart';
import 'package:flutter_music/redux/appState.dart';
import 'package:flutter_music/viewModel/bannerItem.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class DiscoverBanner extends StatefulWidget {
  @override
  _DiscoverBannerState createState() => _DiscoverBannerState();
}

class _DiscoverBannerState extends State<DiscoverBanner> {
  PageController _pageController = PageController(initialPage: 1);
  int _currentIndex = 1;
  Timer _timer;

  //设置定时器
  _setTimer() {
    _timer = Timer.periodic(Duration(seconds: 4), (_) {
      _pageController.animateToPage(
        _currentIndex + 1,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AspectRatio(
          aspectRatio: 2.5,
          child: StoreConnector<AppState, List>(
            distinct: true,
            converter: (Store store) => store.state.banners,
            onInit: (Store store) {
              httpRequest.get('/banner', queryParameters: {'type': 2}).then(
                  (response) {
                List banners = response.data['banners']
                    .map((banner) => BannerItem(pic: banner['pic']))
                    .toList();

                store.dispatch(SetBannerAction(banners));
                _setTimer();
              });
            },
            builder: (BuildContext context, List banner) {
              if (banner.length > 0) {
                List addedBanners = [];
                addedBanners
                  ..add(banner[banner.length - 1])
                  ..addAll(banner)
                  ..add(banner[0]);
                return Stack(
                  children: <Widget>[
                    NotificationListener(
                      // ignore: missing_return
                      onNotification: (ScrollNotification notification) {
                        if (notification.depth == 0 &&
                            notification is ScrollStartNotification) {
                          if (notification.dragDetails != null) {
                            _timer.cancel();
                          }
                        } else if (notification is ScrollEndNotification) {
                          _timer.cancel();
                          _setTimer();
                        }
                      },
                      child: CustomPageView(
                        physics: BouncingScrollPhysics(),
                        controller: _pageController,
                        onPageChanged: (page) {
                          int newIndex;
                          if (page == addedBanners.length - 1) {
                            newIndex = 1;
                            _pageController.jumpToPage(newIndex);
                          } else if (page == 0) {
                            newIndex = addedBanners.length - 2;
                            _pageController.jumpToPage(newIndex);
                          } else {
                            newIndex = page;
                          }
                          setState(() {
                            _currentIndex = newIndex;
                          });
                        },
                        children: addedBanners
                            .map((item) => Container(
                                  margin: EdgeInsets.all(10.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5.0),
                                    child: Image.network(item.pic,
                                        fit: BoxFit.cover),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    Positioned(
                      bottom: 15.0,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: banner
                            .asMap()
                            .map((i, v) => MapEntry(
                                i,
                                Container(
                                  width: 6,
                                  height: 6,
                                  margin: EdgeInsets.only(left: 2, right: 2),
                                  decoration: BoxDecoration(
                                    color: _currentIndex == i + 1
                                        ? Theme.of(context).primaryColor
                                        : Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                )))
                            .values
                            .toList(),
                      ),
                    )
                  ],
                );
              } else {
                return Container();
              }
            },
          )),
    );
  }
}
