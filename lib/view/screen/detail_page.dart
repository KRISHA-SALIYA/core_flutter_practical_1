import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../utils/products_utils.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  get cartProduct => null;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    Map<String, dynamic> product =
        (ModalRoute.of(context)?.settings.arguments ?? alldata[0])
            as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Page"),
      ),
      body: Column(
        children: [
          //ThumbNailView
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                product['images'].length,
                (index) => Container(
                  height: size.height * 0.3,
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                      image: NetworkImage(product['images'][index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  margin: const EdgeInsets.all(
                    10,
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          //DetailsCard
          Container(
            height: size.height * 0.5,
            width: size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 6,
                  spreadRadius: 3,
                  offset: Offset(0, -2),
                ),
              ],
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(40),
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['title'],
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  product["category"],
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                RatingBarIndicator(
                  rating: double.parse(
                    product['rating'].toString(),
                  ),
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                ),
                Text("\$ ${product['price'].toString()}/-",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          late SnackBar snackBar;
          // if (cartItems.contains(product))
          if (cartProduct.contains(product)) {
            cartProduct.remove(product);
            snackBar = SnackBar(
              content: Text("${product['title']} removed from the CART !!"),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
            );
          } else {
            cartProduct.add(product);
            snackBar = SnackBar(
              content: Text("${product['title']} added to the CART !!"),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
            );
          }

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        icon: const Icon(Icons.shopping_cart),
        label: const Text("Add to cart"),
      ),
    );
  }
}
