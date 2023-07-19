class MyClass {
  String _amount="",_payment="",_category="";
  String _data="";
  String get amount {
    return _amount;
  }
  String get data {
    return _data;
  }

  set data(String value) {
    _data = value;
  }

  set amount(String value) {
    _amount = value;
  }

  String get category {
    return _category;
  }

  set category(String value) {
    _category = value;
  }
  String get payment {
    return _payment;
  }

  set payment(String value) {
    _payment = value;
  }
}