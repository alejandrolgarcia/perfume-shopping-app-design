import 'package:flutter/material.dart';

class FavoriteIcon extends StatefulWidget {
  @override
  _FavoriteIconState createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {

  Color _favIconColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return IconButton(
       icon: Icon(
         Icons.favorite,
         color: _favIconColor,
        ),
       onPressed: (){
         setState(() {
           if(_favIconColor == Colors.black) {
             _favIconColor = Colors.red;
           } else {
             _favIconColor = Colors.black;
           }
         });
       },
    );
  }
}