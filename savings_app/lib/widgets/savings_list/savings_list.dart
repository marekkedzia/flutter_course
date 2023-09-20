import 'package:savings_app/models/saving_month.dart';
import 'package:flutter/material.dart';
import 'package:savings_app/widgets/savings_list/saving_item.dart';

class SavingsList extends StatelessWidget {
  final List<SavingMonth> savingsMonths;
  final Function render;

  const SavingsList(
      {super.key, required this.savingsMonths, required this.render});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: savingsMonths.length,
      itemBuilder: (context, index) => Dismissible(
        onDismissed: (direction) {
          render(index);
        },
        key: ValueKey(savingsMonths[index].id),
        background: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromARGB(255, 220, 44, 32),
          ),
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 4,
          ),
          child: const Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          ),
        ),
        child: SavingItem(
          savingMonth: savingsMonths[index],
        ),
      ),
    );
  }
}
