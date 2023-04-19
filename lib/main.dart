import 'package:flutter/material.dart';

import 'card.dart';

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

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   String value ="vasan";
//   void demo()
//   {
//     setState(() {
//     value = "keerthi";
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//       return MaterialApp(
//         home: SafeArea(
//           child: Column(
//             children: <Widget>[
//               Text("$value"),
//               FloatingActionButton(
//                   child:Icon(Icons.add),onPressed: demo)
//             ],
//
//           ),
//
//
//         )
//       );
//   }
// }

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
         // backgroundColor: Colors.deepPurpleAccent
      ),
      body: Column(
        children: const <Widget>[

          Spacer(),
          ElevatedCardExample(),
          FilledCardExample(),
          OutlinedCardExample(),
          Spacer(),
        ],
      ),


    )
    ;
  }
}



/// An example of the elevated card type.
///
/// The default settings for [Card] will provide an elevated
/// card matching the spec:
///
/// https://m3.material.io/components/cards/specs#a012d40d-7a5c-4b07-8740-491dec79d58b
class ElevatedCardExample extends StatelessWidget {
  const ElevatedCardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Card(
        child: SizedBox(
          width: 120,
          height: 150,
          child: Center(child: Text('Elevated Card')),
        ),
      ),
    );
  }
}

/// An example of the filled card type.
///
/// To make a [Card] match the filled type, the default elevation and color
/// need to be changed to the values from the spec:
///
/// https://m3.material.io/components/cards/specs#0f55bf62-edf2-4619-b00d-b9ed462f2c5a
class FilledCardExample extends StatelessWidget {
  const FilledCardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        color: Theme.of(context).colorScheme.surfaceVariant,
        child: const SizedBox(
          width: 120,
          height: 150,
          child: Center(child: Text('Filled Card')),
        ),
      ),
    );
  }
}

/// An example of the outlined card type.
///
/// To make a [Card] match the outlined type, the default elevation and shape
/// need to be changed to the values from the spec:
///
/// https://m3.material.io/components/cards/specs#0f55bf62-edf2-4619-b00d-b9ed462f2c5a
class OutlinedCardExample extends StatelessWidget {
  const OutlinedCardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: const SizedBox(
          width: 120,
          height: 150,
          child: Center(child: Text('Outlined Card')),
        ),
      ),
    );
  }
}

