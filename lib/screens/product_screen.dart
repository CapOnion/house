import 'package:flutter/material.dart';
import 'package:flutter_avif/flutter_avif.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key,required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: 'product',
        child: AvifImage.asset(
          imageUrl,
          fit: BoxFit.none,
        ),
      ),
    );
  }
}

