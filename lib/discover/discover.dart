import 'package:flutter/material.dart';
import 'package:flutter_music/commonWidgets/CustomIcons.dart';
import 'package:flutter_music/discover/widget/DiscoverBanner.dart';

class Discover extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CustomIcons.microPhone),
          onPressed: () {},
        ),
        title: Text('发现'),
        centerTitle: true,
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          DiscoverBanner()
        ],
      ),
    );
  }
}
