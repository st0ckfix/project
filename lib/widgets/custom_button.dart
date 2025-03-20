import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color foregroundColor;
  final VoidCallback onPressed;
  final Widget? icon;
  final double fontSize;
  final FontWeight fontWeight;

  const CustomButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.onPressed,
    this.icon,
    this.fontSize = 22,
    this.fontWeight = FontWeight.w700,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: icon ?? Container(),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(290, 63),
        shadowColor: Colors.transparent,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        shape: StadiumBorder(
          side: BorderSide(
            color: foregroundColor,
            width: 3,
          ),
        ),
      ),
      onPressed: onPressed,
      label: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontFamily: 'Bai Jamjuree',
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
