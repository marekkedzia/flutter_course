import 'package:flutter/material.dart';
import 'package:savings_app/models/saving_month.dart';
import 'package:savings_app/widgets/bucket.dart';
import 'package:savings_app/widgets/create_saving.dart';
import 'package:savings_app/widgets/savings_list/savings_list.dart';

class Savings extends StatefulWidget {
  const Savings({Key? key}) : super(key: key);

  @override
  _SavingsState createState() => _SavingsState();
}

class _SavingsState extends State<Savings> {
  final List<SavingMonth> _savingsMonths = [];

  void _handleAdd(SavingMonth savingMonth) {
    _savingsMonths.add(savingMonth);
    setState(() {});
  }

  void _handleRemove(int index) {
    SavingMonth saving = _savingsMonths[index];
    setState(() {
      _savingsMonths.removeAt(index);
    });

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color.fromARGB(255, 220, 44, 32),
        content: const Text(
          'Record removed',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        action: SnackBarAction(
          label: "Undo",
          textColor: Colors.white,
          onPressed: () {
            _handleAdd(saving);
          },
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void _openAddSaving() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return CreateSaving(
          render: _handleAdd,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = _savingsMonths.isNotEmpty
        ? Expanded(
            child: SavingsList(
              savingsMonths: _savingsMonths,
              render: _handleRemove,
            ),
          )
        : const Column(
            children: [
              SizedBox(height: 20),
              Center(
                child: Text(
                  "No savings found, get better!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ],
          );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Money is not real',
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        shadowColor: Colors.black.withOpacity(0.7),
        elevation: 5.0,
        backgroundColor: null,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 2, 171, 72),
                Color.fromARGB(255, 0, 121, 51),
              ],
            ),
          ),
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: _openAddSaving,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          SavingBucketItem(
              savingBucket: SavingBucket(savingsMonths: _savingsMonths)),
          mainContent
        ],
      ),
    );
  }
}
