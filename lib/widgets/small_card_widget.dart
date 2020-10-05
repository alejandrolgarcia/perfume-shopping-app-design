import 'package:flutter/material.dart';
import 'package:tarea_edutec/models/perfume_model.dart';

class SmallCardWidget extends StatelessWidget {
  
  final Perfume perfume;

  SmallCardWidget({ @required this.perfume });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 100,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3) 
            )
          ]
        ),
        child: Hero(
          tag: perfume.id,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/images/no-image.jpg'),
              image: AssetImage(perfume.imgPath),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, 'detail', arguments: perfume);
      },
    );
  }
}