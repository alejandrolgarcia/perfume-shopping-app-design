import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  // const Home({Key key}) : super(key: key);

  final darkColor = Color.fromRGBO(33, 37, 52, 1);
  final redColor = Color.fromRGBO(246, 116, 77, 1);
  final greyColor = Color.fromRGBO(249, 245, 245, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        bottomOpacity: 0.0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: darkColor,
          onPressed: (){},
        ),
        centerTitle: false,
        title: Text(
          'Explore',
          style: TextStyle(
            color: darkColor
          ),
        ),
        actions: [
          myCart()
        ],
      ),

      body: Container(
        

      ),

    );
  }

  Container myCart() {
    return Container(
      width: 110,
      margin: EdgeInsets.only(
        right: 20,
        bottom: 10, 
        top: 10
      ),
      decoration: BoxDecoration(
        color: greyColor,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            color: redColor,
            onPressed: (){}
          ),
          Text(
            'My Cart',
            style: TextStyle(color: redColor),
          )
        ],
      ),
    );
  }
}