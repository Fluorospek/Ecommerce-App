import 'package:ecommerce_client/pages/product_details_page.dart';
import 'package:ecommerce_client/widget/dropdown_btn.dart';
import 'package:ecommerce_client/widget/multi_select_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Footwear Store',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Chip(label: Text('Category')),
                  );
                }),
          ),
          Row(
            children: [
              Flexible(
                child: DropdownBtn(
                  items: ['Rs: Low to High', 'Rs: High to Low'],
                  selectedItemText: 'Sort',
                  onSelected: (selectedOptn) {},
                ),
              ),
              Flexible(
                child: MultiSelectDropdownbtn(
                  items: ['item1', 'item2'],
                  onSelectionChanged: (selectedItems) {},
                ),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ProductCard(
                    name: 'Puma',
                    imageURL:
                        'https://lh3.googleusercontent.com/proxy/Pe7zLhtWGOrB4pSvq41idbBS-mvnP8cVvA0h52-IVVV4mNnIIGLSrAuNd5IWJD2Q7gq_HhTnaekfrv45GuJQJxRRaLUFzUUKX1JKy65fYUe6xjE_NngnfPdBzLFhuGYkuAGfag',
                    price: 100,
                    offer: '12',
                    onTap: () {
                      Get.to(() => ProductDetailPage());
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
