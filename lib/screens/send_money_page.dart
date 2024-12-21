import 'package:flutter/material.dart';
import 'package:sample_bank/common_widgets/common_elevated_button.dart';
import 'package:sample_bank/common_widgets/index.dart';

class SendMoneyPage extends StatelessWidget {
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Send Money"),
      ),
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
                    builder: (_) => _buildResultSheet(context, true),
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

  Widget _buildResultSheet(BuildContext context, bool success) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            success ? Icons.check_circle : Icons.error,
            size: 60,
            color: success ? Colors.green : Colors.red,
          ),
          const SizedBox(height: 16),
          Text(
            success ? "Transaction Successful" : "Transaction Failed",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: success ? Colors.green : Colors.red,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Close the bottom sheet
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurpleAccent,
            ),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}
