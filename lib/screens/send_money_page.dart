import 'package:flutter/material.dart';
import 'package:sample_bank/common_widgets/index.dart';
import 'package:sample_bank/screens/index.dart';
import 'package:sample_bank/stores/login_store.dart';
import 'package:sample_bank/stores/send_money_store.dart';
import 'package:sample_bank/utility/locator.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SendMoneyPage extends StatelessWidget {
  final loginStore = locator<LoginStore>();
  final sendMoneyStore = locator<SendMoneyStore>();
  final TextEditingController _amountController = TextEditingController();

  SendMoneyPage({super.key});

  Future<void> _showLogoutConfirmationDialog(
      BuildContext context, LoginStore loginStore) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // User must tap button!
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to logout?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            TextButton(
              child: const Text('Logout'),
              onPressed: () {
                loginStore.logout().then((_) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Send Money"),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                _showLogoutConfirmationDialog(context, loginStore);
              },
            ),
          ]),
      body: Observer(
        builder: (context) => Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: sendMoneyStore.toggleVisibility,
                  child: Text(sendMoneyStore.isVisible
                      ? 'Current Balance is \$ 5000'
                      : 'Current Balance is  ******'),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Enter the amount to send",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                CommonTextField(
                  textEditingController: _amountController,
                  keyboardType: TextInputType.number,
                  labelText: "Amount greater than 2000 will fail",
                  prefixIcon: const Icon(Icons.attach_money),
                ),
                const SizedBox(height: 24),
                CommonElevatedButton(
                  onPressed: () {
                    final amountText = _amountController.text;
                    if (amountText.isEmpty ||
                        double.tryParse(amountText) == null) {
                      // Show error if input is invalid
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Please enter a valid amount")),
                      );
                    } else {
                      // Simulate sending money
                      bool status = double.tryParse(amountText)! <= 2000;
                      _amountController.text = '';
                      showModalBottomSheet(
                        context: context,
                        builder: (_) => TransactionStatusBottomSheet(
                          transactionStatus: status,
                        ),
                      );
                    }
                  },
                  buttonText: "Send",
                ),
                const SizedBox(height: 24),
                CommonElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TransactionListPage()),
                    );
                  },
                  buttonText: "Transactions",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyTooltip extends StatelessWidget {
  final Widget child;
  final String message;

  const MyTooltip({super.key, required this.child, required this.message});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      child: child,
    );
  }
}
