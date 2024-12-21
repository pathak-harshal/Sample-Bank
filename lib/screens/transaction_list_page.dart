import 'package:flutter/material.dart';
import 'package:sample_bank/model/index.dart';

class TransactionListPage extends StatelessWidget {
  const TransactionListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transaction History"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final transaction = transactions[index];
            return Card(
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Icon(
                  transaction.isSuccessful ? Icons.check_circle : Icons.error,
                  color: transaction.isSuccessful ? Colors.green : Colors.red,
                ),
                title: Text(
                  transaction.description,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "${transaction.date.toLocal()}"
                      .split(' ')[0], // Show only the date
                ),
                trailing: Text(
                  "₱${transaction.amount.toStringAsFixed(2)}",
                  style: TextStyle(
                    color: transaction.isSuccessful ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
