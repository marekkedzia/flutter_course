import 'package:flutter/material.dart';
import 'package:savings_app/models/account.dart';
import 'package:savings_app/widgets/accounts_list/account_item.dart';

class AccountsList extends StatelessWidget {
  final List<Account> accounts;

  const AccountsList({super.key, required this.accounts});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        itemCount: accounts.length,
        itemBuilder: (context, index) => AccountItem(
          account: accounts[index],
        ),
      ),
    );
  }
}
