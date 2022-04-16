import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:NexGoo/core/res/app.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CatogaryState createState() => _CatogaryState();
}

class _CatogaryState extends State<CategoryScreen> {
  Container _buildGFCard(String imageurl, String iconImage, String titlet,
      String subtitlet, String contentt) {
    return Container(
      child: GFCard(
        padding: const EdgeInsets.all(0),
        boxFit: BoxFit.cover,
        titlePosition: GFPosition.start,
        image: Image.asset(
          imageurl,
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        showImage: true,
        title: GFListTile(
          // avatar: GFAvatar(
          //   backgroundImage: AssetImage(iconImage),
          // ),
          titleText: titlet,
          subTitleText: subtitlet,
        ),
        // content: Text(contentt),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
          child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(0),
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        crossAxisCount: 2,
        childAspectRatio: (0.26 / .405),
        children: <Widget>[
          _buildGFCard(
              AppConstants.lakeImage,
              AppConstants.lakeImage,
              "How to make a Pizza?",
              "hi",
              "I will teach you how to make a pizza in 3 days"),
          _buildGFCard(
              AppConstants.lakeImage,
              AppConstants.lakeImage,
              "How to make a Pizza?",
              "hi",
              "I will teach you how to make a pizza in 3 days"),
          _buildGFCard(
              AppConstants.lakeImage,
              AppConstants.lakeImage,
              "How to make a Pizza?",
              "hi",
              "I will teach you how to make a pizza in 3 days"),
          _buildGFCard(
              AppConstants.lakeImage,
              AppConstants.lakeImage,
              "How to make a Pizza?",
              "hi",
              "I will teach you how to make a pizza in 3 days"),
          _buildGFCard(
              AppConstants.lakeImage,
              AppConstants.lakeImage,
              "How to make a Pizza?",
              "hi",
              "I will teach you how to make a pizza in 3 days"),

          // Container(
          //   padding: const EdgeInsets.all(8),
          //   child: const Text("He'd have you all unravel at the"),
          //   color: Colors.teal[100],
          // ),
          // Container(
          //   padding: const EdgeInsets.all(8),
          //   child: const Text('Heed not the rabble'),
          //   color: Colors.teal[200],
          // ),
          // Container(
          //   padding: const EdgeInsets.all(8),
          //   child: const Text('Sound of screams but the'),
          //   color: Colors.teal[300],
          // ),
          // Container(
          //   padding: const EdgeInsets.all(8),
          //   child: const Text('Who scream'),
          //   color: Colors.teal[400],
          // ),
          // Container(
          //   padding: const EdgeInsets.all(8),
          //   child: const Text('Revolution is coming...'),
          //   color: Colors.teal[500],
          // ),
          // Container(
          //   padding: const EdgeInsets.all(8),
          //   child: const Text('Revolution, they...'),
          //   color: Colors.teal[600],
          // ),
        ],
      )),
    );
  }
}
