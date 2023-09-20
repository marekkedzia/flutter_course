import 'package:flutter/material.dart';
import 'package:savings_app/models/saving_month.dart';

class SavingBucketItem extends StatelessWidget {
  final SavingBucket savingBucket;

  const SavingBucketItem({Key? key, required this.savingBucket})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.blueGrey[100],
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(Icons.account_balance_wallet,
                          size: 40, color: Colors.blueGrey[700]),
                      const SizedBox(height: 10),
                      Text(
                        '${savingBucket.totalSaved.toStringAsFixed(2)} PLN',
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Total Saved',
                        style: TextStyle(
                            fontSize: 16, color: Colors.blueGrey[700]),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.trending_up,
                          size: 40, color: Colors.blueGrey[700]),
                      const SizedBox(height: 10),
                      Text(
                        '${savingBucket.averageSaved.toStringAsFixed(2)} PLN',
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Average Saved',
                        style: TextStyle(
                            fontSize: 16, color: Colors.blueGrey[700]),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(Icons.star, size: 40, color: Colors.blueGrey[700]),
                      const SizedBox(height: 10),
                      Text(
                        savingBucket.bestSavingMonth,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Best Month',
                        style: TextStyle(
                            fontSize: 16, color: Colors.blueGrey[700]),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.money, size: 40, color: Colors.blueGrey[700]),
                      const SizedBox(height: 10),
                      Text(
                        '${savingBucket.forecastedSavingsInOneYear.toStringAsFixed(2)} PLN',
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Forecasted Annual',
                        style: TextStyle(
                            fontSize: 16, color: Colors.blueGrey[700]),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
