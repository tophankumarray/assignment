import 'package:flutter/material.dart';

Widget homePageWidget(String image, String name) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Material(
          shadowColor: Colors.orange,
          elevation: 4,
          shape: const CircleBorder(),
          clipBehavior: Clip.hardEdge,
          color: Colors.transparent,
          child: Ink.image(
            image: AssetImage(image),
            fit: BoxFit.cover,
            width: 45,
            height: 40,
            child: InkWell(
              onTap: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewPage()));
              },
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Text(
          name,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}
