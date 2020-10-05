import 'package:flutter/material.dart';
import 'package:tarea_edutec/models/perfume_model.dart';
import 'package:tarea_edutec/widgets/favorite_icon.dart';

class PerfumeDetail extends StatelessWidget {
  const PerfumeDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Perfume perfume = ModalRoute.of(context).settings.arguments;
    final redColor = Color.fromRGBO(246, 116, 77, 1);

    return Scaffold(
      body: Container(

        child: Stack(
          children: [
            imagen(perfume),
            boton(context),
            detail(perfume, redColor)
          ],
        )
      )
    );
  }

  Widget imagen(Perfume perfume) {
    return Hero(
      tag: perfume.id,
      child: ClipRRect(
        child: FadeInImage(
          placeholder: AssetImage('assets/images/no-image.jpg'), 
          image: AssetImage(perfume.imgPath),
          height: 550,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget boton(BuildContext context) {
    return Container(
      width: 40,
      height: 30,
      margin: EdgeInsets.only(
        top: 60,
        left: 20
      ),
      decoration: BoxDecoration(
        color: Color.fromRGBO(249, 245, 245, 1),
        borderRadius: BorderRadius.circular(10)
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(Icons.keyboard_arrow_left),
        onPressed: () => Navigator.pop(context)
      ),
    );
  }

  Widget detail(Perfume perfume, Color redColor) {
    return Positioned(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Container(
          height: 380,
          padding: EdgeInsets.only(
            top: 35,
            left: 20,
            right: 20
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30)
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 5,
                offset: Offset(0, 3)
              )
            ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                perfume.name,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                perfume.desc,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Icon(Icons.star, color: redColor),
                  Icon(Icons.star, color: redColor),
                  Icon(Icons.star, color: redColor),
                  Icon(Icons.star, color: redColor),
                  Icon(Icons.star_half, color: redColor)
                ]
              ),
              SizedBox(height: 20),
              Text(
                '\$ ${perfume.price.toString()}',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                      color: redColor,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Text(
                        'ADD TO CART',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    height: 70,
                    child: FavoriteIcon(sizeIcon: 50)
                  ),
                ],
              )
            ]
          ),
        ),
      )
    );
  }
}