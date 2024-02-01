import 'package:flutter/material.dart';

class SongImage extends StatelessWidget {
  final String image;
  const SongImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height:400,
      //height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        image:  DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(image,),
           alignment: Alignment.topCenter,
          )
      ),
      
    );
  }
}
