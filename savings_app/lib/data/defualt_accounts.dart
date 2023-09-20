import 'package:savings_app/models/account.dart';
import 'package:savings_app/models/currency.dart';

final List<Account> defualtAccounts = [
  Account("Santander", Currency.pln),
  Account("Revolut PLN", Currency.pln),
  Account("Revolut EUR", Currency.eur),
  Account("Alior Bank", Currency.pln),
  Account("Lokaty", Currency.pln),
  Account("Konto maklerskie XTB", Currency.pln),
  Account("Konto maklerskie PKO", Currency.pln),
  Account("Konto walutowe USD Santander", Currency.usd),
  Account("Konto walutowe EUR Santander", Currency.eur),
  Account("Konto oszczędnościowe Alior Bank", Currency.pln),
  Account("Konto oszczędnościowe mBank", Currency.pln),
  Account("Gotówka PLN", Currency.pln),
  Account("Gotówka EUR", Currency.eur),
  Account("Gotówka USD", Currency.usd),
  Account("Złoto", Currency.gold),
  Account("Srebro", Currency.silver),
];
