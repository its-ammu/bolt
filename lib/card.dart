import 'package:bolt/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pattern_formatter/pattern_formatter.dart';
import 'package:flutter/services.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:bolt/pojo.dart';
import 'firebase_services.dart';
import 'package:fluttertoast/fluttertoast.dart';

late String amount;
late String category;

late String payment;
MyClass myObject = MyClass();

String ans="ips near";
void setAmount(amount) {
  amount = amount;
}

String getAmount() {
  return amount;
}

void setCategory(category) {
  print("category" + category);
  category = category;
}

String getCategory() {
  return category;
}

void setPayment(payment) {
  print("payment " + payment);
  payment = payment;
}

String getPayment() {
  return payment;
}

class CtDropdown extends StatefulWidget {
  // const Dropdown({Key? key}) : super(key: key);
  String dropdownvalue;
  String type;
  final List<String> items;

  CtDropdown(this.items, this.dropdownvalue, this.type);

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
              if (widget.type == "category") {
                myObject.category = newValue!;
              } else {
                myObject.payment = newValue!;
              }
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
    print("amount widgey");
    var date = (new DateFormat.d().format(
        DateTime.now()
    ));
    var month =(new DateFormat.MMM().format(
        DateTime.now()
    ));
    var year = (new DateFormat.y().format(
        DateTime.now()
    ));
    String formattedTime = DateFormat('h:mm a').format(DateTime.now());

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

          title:
        Row(
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
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Color(0xbaf9fc9c),
            ],
          )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[ IconButton(
                    padding: EdgeInsets.only(top:0.0,right:340),
                    icon: Icon(Icons.arrow_back, color: Colors.black, // Set the desired color
                        size: 30.0),
                    onPressed: () {
                      // Add your navigation logic here
                      Navigator.pop(context);
                    },
                  )]),
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
                  CtDropdown(["card", "cash"], "cash", "payment"),
                  Image.asset(
                    'images/arrow-right.png',
                    scale: 1,
                  ),
                  CtDropdown(["food", "others"], "food", "category"),
                ],
              ),
              SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(

                    ''+date+' '+month+' '+year+' , '+formattedTime,
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
                      setData(
                          myObject.amount, myObject.category, myObject.payment);
                    },
                    child: Text(
                      'broadcast',
                    ),
                  ),
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

                      Future<String> value = getData();
                      (value.then((value) => (ans=value)));


                    },
                    child: Text(
                      'discover',
                    ),
                  ),
          


                ],
              ),
              Row(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
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
                      print(ans);


                    },
                    child: Text(
                      'ip:'+ans,
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
