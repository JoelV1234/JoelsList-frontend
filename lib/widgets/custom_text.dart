import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight weight;
  const CustomText({ Key? key,
    required this.text,
    this.fontSize = 16,
    this.weight = FontWeight.normal
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Text(
      text,
      style: TextStyle(
        fontSize : fontSize,
        fontWeight: weight
      )
    );
  }
}