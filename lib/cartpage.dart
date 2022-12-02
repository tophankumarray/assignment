import 'package:flutter/material.dart';
import 'package:flutter_application_8/homepage.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            height: 200,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text(
                    "Quantity(300g)",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      // color: Colors.red,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height: 30,
                      width: 150,
                      alignment: Alignment.center,
                      // color: Colors.black,
                      decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_left_rounded,
                              color: Colors.black,
                            ),
                          ),
                          const Text(
                            "1",
                            style: TextStyle(color: Colors.black),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_right_rounded,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 150,
                    ),
                    Container(
                      child: const Text(
                        "\$ 9.43",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height: 40,
                      width: 240,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          primary: Colors.orange[200],
                        ),
                        child: const Center(
                          child: Text(
                            "Add to cart",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    Container(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_border),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 567.5,
            color: Colors.black,
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 10),
                        child: const Icon(
                          Icons.card_travel,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        child: const Text(
                          "Cart",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                HomePage.iItemList!.isEmpty
                    ? Container(
                        height: 450,
                        alignment: Alignment.center,
                        child: Text(
                          "No item here",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ))
                    : Container(
                        height: 450,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          itemCount: HomePage.iItemList!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 100,
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ClipOval(
                                      child: Container(
                                        width: 80,
                                        color: Colors.transparent,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Image.network(
                                            HomePage.iItemList![index].image
                                                .toString(),
                                            height: 70,
                                            width: 70,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            HomePage.iItemList![index].title,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 05,
                                          ),
                                          Text(
                                            "₹ ${HomePage.iItemList![index].price}",
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 40,
                                      alignment: Alignment.center,
                                      child: const Text(
                                        "x1",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  // height: 50,
                  // color: Colors.green,
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          HomePage.iItemList!.length.toString() + "  items",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
