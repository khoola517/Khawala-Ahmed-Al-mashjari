import 'package:finallproject/core/constant/colors.dart';
import 'package:flutter/material.dart';

class Custombuttonauth extends StatelessWidget {
  final String text ;
  //final String label;
  final double width;
  final double height;
  final Color color;
  final Color textColor;
  final void Function()? onPressed;

  const Custombuttonauth(
    {super.key, 
    required this.text, 
    this.onPressed,   
    required this.width, 
    required this.height, 
    required this.color, 
    required this.textColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 13),
        onPressed: onPressed,
        color: color,
        textColor: AppColor.backgroundcolor,
        child: Text(text),
      
      ),
    );
  }
}