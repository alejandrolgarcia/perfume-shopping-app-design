import 'package:flutter/material.dart';
import 'package:tarea_edutec/models/perfume_model.dart';
import 'package:tarea_edutec/widgets/favorite_icon.dart';


class CardWidget extends StatelessWidget {

  final Perfume perfume;

  CardWidget({ @required this.perfume });

  final darkColor = Color.fromRGBO(33, 37, 52, 1);
  final redColor = Color.fromRGBO(246, 116, 77, 1);
  final greyColor = Color.fromRGBO(249, 245, 245, 1);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      child: Container(
        padding: EdgeInsets.only(
          top: 10,
          left: 20,
        ),
        child: Column(
          children: [
            Container(
              width: 200,
              height: 200,
              child: Hero(
                tag: perfume.id,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)
                  ),
                  child: FadeInImage(
                    placeholder: AssetImage('assets/images/no-image.jpg'),
                    image: AssetImage(perfume.imgPath),
                    fit: BoxFit.cover,
                    ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 10,
                left: 10
              ),
              width: 200,
              height: 170,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 1)         
                  )
                ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    perfume.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    perfume.desc,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.star, color: redColor, size: 18),
                      Icon(Icons.star, color: redColor, size: 18),
                      Icon(Icons.star, color: redColor, size: 18),
                      Icon(Icons.star, color: redColor, size: 18),
                      Icon(Icons.star_half, color: redColor, size: 18),
                    ]
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$ ${perfume.price.toString()}',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      FavoriteIcon(sizeIcon: 20),
                    ],
                  )
                ]
              ),
            )
          ],
        ),
      ),

      onTap: (){
        Navigator.pushNamed(context, 'detail', arguments: perfume);
      },
    );
  }
}