import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:savings_app/data/defualt_accounts.dart';
import 'package:savings_app/models/saving_month.dart';
import 'package:savings_app/widgets/accounts_list/accounts_list.dart';

class CreateSaving extends StatefulWidget {
  final Function render;

  const CreateSaving({Key? key, required this.render}) : super(key: key);

  @override
  _CreateSavingState createState() => _CreateSavingState();
}

class _CreateSavingState extends State<CreateSaving> {
  final _noteController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  String displayDate = "";

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showMonthPicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      initialDate: selectedDate,
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        displayDate = "${DateFormat.MMMM().format(picked)} ${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    displayDate.isEmpty ? "Select Month/Year" : displayDate,
                    style: const TextStyle(
                        fontSize: 16, color: Color.fromARGB(255, 82, 81, 81)),
                  ),
                ),
                IconButton(
                  onPressed: () => _selectDate(context),
                  icon: const Icon(Icons.calendar_today),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _noteController,
            maxLength: 255,
            decoration: const InputDecoration(
              labelText: 'Note',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(child: AccountsList(accounts: defualtAccounts)),
          const SizedBox(height: 10),
          Row(
            children: [
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Cancel'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  widget.render(SavingMonth(
                      note: _noteController.text,
                      accounts: defualtAccounts,
                      month: DateFormat.MMMM().format(selectedDate),
                      year: selectedDate.year.toString()));
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  backgroundColor: const Color.fromARGB(255, 2, 171, 72),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Save'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
