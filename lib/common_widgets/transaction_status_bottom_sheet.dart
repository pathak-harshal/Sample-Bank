import 'package:flutter/material.dart';

class TransactionStatusBottomSheet extends StatelessWidget {
  final bool transactionStatus;
  const TransactionStatusBottomSheet(
      {super.key, required this.transactionStatus});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 300,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            transactionStatus ? Icons.check_circle : Icons.error,
            size: 60,
            color: transactionStatus ? Colors.green : Colors.red,
          ),
          const SizedBox(height: 16),
          Text(
            transactionStatus ? "Transaction Successful" : "Transaction Failed",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: transactionStatus ? Colors.green : Colors.red,
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
