import 'package:flutter/material.dart';

import '../../utils/products_utils.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int _itemCount = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      setState(
                        () {
                          _itemCount--;
                        },
                      );
                    },
                  ),
                  Text(_itemCount.toString()),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(
                        () {
                          _itemCount++;
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: cartProduct
                      .map(
                        (e) => Container(
                          height: size.height * 0.22,
                          width: size.width * 0.22,
                          margin: const EdgeInsets.only(bottom: 10),
                          alignment: Alignment.center,
                          // child: Text(e['title']),
                          decoration: BoxDecoration(
                            // color: Colors.amber,
                            image: DecorationImage(
                              image: NetworkImage(
                                e['thumbnail'],
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
