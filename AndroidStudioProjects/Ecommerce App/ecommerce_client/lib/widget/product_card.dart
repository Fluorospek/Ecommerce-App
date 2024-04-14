import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String imageURL;
  final double price;
  final String offer;
  final Function onTap;
  const ProductCard(
      {super.key,
      required this.name,
      required this.imageURL,
      required this.price,
      required this.offer,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                imageURL,
                fit: BoxFit.cover,
                width: double.maxFinite,
                height: 120,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                name,
                style: TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Rs: $price',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '$offer% off',
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
