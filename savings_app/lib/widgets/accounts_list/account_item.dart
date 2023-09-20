import 'package:currency_symbols/currency_symbols.dart';
import 'package:flutter/material.dart';
import 'package:savings_app/models/account.dart';
import 'package:flutter/services.dart';
import 'package:savings_app/models/currency.dart';

class AccountItem extends StatelessWidget {
  final Account account;
  const AccountItem({Key? key, required this.account}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.account_balance_wallet),
        title: Text(
          account.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
            'Currency: ${account.currency == Currency.usd ? cSymbol("USD") : account.currency == Currency.eur ? cSymbol("EUR") : cSymbol("PLN")}'),
        trailing: SizedBox(
          width: 70,
          child: TextField(
            onChanged: account.setBalance,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
            ],
          ),
        ),
      ),
    );
  }
}
