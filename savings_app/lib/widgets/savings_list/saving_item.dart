import 'package:flutter/material.dart';
import 'package:savings_app/models/saving_month.dart';

class SavingItem extends StatelessWidget {
  const SavingItem({Key? key, required this.savingMonth}) : super(key: key);

  final SavingMonth savingMonth;

  bool get isBalancePositive => savingMonth.totalSaved > 0;
  bool get isBalanceNegative => savingMonth.totalSaved < 0;

  Color _getStartGradientColor() {
    if (isBalancePositive) {
      return const Color.fromARGB(255, 1, 125, 44);
    } else if (isBalanceNegative) {
      return const Color.fromARGB(255, 242, 85, 85);
    }
    return const Color.fromARGB(255, 255, 206, 10);
  }

  Color _getEndGradientColor() {
    if (isBalancePositive) {
      return const Color.fromARGB(255, 1, 158, 67);
    } else if (isBalanceNegative) {
      return const Color.fromARGB(255, 227, 60, 60);
    }
    return const Color.fromARGB(255, 255, 176, 0);
  }

  Widget _buildTrailingContent() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          isBalancePositive ? Icons.monetization_on : Icons.money_off,
          color: Colors.white,
          size: 24.0,
        ),
        const SizedBox(width: 8.0),
        Text(
          '${savingMonth.totalSaved.toString()} PLN',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      clipBehavior: Clip.antiAlias,
      color: _getStartGradientColor(),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [_getStartGradientColor(), _getEndGradientColor()],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          title: Text(
            savingMonth.name,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.white),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              savingMonth.note,
              style: const TextStyle(fontSize: 16.0, color: Colors.white),
            ),
          ),
          trailing: _buildTrailingContent(),
        ),
      ),
    );
  }
}
