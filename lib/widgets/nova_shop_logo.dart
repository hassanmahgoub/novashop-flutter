import 'package:flutter/material.dart';

class NovaShopLogo extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? backgroundColor;

  const NovaShopLogo({
    super.key,
    this.size = 80,
    this.color,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.deepPurple,
        borderRadius: BorderRadius.circular(size * 0.2),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.deepPurple,
            Colors.deepPurple.shade700,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.3),
            blurRadius: size * 0.1,
            offset: Offset(0, size * 0.05),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Shopping bag icon
          Icon(
            Icons.shopping_bag,
            size: size * 0.5,
            color: color ?? Colors.white,
          ),
          // Star accent
          Positioned(
            top: size * 0.15,
            right: size * 0.15,
            child: Container(
              width: size * 0.15,
              height: size * 0.15,
              decoration: BoxDecoration(
                color: Colors.amber,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.star,
                size: size * 0.1,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
