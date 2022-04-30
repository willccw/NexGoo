import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:NexGoo/core/res/app.dart';
import 'package:NexGoo/core/routes/routes.dart';

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
    Object? s = ModalRoute.of(context)!.settings.arguments;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.account_circle_rounded),
        title: Text("Food"),
        actions: [
          // Container(
          //   width: 30,
          //   child: Image.asset(
          //     'images/lake.jpeg',
          //   ),
          // ),
          Icon(Icons.more_vert),
        ],
      ),
      //   body:Container(
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Text("Top"),
      //           Expanded(
      //             child: Row(
      //               children: [
      //                 Expanded(
      //                   child: GridView.builder(
      //                     scrollDirection: Axis.horizontal,
      //                     itemCount: 10,
      //                     gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
      //                         crossAxisCount: 2),
      //                     itemBuilder: (BuildContext context, int index) {
      //                       return Text(index.toString());
      //                     },
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ),
      //           Text("Trending"),
      //           Expanded(
      //             child: Row(
      //               children: [
      //                 Expanded(
      //                   child: GridView.builder(
      //                     scrollDirection: Axis.horizontal,
      //                     itemCount: 10,
      //                     gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
      //                         crossAxisCount: 2),
      //                     itemBuilder: (BuildContext context, int index) {
      //                       return Text(index.toString());
      //                     },
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ),
      //         ],
      //       )),
      // );

      body: SafeArea(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(0),
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          crossAxisCount: 2,
          childAspectRatio: (0.273 / .40),
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
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: RaisedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, Routes.home);
          },
          color: Colors.blue,
          textColor: Colors.white,
          child: Text('Back'),
        ),
      ),
    );
  }
}
