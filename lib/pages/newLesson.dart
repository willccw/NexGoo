import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:NexGoo/core/routes/routes.dart';
import 'dart:developer';

class NewLessonScreen extends StatefulWidget {
  const NewLessonScreen({Key? key}) : super(key: key);

  @override
  _NewLessonState createState() => _NewLessonState();
}

class _NewLessonState extends State<NewLessonScreen> {
  String title = "";
  String subtitle = "";
  String description = "";
  String whatsapp = "";
  // var id = 9;

  String dropdownvalue = 'Travel';
  var categorylist = ["Travel", "Cook", "Learning", "Sport"];
  CollectionReference newlesson =
      FirebaseFirestore.instance.collection("Lesson");
  // var newLessonSize = FirebaseFirestore.instance.collection("Lesson").get();
  Future<void> addNewLesson() {
    return newlesson
        // .doc(newLessonSize.toString())
        .add({
          "lesson_category": categorylist.indexOf(dropdownvalue),
          "lesson_description": description,
          "lesson_owner": 0,
          "lesson_rating": 0,
          "lesson_subtitle": subtitle,
          "lesson_title": title,
          "lesson_viewCount": 0,
          "lesson_whatsapp": int.parse(whatsapp),
        })
        .then((value) => {
              print("new lesson created"),
              Navigator.pushReplacementNamed(context, Routes.home)
            })
        .catchError((error) => print("error"));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.account_circle_rounded),
        title: Text("Nexgoo"),
        actions: const [
          // Container(
          //   width: 30,
          //   child: Image.asset(
          //     'images/lake.jpeg',
          //   ),
          // ),
          Icon(Icons.more_vert),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.home);
              },
            ),
            TextFormField(
              initialValue: title,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Title',
              ),
              onChanged: (String? newValue) {
                setState(() {
                  title = newValue!;
                });
              },
            ),
            TextFormField(
              initialValue: subtitle,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Subtitle',
              ),
              onChanged: (String? newValue) {
                setState(() {
                  subtitle = newValue!;
                });
              },
            ),
            TextFormField(
              initialValue: description,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Description',
              ),
              onChanged: (String? newValue) {
                setState(() {
                  description = newValue!;
                });
              },
            ),
            TextFormField(
              initialValue: whatsapp,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Whatsapp',
              ),
              onChanged: (String? newValue) {
                setState(() {
                  whatsapp = newValue!;
                });
              },
            ),
            DropdownButton(
              // Initial Value
              value: dropdownvalue,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: categorylist.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
            TextButton(
                onPressed: () {
                  addNewLesson();
                  log(title);
                },
                child: Text("Submmit "))
          ],
        ),
      ),
    );
  }
}
