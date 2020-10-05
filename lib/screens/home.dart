import 'package:flutter/material.dart';
import 'package:tarea_edutec/models/perfume_model.dart';
import 'package:tarea_edutec/providers/perfume_provider.dart';
import 'package:tarea_edutec/widgets/card_widget.dart';
import 'package:tarea_edutec/widgets/small_card_widget.dart';

class Home extends StatelessWidget {

  final PerfumeProvider perfumeProvider = PerfumeProvider();

  final darkColor = Color.fromRGBO(33, 37, 52, 1);
  final redColor = Color.fromRGBO(246, 116, 77, 1);
  final greyColor = Color.fromRGBO(249, 245, 245, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
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
            count(),
            bestSellers(),
            allPerfumes()
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
        obscureText: false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 15, bottom: 15),
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
      padding: EdgeInsets.only(left:20, bottom: 10),
      child: Row(
        children: [
          Text(
            '2250',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(width: 15),
          Container(
            height: 30,
            width: 100,
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
                    fontSize: 14
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 18,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget bestSellers() {

    return Container(
      // padding: EdgeInsets.only(left: 10),
      height: 385.0,
      child: FutureBuilder(
        future: perfumeProvider.loadData(),
        builder: (BuildContext context, AsyncSnapshot<Result> snapshot) {

          switch (snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.done:
              return ListView(
                scrollDirection: Axis.horizontal,
                children: snapshot.data.results.map<Widget>( (result) {
                  return Container(
                    child: CardWidget(perfume: result),
                  );
                }).toList(),
              );
              break;

            default:
              return CircularProgressIndicator();
              break;
          }
        },
      ),
    );
  }

  Widget allPerfumes() {
    return Container(
      padding: EdgeInsets.only(
        top: 10,
      ),
      height: 170.0,
      child: FutureBuilder(
        future: perfumeProvider.loadAllPerfumes(),
        builder: (BuildContext context, AsyncSnapshot<Result> snapshot) {
          
          switch (snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.done:
              return ListView(
                scrollDirection: Axis.horizontal,
                children: snapshot.data.results.map<Widget>( (result) {
                  return Container(
                    padding: EdgeInsets.only(
                      left: 20,
                      top: 10,
                      bottom: 10
                    ),
                    child: SmallCardWidget(perfume: result)
                  );
                }).toList()
              );
              break;

            default:
              return CircularProgressIndicator();
              break;
          }
        },
      ),
    );
  }

}