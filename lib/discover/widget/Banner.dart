import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_music/httpRequest.dart';
import 'package:flutter_music/viewModel/bannerItem.dart';

class DiscoverBanner extends StatefulWidget {
  @override
  _DiscoverBannerState createState() => _DiscoverBannerState();
}

class _DiscoverBannerState extends State<DiscoverBanner> {
  PageController _pageController = PageController(initialPage: 1);
  int _currentIndex = 1;
  Timer _timer;
  List _banners = [];

  @override
  void initState() {
    httpRequest.get('/banner', queryParameters: {'type': 2}).then((response) {
      print(response);
      List banners = response.data['banners']
          .map((banner) => BannerItem(pic: banner['pic']))
          .toList();

      setState(() {
        _banners = banners;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(_banners.length > 0){
      List addedBanners = [];
      addedBanners
        ..add(_banners[_banners.length-1])
        ..addAll(_banners)
        ..add(_banners[0]);
      return SliverToBoxAdapter(
        child: AspectRatio(
          aspectRatio: 2.5,
          child: Stack(
            children: <Widget>[
              PageView(
                physics: BouncingScrollPhysics(),
                controller: _pageController,
                onPageChanged: (page) {},
                children: _banners
                    .map((item) => Container(
                  margin: EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.network(item.pic, fit: BoxFit.cover),
                  ),
                ))
                    .toList(),
              )
            ],
          ),
        ),
      );
    }else{
      return SliverToBoxAdapter(
        child: AspectRatio(
          aspectRatio: 2.5,
          child: Text('123')
        ),
      );
    }

  }
}
