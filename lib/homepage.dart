import 'package:flutter/material.dart';
import 'package:flutter_application_8/ApiSErvices/ApiService.dart';
import 'package:flutter_application_8/Widget/homewidget.dart';
import 'package:flutter_application_8/cartpage.dart';
import 'package:flutter_application_8/detailspage.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Model/CatagoryItemModel.dart';

class HomePage extends StatefulWidget {
  //! Passing Data Variables
  static String? itemImage;
  static String? itemName;
  static double? price;
  static List<CatagoryItemModel>? iItemList = [];

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//! Initialize variables
  List<dynamic>? catagotyList;
  List<CatagoryItemModel>? catagoryItemList = [];
  String defaultItemImage = "https://www.justgotochef.com/uploads/1541847746-Nutty%20Gritties-Dry%20Fruits%20Blend-Front.jpg";
  String itemName = "-";
  double? itemPrice = 0.0;
  int itemIndex = 0;

  getData() async {
    catagotyList = await APIService().getCatagory();
    await Future.delayed(Duration(microseconds: 300), () {
      APIService().getCatagoryItem(catagotyList![0]);
    });
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: const Icon(Icons.menu),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CartPage(),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: const Icon(Icons.card_giftcard),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: const Text(
              "Hi,Helen",
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: const Text(
                  "What's today's taste?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Container(
                child: const Icon(
                  Icons.emoji_emotions,
                  color: Colors.orangeAccent,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 80,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                catagotyList == null
                    ? const Text("No Catagory Found")
                    : Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          itemCount: catagotyList!.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                InkWell(
                                  onTap: () async {
                                    catagoryItemList = await APIService()
                                        .getCatagoryItem(catagotyList![index]);
                                    setState(() {});
                                  },
                                  child: homePageWidget(
                                      'images/fr.png', catagotyList![index]),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                Container(
                  width: 80,
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.search,
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 45,
          ),
          InkWell(
            onTap: () {
              HomePage.itemImage = defaultItemImage;
              HomePage.itemName = itemName;
              HomePage.price = itemPrice;

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const DetailsPage(),
                ),
              );
            },
            child: Container(
              child: Stack(
                children: [
                  Center(
                    child: ClipOval(
                      child: Container(
                        color: Colors.orange,
                        height: 300,
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipOval(
                              child: Container(
                                // margin: EdgeInsets.symmetric(vertical: 100),

                                child: defaultItemImage != ""
                                    ? Image.network(
                                        defaultItemImage,
                                        width: 150,
                                        height: 150,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.network(
                                        defaultItemImage,
                                        width: 150,
                                        fit: BoxFit.cover,
                                        height: 150,
                                      ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 100,
                                  child: Text(
                                    itemName,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Text(
                                          "\$ ${itemPrice.toString()}",
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.star_border_outlined,
                                      color: Colors.white,
                                    ),
                                    Icon(
                                      Icons.star_border_outlined,
                                      color: Colors.white,
                                    ),
                                    Icon(
                                      Icons.star_border_outlined,
                                      color: Colors.white,
                                    ),
                                    Icon(
                                      Icons.star_border_outlined,
                                      color: Colors.white,
                                    ),
                                    Icon(
                                      Icons.star_border_outlined,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  height: 40,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      HomePage.iItemList!
                                          .add(catagoryItemList![itemIndex]);
                                      Future.delayed(
                                          Duration(microseconds: 200), () {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text("Item added to Cart"),
                                          ),
                                        );
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        primary: Colors.white),
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.card_travel_outlined,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Text(
                                          "Add to cart",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: 60,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                catagoryItemList == null
                    ? const Text("No Item Found")
                    : Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          itemCount: catagoryItemList!.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                defaultItemImage =
                                    catagoryItemList![index].image;
                                itemName = catagoryItemList![index].title;
                                itemPrice = catagoryItemList![index].price;
                                itemIndex = index;
                                setState(() {});
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: ClipOval(
                                  child: Container(
                                    color: Colors.white,
                                    height: 60,
                                    width: 60,
                                    child: Center(
                                      child: Image.network(
                                        catagoryItemList![index].image,
                                        height: 40,
                                        width: 40,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                Container(
                  width: 50,
                  height: 50,
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.grey,
                    ),
                  ),
                  decoration: const ShapeDecoration(
                    color: Colors.white,
                    shape: CircleBorder(
                      side: BorderSide(
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
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
