import 'package:flutter/material.dart';
import '../../utils/products_utils.dart';
import '../../utils/routes_utils.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double h = size.height;
    double w = size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const CartPage(),
              ),
            );
          },
          child: const Center(
            child: CircleAvatar(
              foregroundImage: NetworkImage(
                "https://img.lovepik.com/element/45001/3052.png_860.png",
              ),
            ),
          ),
        ),
        title: const Text("Home Page"),
        actions: const [
          Icon(Icons.shopping_cart),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.5),
        child: Column(
          children: [
            const SizedBox(
              height: 65,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // top items
            Container(
              height: 200,
              width: 500,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blueGrey,
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://cdn.dummyjson.com/product-images/11/thumbnail.jpg'),
                  fit: BoxFit.fill,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                    offset: Offset(3, 3),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...List.generate(
                      alldata.length,
                      (index) => Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    MyRoutes.detailPage,
                                    arguments: alldata[index]);
                              },
                              child: Container(
                                height: h * 0.2,
                                width: w * 0.4,
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: Colors.grey.shade500,
                                  shape: BoxShape.rectangle,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  alldata[index]['title'],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: h * 0.2,
                              width: w * 0.4,
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: Colors.white70,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    alldata[index]['thumbnail'],
                                  ),
                                  fit: BoxFit.fill,
                                ),
                                shape: BoxShape.rectangle,
                              ),
                              alignment: Alignment.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
