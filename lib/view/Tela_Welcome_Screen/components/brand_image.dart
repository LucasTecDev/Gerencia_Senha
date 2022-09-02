import 'package:flutter/material.dart';

class BrandImageWidget extends StatelessWidget {
  final double width;
  final double height;

  const BrandImageWidget({this.width: 80, this.height: 50});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
      'assets/images/brand/brand.png',
      width: width,
      height: height,
      fit: BoxFit.fitWidth,
      ),
    );
    
    
  }
}