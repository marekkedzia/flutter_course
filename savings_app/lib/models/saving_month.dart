import 'package:savings_app/models/account.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';

const Uuid uuid = Uuid();

const balanceIcons = {
  "increase": Icons.monetization_on,
  "decrease": Icons.money_off,
};

class SavingMonth {
  SavingMonth({
    required this.note,
    required this.accounts,
    required String month,
    required String year,
  })  : id = uuid.v4(),
        name = '$month $year',
        totalSaved = accounts.fold(
            0, (previousValue, element) => previousValue + element.balance);

  double totalSaved;
  final String name;
  final String id;
  final String note;
  final List<Account> accounts;
}

class SavingBucket {
  final double totalSaved;
  final double averageSaved;
  final String bestSavingMonth;
  final double forecastedSavingsInOneYear;

  SavingBucket({
    required savingsMonths,
  })  : totalSaved = savingsMonths.fold(0.0,
            (previousValue, element) => previousValue + element.totalSaved),
        averageSaved = savingsMonths.isNotEmpty
            ? savingsMonths.fold(
                    0.0,
                    (previousValue, element) =>
                        previousValue + element.totalSaved) /
                savingsMonths.length
            : 0.0,
        bestSavingMonth = savingsMonths.isNotEmpty
            ? savingsMonths
                .fold(
                    savingsMonths[0],
                    (previousValue, element) =>
                        previousValue.totalSaved > element.totalSaved
                            ? previousValue
                            : element)
                .name
            : "-",
        forecastedSavingsInOneYear = savingsMonths.isNotEmpty
            ? (savingsMonths.fold(
                        0.0,
                        (previousValue, element) =>
                            previousValue + element.totalSaved) *
                    1.07) +
                (savingsMonths.fold(
                        0.0,
                        (previousValue, element) =>
                            previousValue + element.totalSaved) /
                    savingsMonths.length *
                    12)
            : 0.0;
}
