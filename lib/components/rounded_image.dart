import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key,
    this.imageProvider,
    this.imageRadius = 20,
  });

  final double imageRadius;
  final ImageProvider? imageProvider;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: imageRadius,
      child: CircleAvatar(
        radius: imageRadius - 5,
        backgroundImage: imageProvider,
      ),
    );
  }
}
