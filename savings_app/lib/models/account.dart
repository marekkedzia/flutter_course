import 'package:savings_app/models/currency.dart';

class Account {
  Account(this.name, this.currency);

  void setBalance(String balance) {
    this.balance = double.parse(balance);
  }

  final String name;
  final Currency currency;
  double balance = 0;
}
