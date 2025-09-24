
import 'package:flutter/material.dart';
import 'package:food_ordering_app/core/models/wallet_transaction.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double walletBalance = 100.0;
    final List<WalletTransaction> transactions = [
      WalletTransaction(
        txnId: '1',
        userId: 'user1',
        type: 'topup',
        amount: 100.0,
        currency: 'INR',
        meta: {},
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      WalletTransaction(
        txnId: '2',
        userId: 'user1',
        type: 'payment',
        amount: -28.0,
        currency: 'INR',
        meta: {},
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Current Balance',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              '\$${walletBalance.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Add funds
              },
              child: const Text('Add Funds'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Recent Transactions',
              style: TextStyle(fontSize: 20),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final txn = transactions[index];
                  return ListTile(
                    title: Text(txn.type),
                    subtitle: Text(txn.createdAt.toString()),
                    trailing: Text(
                      '${txn.amount.isNegative ? '' : '+'}\$${txn.amount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: txn.amount.isNegative ? Colors.red : Colors.green,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
