import 'package:flutter/cupertino.dart';

class Logo extends StatelessWidget {
  final double width;
  final double height;

  const Logo({
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            "assets/images/ROPA.png",
            height: height,
            width: width,
          ),
        ],
      ),
    );
  }
}

class HomeLogo extends StatelessWidget {
  final double width;
  final double height;

  const HomeLogo({
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            "assets/images/ropa_home_logo.png",
            height: height,
            width: width,
          ),
        ],
      ),
    );
  }
}
