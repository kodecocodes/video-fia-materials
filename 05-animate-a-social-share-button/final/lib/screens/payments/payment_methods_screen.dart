import 'package:flutter/material.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Methods'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.credit_card),
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/add_card',
          );
        },
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey[300],
            child: const Text(
              'Cards',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          const ListTile(
            leading: CircleAvatar(),
            title: Text('1243 2255 5334 ****'),
            subtitle: Text('Visa'),
            trailing: Icon(Icons.edit),
          ),
          const ListTile(
            leading: CircleAvatar(),
            title: Text('6443 2255 5334 ****'),
            subtitle: Text('MasterCard'),
            trailing: Icon(Icons.edit),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey[300],
            child: const Text(
              'Crypto',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          const ListTile(
            leading: CircleAvatar(),
            title: Text('3EktnHQD7RiAE6uzMj2ZifT9*****'),
            subtitle: Text('Bitcoin'),
            trailing: Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}
