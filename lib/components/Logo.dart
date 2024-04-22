import 'package:flutter/cupertino.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/ROPA.png",
          height: 500,
          width: 500,
        ),
      ],
    );
  }
}
