import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sample_bank/common_widgets/common_elevated_button.dart';
import 'package:sample_bank/model/index.dart';
import 'package:sample_bank/screens/index.dart';
import 'package:sample_bank/stores/connectivity_store.dart';
import 'package:sample_bank/stores/login_store.dart';
import 'package:sample_bank/utility/locator.dart';

import '../stores/posts_store.dart';

class TransactionListPage extends StatelessWidget {
  final connectivityStore = locator<ConnectionStore>();
  final loginStore = locator<LoginStore>();
  final postStore = locator<PostStore>();

  TransactionListPage({super.key});

  Widget offLineData() {
    return Padding(
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
    );
  }

  Widget onlineData() {
    postStore.fetchPosts();
    return postStore.isLoading
        ? const Center(child: CircularProgressIndicator())
        : Observer(
            builder: (context) => ListView.builder(
              itemCount: postStore.posts.length,
              itemBuilder: (context, index) {
                final post = postStore.posts[index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.body),
                );
              },
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transaction History"),
      ),
      body: connectivityStore.isConnected ? offLineData() : onlineData(),
    );
  }
}
