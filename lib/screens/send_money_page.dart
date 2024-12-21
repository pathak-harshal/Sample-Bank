import 'package:flutter/material.dart';
import 'package:sample_bank/common_widgets/index.dart';
import 'package:sample_bank/screens/index.dart';
import 'package:sample_bank/stores/login_store.dart';
import 'package:sample_bank/utility/locator.dart';

class SendMoneyPage extends StatelessWidget {
  final loginStore = locator<LoginStore>();
  final TextEditingController _amountController = TextEditingController();

  SendMoneyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Send Money"), actions: [
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            loginStore.logout().then((_) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            });
          },
        ),
      ]),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
              labelText: "Amount",
              prefixIcon: const Icon(Icons.attach_money),
            ),
            const SizedBox(height: 24),
            CommonElevatedButton(
              onPressed: () {
                final amountText = _amountController.text;
                if (amountText.isEmpty || double.tryParse(amountText) == null) {
                  // Show error if input is invalid
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Please enter a valid amount")),
                  );
                } else {
                  // Simulate sending money
                  showModalBottomSheet(
                    context: context,
                    builder: (_) => const TransactionStatusBottomSheet(
                      transactionStatus: true,
                    ),
                  );
                }
              },
              buttonText: "Send",
            ),
          ],
        ),
      ),
    );
  }
}
