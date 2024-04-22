import 'package:flutter/material.dart';

class WelcomeButton extends StatelessWidget {
  final String buttonText;
  final Widget onTap;
  final Color color;
  final Color textColor;

  const WelcomeButton({
    required this.buttonText,
    required this.onTap,
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (e) => onTap!,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: color!,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
          ),
        ),
        child: Text(
          buttonText!,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: textColor!,
          ),
        ),
      ),
    );
  }
}
