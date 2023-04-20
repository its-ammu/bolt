import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'card.dart';
final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];
void main()
{

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

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          toolbarHeight: 100.0, // double
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurpleAccent, Colors.yellow], stops: [0.5, 1],
              ),
            ),
          ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/thunder.png',
              scale: 5,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'Bolt',
              style: TextStyle(fontSize: 35,fontFamily: "Raleway",color: Colors.white), //<-- SEE HERE
            ),
          ],
        ),
          elevation: 0.0,
      ),
      body:NoonLoopingDemo()



    )
    ;
  }
}

class NoonLoopingDemo extends StatelessWidget {
  const NoonLoopingDemo({super.key});


  @override
  Widget build(BuildContext context) {
    for (var pet in imgList) {
      print(pet);
    }
    return
      Container(
        child:
        Column(
          children: [
             Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(left:50,bottom:10,top:50),

                        child: Text(
                          'Bolt',
                          style: TextStyle(fontSize: 25,fontFamily: "Raleway",color: Colors.red), //<-- SEE HERE
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(right:50,bottom:10,top:50),
                        child:
                        Image.asset(
                          'images/thunder.png',
                          scale: 5,
                        ),
                      ),
                    ),
                  ],
                ),



        Container(
          height:220,
          child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
          return Column(
          children: [

          SizedBox(
          height: 10,
          width: 30,
          ),
          Row(
          children: [
          SizedBox(
          width: 30,
          ),
          Image.asset(
          'images/thunder.png',
          scale: 2,
          ),

          ],
          ),

          ],
          );

          },
          ),
        ),
              ],
        ),



      );
  }
}


