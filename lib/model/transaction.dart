class Transaction {
  final String id;
  final String description;
  final double amount;
  final DateTime date;
  final bool isSuccessful;

  Transaction({
    required this.id,
    required this.description,
    required this.amount,
    required this.date,
    required this.isSuccessful,
  });
}

final List<Transaction> transactions = [
  Transaction(
    id: '1',
    description: 'Sent to Alice',
    amount: 200.00,
    date: DateTime.now().subtract(const Duration(days: 1)),
    isSuccessful: true,
  ),
  Transaction(
    id: '2',
    description: 'Sent to Bob',
    amount: 150.50,
    date: DateTime.now().subtract(const Duration(days: 2)),
    isSuccessful: false,
  ),
  Transaction(
    id: '3',
    description: 'Received from Charlie',
    amount: 300.75,
    date: DateTime.now().subtract(const Duration(days: 3)),
    isSuccessful: true,
  ),
];
