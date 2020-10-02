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

        child: Column(
          children: [

            search(),
            count()

          ],
        ),

      ),

    );
  }

  Widget myCart() {
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

  Widget search() {
    return Container(
      decoration: BoxDecoration(),
      padding: EdgeInsets.all(20),
      child: TextField(
        style: TextStyle(fontSize: 20),
        obscureText: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 20, bottom: 20),
          filled: true,
          fillColor: greyColor,
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: redColor,
          ),
          hintText: 'Search Perfume',
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: greyColor),
            borderRadius: BorderRadius.circular(15)
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: greyColor),
            borderRadius: BorderRadius.circular(15)
          )
        ),
      ),
    );
  }

  Widget count() {
    return Container(
      padding: EdgeInsets.only(left:20, top: 10, bottom: 10),
      child: Row(
        children: [
          Text(
            '2250',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(width: 15),
          Container(
            height: 35,
            width: 110,
            decoration: BoxDecoration(
              color: redColor,
              borderRadius: BorderRadius.circular(20)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'SEE ALL',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}