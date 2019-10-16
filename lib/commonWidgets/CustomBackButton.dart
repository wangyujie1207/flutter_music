import 'package:flutter/material.dart';
import 'package:flutter_music/commonWidgets/CustomIcons.dart';

class CustomBackButton extends StatelessWidget {
  final Color color;
  final Function onTap;

  const CustomBackButton({Key key, this.color, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(CustomIcons.arrow_left),
      color: color,
      onPressed: (){
        Navigator.pop(context);
        if(onTap!=null){
          onTap();
        }
      },
    );
  }
}
