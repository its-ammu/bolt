import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'firebase_options.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'card.dart';



final List<String> imgList = [
  'https://em-content.zobj.net/thumbs/160/apple/33/shopping-bags_1f6cd.png',
  'https://em-content.zobj.net/thumbs/160/apple/271/house_1f3e0.png',
  'https://em-content.zobj.net/thumbs/160/apple/81/taco_1f32e.png',
  'https://em-content.zobj.net/thumbs/160/apple/96/movie-camera_1f3a5.png',
  'https://em-content.zobj.net/thumbs/160/apple/76/clockwise-rightwards-and-leftwards-open-circle-arrows_1f501.png',
  'https://em-content.zobj.net/thumbs/160/apple/81/heavy-black-heart_2764.png'
];

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.red),
          foregroundColor: Colors.red, //<-- SEE HERE
        ),
      ),
      home: Navbar(),
    ),
  );
}

class TextImageCard extends StatelessWidget {
  final String text;
  final String imageUrl;

  TextImageCard({required this.text, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(imageUrl), // Display the image
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text), // Display the text
          ),
        ],
      ),
    );
  }
}

class ContentDisplay extends StatelessWidget {
  const ContentDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [Container()],
    ));
  }
}

class NoonLoopingDemo extends StatelessWidget {
   const NoonLoopingDemo({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 39),
      width: 340,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 0, top: 19),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Expenses',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Raleway",
                          color: Colors.black,
                          letterSpacing: 0.15,
                          height: 1.5,
                          fontWeight: FontWeight.w700,
                        ), //<-- SEE HERE
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Dropdown(["week", "month"], "week"),
                      const SizedBox(
                        width: 3,
                      ),
                      Dropdown(["food", "other", "credit"], "other"),
                      // Dropdown(["ll","k"]),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 330,
            child: ListView(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Padding(
                            padding: EdgeInsets.only(left: 50, bottom: 10, top: 35),
                            child: Text(
                              'may 2023',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: "Karla",
                                color: Colors.black,
                                letterSpacing: 0.15,
                                fontWeight: FontWeight.w500,
                              ), //<-- SEE HERE
                            ),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: EdgeInsets.only(right: 50, bottom: 10, top: 35),
                            child: Image.asset(
                              'images/add.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, top: 6, bottom: 14),
                            child: Container(
                              child: Image.asset(
                                'images/Rectangle 5.png',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: imgList.length,
                        itemBuilder: (BuildContext context, int index) {
                          // if (index == itemLength - 1) // here will be the logic
                          {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                  width: 30,
                                ),
                                Row(
                                  children: [
                                    // Icxon(Icons.arrow_back),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      width: 80,
                                      height: 110,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 40,
                                            child: Image.network(
                                                imgList[index],
                                            ),
                                          ),

                                          SizedBox(height: 8),
                                          Text(
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: "Raleway",
                                                color: Colors.white,
                                                letterSpacing: 0.15,
                                                height: 1.5,
                                                fontWeight: FontWeight.w700,
                                              ),
                                              "data")
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Padding(
                            padding: EdgeInsets.only(left: 50, bottom: 10, top: 35),
                            child: Text(
                              'june 2023',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: "Karla",
                                color: Colors.black,
                                letterSpacing: 0.15,
                                fontWeight: FontWeight.w500,
                              ), //<-- SEE HERE
                            ),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: EdgeInsets.only(right: 50, bottom: 10, top: 35),
                            child: Image.asset(
                              'images/add.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, top: 6, bottom: 14),
                            child: Container(
                              child: Image.asset(
                                'images/Rectangle 5.png',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: imgList.length,
                        itemBuilder: (BuildContext context, int index) {
                          // if (index == itemLength - 1) // here will be the logic
                          {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                  width: 30,
                                ),
                                Row(
                                  children: [
                                    // Icxon(Icons.arrow_back),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      width: 80,
                                      height: 110,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 40,
                                            child: Image.network(
                                              imgList[index],
                                            ),
                                          ),

                                          SizedBox(height: 8),
                                          Text(
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: "Raleway",
                                                color: Colors.white,
                                                letterSpacing: 0.15,
                                                height: 1.5,
                                                fontWeight: FontWeight.w700,
                                              ),
                                              "data")
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ]

            ),
          ),


        ],
      ),
    );
  }
}

class Dropdown extends StatefulWidget {
  // const Dropdown({Key? key}) : super(key: key);
  String dropdownvalue;
  final List<String> items;

  Dropdown(this.items, this.dropdownvalue);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Dropdown> {

  @override
  Widget build(BuildContext context) {

    return Container(
        padding: EdgeInsets.only(left: 10, top: 1, right: 10),
        height: 28,
        width: 95,
        decoration: BoxDecoration(
          color: Color(0xff2D2D2D),
          borderRadius: BorderRadius.circular(20), //<-- SEE HERE
        ),
        child: new DropdownButtonHideUnderline(
          child: DropdownButton(
            // Initial Value
            value: widget.dropdownvalue,
            dropdownColor: Color(0xff2D2D2D),
            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
            // Array list of items
            items: widget.items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(
                  items,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w700,
                    fontSize: 15.0,
                  ),
                ),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              setState(() {
                widget.dropdownvalue = newValue!;
              });
            },
          ),
        ));
  }
}

class Navbar extends StatelessWidget {
   Navbar({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          bottomOpacity: 0.0,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 100.0,
          // double
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/main_icon.png',
                scale: 1,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Bolt',
                style: TextStyle(
                    fontSize: 35,
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.15,
                    color: Colors.black),

              ),
            ],
          ),
        ),


        // body: AmountEntryWidget());
    body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.white,
              Color(0xbaf9fc9c),
            ],
          )
      ),
      child: Column(
        children: [
          Stack(clipBehavior: Clip.none, children: [
            Container(
              constraints: new BoxConstraints(
                minHeight: 113,
                maxHeight: 130,
              ),
              margin: EdgeInsets.only(top: 50.0, left: 47, right: 47),
              padding: EdgeInsets.all(20),
              decoration: new BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(19),
              ),
              child: Row(
                children: [
                  Expanded(
                      child: Column(children: [
                    Text(
                      'Current Spends',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        fontSize: 15.0,
                        height: 2.5,
                      ),
                    ),
                    Text(
                      '₹' + '1000.00',
                      style: TextStyle(
                        color: Color(0xffFBFF4A),
                        fontFamily: 'Karla',
                        fontWeight: FontWeight.w700,
                        fontSize: 25.0,
                        height: 1.5,
                      ),
                    )
                  ])),
                  Expanded(
                      child:
                          // Second column content
                          Column(children: [
                    // Dropdown(),
                  ])),
                ],
              ),
            ),
            Positioned(
                bottom: 92,
                right: 60,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Dropdown(["week", "month"], "week"),
                    ],
                  ),
                )),
            Positioned(
                bottom: -18,
                right: 55,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 0,
                      ),
                      Image.asset(
                        'images/man_with_board.png',
                        scale: 0.9,
                      ),
                    ],
                  ),
                ))
          ]),
          NoonLoopingDemo(),
          Expanded(
            child: GestureDetector(
              onVerticalDragUpdate: (dragUpdateDetails) {
                Navigator.push(context, (new MaterialPageRoute(builder: (BuildContext context) => new AmountEntryWidget())));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.transparent

                ),
                padding: EdgeInsets.only(top:50),
                width: double.infinity,
                child: Column(
                  children: [
                    Icon(Icons.keyboard_arrow_up, color: Colors.black),
                    Text(
                        "Swipe up to add expense",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Raleway",
                        color: Colors.black,
                        letterSpacing: 0.15,
                        height: 1.5,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    ));
  }
}
