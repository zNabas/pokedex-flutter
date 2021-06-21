import 'package:flutter/material.dart';

class PokeHeader extends StatelessWidget {
  final String? imageUrl;
  final String? gifUrl;
  final Color? backgroundColor;
  final double radius;
  final double height;

  const PokeHeader({
    Key? key,
    this.imageUrl,
    this.gifUrl,
    this.backgroundColor,
    this.height = 220.0,
    this.radius = 80.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: height,
      color: backgroundColor,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: radius,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(radius),
                  topRight: Radius.circular(radius),
                ),
              ),
            ),
          ),
          Container(
            height: height,
            width: size.width,
            child: Image.network(imageUrl!, fit: BoxFit.fitHeight),
          ),
        ],
      ),
    );
  }
}
