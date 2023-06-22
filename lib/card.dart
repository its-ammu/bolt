import 'package:bolt/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pattern_formatter/pattern_formatter.dart';
import 'package:flutter/services.dart';

class CtDropdown extends StatefulWidget {
  // const Dropdown({Key? key}) : super(key: key);
  String dropdownvalue;
  final List<String> items;

  CtDropdown(this.items, this.dropdownvalue);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CtDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 10, top: 1, right: 10),
        height: 45,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5.0, // soften the shadow
              spreadRadius: 1.0, //extend the shadow
              offset: Offset(
                2.0, // Move to right 10  horizontally
                2.0, // Move to bottom 10 Vertically
              ),
            )
          ],
          //<-- SEE HERE
        ),
        child: new DropdownButtonHideUnderline(
          child: DropdownButton(
            isExpanded: true,
            // Initial Value
            value: widget.dropdownvalue,
            dropdownColor: Colors.white,
            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
            // Array list of items
            items: widget.items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Center(
                  child: Text(
                    items,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                      fontSize: 15.0,
                    ),
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

class AmountEntryWidget extends StatefulWidget {
  @override
  _AmountEntryWidgetState createState() => _AmountEntryWidgetState();
}

class _AmountEntryWidgetState extends State<AmountEntryWidget> {
  late TextEditingController _amountController;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController();
  }

  final _controller = TextEditingController();
  static const _locale = 'en';

  String _formatNumber(String s) =>
      NumberFormat.decimalPattern(_locale).format(int.parse(s));

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

      body : Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Color(0xbaf9fc9c),
            ],
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 150.0),
          Container(
            width: 500,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/rs.png',
                  scale: 1,
                ),
                Container(
                  width: 150,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: "Karla",
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                        letterSpacing: 0.15,
                        color: Colors.black),
                    inputFormatters: [
                      ThousandsFormatter(),
                      LengthLimitingTextInputFormatter(6),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CtDropdown(["card", "cash"], "cash"),
              Image.asset(
                'images/arrow-right.png',
                scale: 1,
              ),
              CtDropdown(["food", "others"], "food"),
            ],
          ),
          SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '12 april, 10:00 am',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.15,
                  height: 1.5,
                  fontFamily: 'Karla',
                  color: Color(0xff686868),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Color(0xffFBFF4A),
                  // Set the background color
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Raleway',
                    fontSize: 18.0, // Set the font size
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),

                  padding: EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10.0), // Set the padding
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  // Handle button press
                },
                child: Text(
                  'save',
                ),
              )
            ],
          ),
        ],
      ),
    )
    );
  }
}
