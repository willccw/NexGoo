import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:NexGoo/core/res/app.dart';
import 'package:NexGoo/core/routes/routes.dart';

import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CatogaryState createState() => _CatogaryState();
}

class _CatogaryState extends State<CategoryScreen> {
  Container _buildGFCard(
      String imageurl, String titlet, String subtitlet, int id) {
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
          onTap: () {
            Navigator.of(context)
                .pushReplacementNamed(Routes.detail, arguments: id);
          },
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
    Object? id = ModalRoute.of(context)!.settings.arguments;

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
            FutureBuilder<QuerySnapshot>(
              future: FirebaseFirestore.instance
                  .collection('Lesson')
                  .where("lesson_category", isEqualTo: int.parse(id.toString()))
                  .get(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      widthFactor: 0.1,
                      heightFactor: 0.1,
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    final List<QueryDocumentSnapshot<Object?>>? documents =
                        snapshot.data?.docs;
                    if (documents != null) {
                      log(documents.length.toString());
                      return ListView(
                        children: [
                          for (var i in documents)
                            _buildGFCard(
                                AppConstants.lakeImage,
                                i["lesson_title"],
                                i["lesson_subtitle"],
                                int.parse(i.id))
                        ],
                      );
                    }
                    // for (var i in lessonList)
                    //   _buildCoolCard(i.title, Icons.local_pizza, i.subtitle);
                  }
                  //   return Center(
                  //       // here only return is missing
                  //       // child: Text(snapshot.data['email']));
                  // }
                } else if (snapshot.hasError) {
                  return Text('no data');
                }
                log("keep loading gprint1");

                return CircularProgressIndicator();
              },
            ),

            // _buildGFCard(
            //     AppConstants.lakeImage,
            //     AppConstants.lakeImage,
            //     "How to make a Pizza?",
            //     "hi",
            //     "I will teach you how to make a pizza in 3 days"),
            // _buildGFCard(
            //     AppConstants.lakeImage,
            //     AppConstants.lakeImage,
            //     "How to make a Pizza?",
            //     "hi",
            //     "I will teach you how to make a pizza in 3 days"),
            // _buildGFCard(
            //     AppConstants.lakeImage,
            //     AppConstants.lakeImage,
            //     "How to make a Pizza?",
            //     "hi",
            //     "I will teach you how to make a pizza in 3 days"),
            // _buildGFCard(
            //     AppConstants.lakeImage,
            //     AppConstants.lakeImage,
            //     "How to make a Pizza?",
            //     "hi",
            //     "I will teach you how to make a pizza in 3 days"),
            // _buildGFCard(
            //     AppConstants.lakeImage,
            //     AppConstants.lakeImage,
            //     "How to make a Pizza?",
            //     "hi",
            //     "I will teach you how to make a pizza in 3 days"),
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
