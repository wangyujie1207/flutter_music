import 'package:flutter/material.dart';
import 'package:flutter_music/utils/handleCount.dart';

class SubscriberList extends StatelessWidget {
  final List subscribers;
  final num subscriberCount;

  SubscriberList({this.subscribers, this.subscriberCount});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: GestureDetector(
          child: Container(
            padding: EdgeInsets.all(10.0),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                    child: Row(
                      children: subscribers
                          .map((item) => Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: CircleAvatar(
                          radius: 12.0,
                          backgroundImage: NetworkImage(item.avatarUrl),
                        ),
                      ))
                          .toList(),
                    )),
                Text('${calculateCount(subscriberCount)}人收藏 >',
                    style: TextStyle(color: Colors.grey, fontSize: 12.0))
              ],
            ),
          ),
          onTap: () {},
        ));
  }
}
